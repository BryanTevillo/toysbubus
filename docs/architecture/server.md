# Arquitectura Backend – ToysBubus Server

Documentación de la arquitectura del backend Serverpod, incluyendo capas, responsabilidades, patrones y flujo de datos.

---

## 📐 Flujo General: Request → Response

```a
┌─────────────────────────────────────────────────────┐
│  Cliente (Flutter / RPC)                            │
└────────────────────────┬────────────────────────────┘
                         │ HTTP/RPC Call
                         ▼
┌─────────────────────────────────────────────────────┐
│  1. ENDPOINT LAYER                                  │
│  • Recibe solicitud HTTP/RPC                        │
│  • Valida parámetros básicos                        │
│  • Llama a Service (sin lógica)                     │
└────────────────────────┬────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────┐
│  2. SERVICE LAYER                                   │
│  • Lógica de negocio pura                           │
│  • Orquesta reglas y validaciones                   │
│  • Llama a Repository                              │
│  • Lanza excepciones serializables                  │
└────────────────────────┬────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────┐
│  3. REPOSITORY / DATA LAYER                         │
│  • Acceso a datos (Postgres)                        │
│  • Queries optimizadas                              │
│  • Persistencia, updates, deletes                   │
└────────────────────────┬────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────┐
│  4. DATABASE (Postgres)                             │
│  • Persistencia de datos                            │
└─────────────────────────────────────────────────────┘

Response viaja de vuelta: Repository → Service → Endpoint → Cliente
```

---

## 🏗️ Capas de Arquitectura

### 1️⃣ Endpoint Layer

**Ubicación:** `lib/src/endpoints/`

**Responsabilidades:**

- Exponer métodos RPC que serán llamados desde el cliente
- Recibir parámetros de la solicitud
- **NUNCA** contener lógica de negocio
- Delegar todo a Service
- Retornar respuestas (modelos o excepciones)

**Características:**

```dart
/// Endpoint para autenticación
class AuthEndpoint extends Endpoint {
  /// Autentica usuario con email/password
  /// Retorna token JWT en caso de éxito
  /// Lanza [InvalidCredentialsException] si fallan
  Future<AuthResponse> login(String email, String password) async {
    return await authService.login(email, password);
  }
}
```

**Reglas Estrictas:**

- ✅ Validar tipos de parámetros
- ✅ Llamar exactamente a un Service
- ✅ Dejar errores para Service/Repository
- ❌ No queries directas a DB
- ❌ No cálculos o transformaciones complejas

---

### 2️⃣ Service Layer

**Ubicación:** `lib/src/services/`

**Responsabilidades:**

- Implementar todas las reglas de negocio
- Validaciones complejas
- Coordinar múltiples Repositories
- Obtener datos, procesarlos, retornarlos
- Manejar y lanzar excepciones serializables

**Características:**

```dart
/// Servicio de autenticación
class AuthService {
  /// Autentica usuario verificando email/password
  /// Genera token JWT si válido
  /// Lanza excepciones si credenciales son inválidas
  Future<AuthResponse> login(String email, String password) async {
    // Validar email existe
    final user = await userRepository.findByEmail(email);
    if (user == null) {
      throw InvalidCredentialsException('Email no registrado');
    }
    
    // Validar password
    if (!_verifyPassword(password, user.passwordHash)) {
      throw InvalidCredentialsException('Contraseña incorrecta');
    }
    
    // Generar token
    final token = _generateJWT(user);
    return AuthResponse(token: token, userId: user.id);
  }
  
  /// Genera JWT para usuario
  String _generateJWT(User user) {
    // Lógica JWT...
  }
  
  /// Verifica password contra hash
  bool _verifyPassword(String password, String hash) {
    // Verificación crypto...
  }
}
```

**Patrones:**

- Inyección de dependencias (Repository)
- Transacciones para operaciones multi-paso
- Logging de eventos importantes
- Caché cuando aplique

---

### 3️⃣ Repository / Data Layer

**Ubicación:** `lib/src/repositories/`

**Responsabilidades:**

- Acceso exclusivo a base de datos
- Queries SQL optimizadas
- CRUD básico (Create, Read, Update, Delete)
- Transacciones atómicas
- Índices y performance

**Características:**

```dart
/// Repositorio para usuarios
class UserRepository {
  final session = ServerpodSession();
  
  /// Obtiene usuario por email
  Future<User?> findByEmail(String email) async {
    return await User.db.findFirstRow(
      session,
      where: (u) => u.email.equals(email),
    );
  }
  
  /// Crea usuario nuevo
  Future<User> create(User user) async {
    return await User.db.insertRow(session, user);
  }
  
  /// Actualiza usuario
  Future<void> update(User user) async {
    await User.db.updateRow(session, user);
  }
  
  /// Obtiene usuarios por rol
  Future<List<User>> findByRole(String role) async {
    return await User.db.find(
      session,
      where: (u) => u.role.equals(role),
      orderBy: (u) => u.createdAt,
    );
  }
}
```

**Reglas:**

- ✅ Queries simples y legibles
- ✅ Usar ORM (Serverpod DB)
- ✅ Índices en campos frecuentes
- ✅ Manejar null correctamente
- ❌ No lógica de negocio
- ❌ No transformaciones complejas

---

### 4️⃣ Models

**Ubicación:** `lib/src/models/`

**Definición:** YAML compilado a Dart

**Características:**

```yaml
# Archivo: lib/src/models/user.yaml
class: User
table: users
fields:
  id: int
  email: String
  name: String
  passwordHash: String
  role: String
  createdAt: DateTime
  updatedAt: DateTime
```

Se genera automáticamente con:

```bash
serverpod generate
```

**Reglas:**

- ✅ Definir en YAML
- ✅ Mantener simple
- ❌ No lógica compleja en métodos
- ❌ No cálculos derivados

---

### 5️⃣ Exceptions

**Ubicación:** `lib/src/exceptions/`

**Definición:** Excepciones serializables generadas desde YAML

**Características:**

```yaml
# Archivo: lib/src/exceptions/auth_exceptions.yaml
class: InvalidCredentialsException
fields:
  message: String

class: TokenExpiredException
fields:
  message: String
  expiresAt: DateTime
```

Se usan en Service para retornar errores claros:

```dart
class AuthService {
  Future<AuthResponse> login(String email, String password) async {
    if (!validCredentials) {
      throw InvalidCredentialsException('Email o contraseña incorrectos');
    }
  }
}
```

El cliente recibe excepción serializada.

---

## 🔄 Ejemplo Completo: Crear Usuario

### 1. Endpoint recibe solicitud

```dart
class UsersEndpoint extends Endpoint {
  Future<User> createUser(String email, String name, String password) async {
    return await userService.registerUser(email, name, password);
  }
}
```

### 2. Service implementa lógica

```dart
class UserService {
  Future<User> registerUser(String email, String name, String password) async {
    // Validar email no exista
    final existing = await userRepository.findByEmail(email);
    if (existing != null) {
      throw EmailAlreadyExistsException('Email ya está registrado');
    }
    
    // Validar password
    if (password.length < 8) {
      throw WeakPasswordException('Mínimo 8 caracteres');
    }
    
    // Hashear password
    final hash = await _hashPassword(password);
    
    // Crear usuario
    final user = User(
      email: email,
      name: name,
      passwordHash: hash,
      role: 'user',
      createdAt: DateTime.now(),
    );
    
    return await userRepository.create(user);
  }
}
```

### 3. Repository persiste

```dart
class UserRepository {
  Future<User> create(User user) async {
    return await User.db.insertRow(session, user);
  }
}
```

---

## 📊 Decisiones de Diseño

| Decisión | Motivo |
| ---------- | -------- |
| **Capas separadas** | Facilita testing, mantenimiento, escalabilidad |
| **No lógica en Endpoint** | Endpoints son fáciles de testear si solo delegales |
| **Excepciones serializables** | Cliente recibe errores estructurados |
| **Repository pattern** | Desacoplamiento del ORM, fácil cambiar DB |
| **Modelos en YAML** | Generación automática, menos boilerplate |

---

## 🧪 Testing

### Test de Endpoint

```dart
test('create user endpoint', () async {
  // Mock Service
  final mockService = MockUserService();
  final endpoint = UsersEndpoint();
  endpoint.userService = mockService;
  
  // Execute
  final user = await endpoint.createUser('test@example.com', 'John', 'password123');
  
  // Verify
  expect(user.email, 'test@example.com');
});
```

```dart
test('register user validates password', () async {
  final service = UserService();
  
  expect(
    () => service.registerUser('test@example.com', 'John', 'weak'),
    throwsA(isA<WeakPasswordException>()),
  );
});
```

---

## 📚 Principios Aplicados

✅ **SOLID:**

- **S**: Cada clase/service una responsabilidad
- **O**: Abierto a extensión (nuevo Services)
- **L**: Liskov Substitution (interfaces claras)
- **I**: Segregación de interfaces
- **D**: Inyección de dependencias

✅ **Clean Code:**

- Nombres claros y descriptivos
- Funciones pequeñas y enfocadas
- Sin código duplicado (DRY)
- Comentarios cuando sea necesario

✅ **Best Practices Serverpod:**

- Usar ORM nativo
- Validación en Service
- Excepciones en YAML
- Testing automático

---

## 🔗 Referencias

- [Serverpod Architecture](https://docs.serverpod.dev/learn/architecture)
- [Clean Code - Robert C. Martin](https://www.oreilly.com/library/view/clean-code-a/9780136083238/)
- [Design Patterns - Gang of Four](https://refactoring.guru/design-patterns)

---

**Versión:** 1.0
**Última actualización:** 18 de febrero de 2026
