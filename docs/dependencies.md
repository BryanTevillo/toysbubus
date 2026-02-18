# Dependencies – Dependencias del Proyecto

Registro de todas las dependencias externas, su propósito y justificación de elección.

---

## 🎯 Dependencias Principales

### Backend (toysbubus_server)

#### Serverpod 3.3.1

**Propósito:** Framework RPC backend
**Motivo:**

- RPC type-safe entre backend y cliente Flutter
- ORM integrado para Postgres
- Generación automática de código
- Migraciones de DB automáticas
- WebSocket support out-of-box
- Actualmente en v3.3.1 (November 2025)

**Referencias:**

- [Serverpod Docs](https://docs.serverpod.dev)
- [GitHub](https://github.com/serverpod/serverpod)

#### Serverpod Auth IDP

Server 3.3.1
**Propósito:** Autenticación con IDP (Identity Providers)
**Motivo:**

- Soporte para OAuth 2.0 / OpenID Connect
- Integración con Google, Apple, etc.
- Manejo de sessions de forma segura
- Compatible con JWT

**Compatible con:** Serverpod 3.3.1

#### Serverpod OpenAPI ^0.0.3

**Propósito:** OpenAPI 3.0 specification generator para endpoints
**Motivo:**

- Genera especificación OpenAPI automáticamente
- Integración con Swagger UI
- Documentación interactiva de APIs
- Compatible con Postman/herramientas externas
- Facilita testing y debugging

**Referencias:**

- [pub.dev/packages/serverpod_openapi](https://pub.dev/packages/serverpod_openapi)

---

### Cliente (toysbubus_client)

Auto-generado desde `serverpod generate`:

- `serverpod_client` - Cliente RPC type-safe
- `serverpod_serialization` - Serialización de modelos

**Manual:** Ninguna (todo se genera)

---

### Frontend (toysbubus_flutter)

#### Flutter SDK

**Propósito:** Framework UI cross-platform
**Motivo:**

- Compilación a iOS, Android, Web, Desktop
- Hot reload para development rápido
- Large ecosystem de paquetes
- Comunidad activa
- Rendimiento nativo

**Versión:** Última stable

#### Serverpod Flutter Client

Auto-generado, incluye:

- `serverpod` (flutter) - Cliente para conectarse a backend
- CRUD automático
- Real-time updates con WebSocket
- Local persistence ready

**Manual:** Ninguna (todo se genera)

---

## 📦 Dependencias de Desarrollo

### Backend Development (toysbubus_server)

#### Lints >= 3.0.0 < 7.0.0

**Propósito:** Lint rules para Dart
**Motivo:**

- Análisis estático de código
- Mejora calidad y consistencia
- Recomendaciones de Dart oficial

```bash
dart analyze
```

#### Serverpod Test 3.3.1

**Propósito:** Testing framework para backend
**Motivo:**

- Tests para endpoints y services
- Mock de base de datos
- Integración con test framework estándar

**Uso:**

```bash
dart test test/services/auth_service_test.dart
```

#### Test >= 1.25.5

**Propósito:** Testing framework Dart
**Motivo:**

- Unit testing
- Widget testing
- Integration testing
- Reportes de coverage

---

## 🔧 Herramientas de Desarrollo

### Serverpod CLI

```bash
dart
 pub global activate serverpod_cli
```

**Para:**

- Generar código automático
- Crear migraciones
- Comandos Serverpod

**Uso:**

```bash
serverpod generate
serverpod create-migration --name add_email_field
```

### Dart SDK Tools

```bash
# Análisis
dart analyze

# Formato
dart format lib/

# Linting automático
dart fix --apply
```

### Flutter Doctor

```bash
flutter doctor
```

Verifica setup de Flutter y dependencias del sistema.

---

## 🔐 Dependencias de Seguridad

Ninguna explícita aún (agregarse cuando sea necesario):

### Posibles Candidate para Futuro

- `bcrypt` - Hashing de passwords
- `crypto` - Operaciones criptográficas
- `http` - Cliente HTTP (si expande beyond RPC)
- `args` - Parsing de arguments (CLI)

---

## 📱 Dependencias Opcionales (Futuro)

### Por Implementar Según Roadmap

| Feature | Dependencia | Versión | Motivo |
| --------- | ------------- | --------- | -------- |
| Persistencia Local | `drift` | ^2.0.0 | Local DB con SQLite |
| Estado Global | `riverpod` | ^2.0.0 | State management Flutter |
| Storage Seguro | `flutter_secure_storage` | ^9.0.0 | Guardar tokens/secrets |
| Analytics | `firebase_analytics` | ^10.0.0 | Tracking de eventos |
| Push Notifications | `firebase_messaging` | ^14.0.0 | Notificaciones cloud |
| Image Cache | `cached_network_image` | ^3.0.0 | Caché de imágenes |

---

## 🚀 Actualización de Dependencias

### Chequear Actualizaciones

```bash
# Backend
cd toysbubus_server
dart pub outdated

# Flutter
cd ../toysbubus_flutter
flutter pub outdated
```

### Actualizar

```bash
# Actualizar all
dart pub upgrade

# Actualizar específico
dart pub upgrade serverpod

# Actualizar a versión exacta
dart pub upgrade --major-versions
```

### Política de Updates

- ✅ Patch updates (3.3.0 → 3.3.1): Automático
- ⚠️ Minor updates (3.3 → 3.4): Revisar changelog
- 🔴 Major updates (3.x → 4.x): Evaluar breaking changes

---

## 🔍 Auditoría de Seguridad

### Verificar Vulnerabilidades Conocidas

```bash
# Backend
cd toysbubus_server
dart pub outdated
# Buscar en pub.dev cada dependencia

# Flutter
cd ../toysbubus_flutter
flutter pub outdated
```

### Proceso

1. Revisar [pub.dev](https://pub.dev) para cada dependency
2. Buscar security advisories
3. Mantener al día versiones estables
4. Reportar vulnerabilidades en GitHub issues

---

## 📊 Dependency Graph

```a
toysbubus (workspace)
├── toysbubus_server
│   ├── serverpod 3.3.1
│   ├── serverpod_auth_idp_server 3.3.1
│   ├── lints >= 3.0.0
│   ├── serverpod_test 3.3.1
│   └── test >= 1.25.5
│
├── toysbubus_client (auto-generated)
│   ├── serverpod_client (auto)
│   └── serverpod_serialization (auto)
│
└── toysbubus_flutter
    ├── flutter_sdk
    ├── dart_sdk >= 3.8.0
    └── serverpod (flutter client, auto-generated)
```

---

## 🎯 Compatibilidad

| Componente | Versión | SDK Dart | SDK Flutter |
| ------------ | --------- | ---------- | ------------ |
| toysbubus_server | 3.3.1 | ^3.8.0 | N/A |
| toysbubus_client | Auto | ^3.8.0 | N/A |
| toysbubus_flutter | - | ^3.8.0 | 3.19+ |

> Workspace resolution: `resolution: workspace` - todas las dependencias se sincronizan.

---

## ❓ FAQ

**P: ¿Por qué Serverpod y no Firebase?**
A: Serverpod da control total del backend, privacidad de datos, y tipo-safety completo.

**P: ¿Cuándo actualizar Serverpod?**
A: Revisar changelog, hacer backup DB, test completo, después actualizar en todas partes.

**P: ¿Cómo agregar nueva librería?**
A: Propuso en issue, discutir, después `dart pub add nombre`, update dev-log.md, commit.

**P: ¿Qué pasa si hay conflicto de versiones?**
A: Workspace resolution manage conflictos automáticamente. Si hay problema, `dart pub get --offline`.

---

**Versión:** 1.0
**Última actualización:** 18 de febrero de 2026
**Responsable de Mantenimiento:** Equipo de Backend
