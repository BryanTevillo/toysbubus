# ToysBubus 🧸

**ToysBubus** es un monorepo fullstack moderno que combina un backend robusto con Serverpod y un cliente Flutter de nueva generación. Diseñado con arquitectura profesional por capas, sigue estándares de código limpio y documentación automática.

---

## 📋 Contenido del Proyecto

```
toysbubus/
├─ toysbubus_server/          Backend Serverpod (3.3.1)
├─ toysbubus_client/          Cliente Dart/RPC
├─ toysbubus_flutter/         Frontend Flutter (en desarrollo)
├─ docs/                       Documentación del proyecto
│  ├─ architecture/            Diagramas y referencias de diseño
│  ├─ decisions/               Registro de decisiones técnicas (ADR)
│  └─ dev-log.md              Registro de cambios y problemas resueltos
├─ .github/
│  └─ workflows/              CI/CD y configuraciones
└─ docker-compose.yaml        Servicios: Postgres, Redis
```

---

## 🔧 Requisitos Previos

- **Dart SDK:** `^3.8.0`
- **Flutter:** última versión estable
- **Docker & Docker Compose:** para servicios locales
- **Serverpod CLI:** `dart pub global activate serverpod_cli`

---

## 🚀 Quick Start

### 1. Clonar y Configurar Ambiente

```bash
git clone <repo-url>
cd toysbubus
dart pub get
```

### 2. Iniciar Servicios (Postgres + Redis)

```bash
docker compose up -d
```

### 3. Ejecutar Migraciones y Serverpod

```bash
cd toysbubus_server
dart bin/main.dart --apply-migrations
```

El servidor estará disponible en `http://localhost:8080`

### 4. Ejecutar el Cliente Flutter

```bash
cd ../toysbubus_flutter
flutter run
```

---

## 🏗️ Arquitectura Backend

El backend sigue una **arquitectura por capas profesional**:

```
Request → Endpoint → Service → Repository → Database
```

### Capas Implementadas

| Capa | Ubicación | Responsabilidad |
|------|-----------|-----------------|
| **Endpoint** | `lib/src/endpoints/` | Recibir solicitudes HTTP/RPC, sin lógica |
| **Service** | `lib/src/services/` | Lógica de negocio, orquestación, excepciones |
| **Repository** | `lib/src/repositories/` | Acceso a datos, queries, persistencia |
| **Models** | `lib/src/models/` | Esquemas YAML generados por Serverpod |
| **Exceptions** | `lib/src/exceptions/` | Excepciones serializables, manejo de errores |

> **Principios:** No mezclar responsabilidades, endpoints delgados, código testeable.

Para más detalles, ver [Arquitectura Backend](docs/architecture/server.md).

---

## 📦 Workspace Dart

El proyecto usa **Dart workspaces** para gestionar los tres packages como una unidad:

- **toysbubus_server:** Serverpod backend
- **toysbubus_client:** Cliente RPC autogenerado
- **toysbubus_flutter:** Aplicación Flutter cliente

Cambios en dependencias compartidas afectan todo el proyecto automáticamente.

---

## 📝 Documentación

La documentación se mantiene sincronizada con el código:

- **[Arquitectura](docs/architecture/)** – Diseño de sistemas, diagramas
- **[Decisiones Técnicas (ADR)](docs/decisions/adr-log.md)** – Por qué se toman las decisiones
- **[Dev Log](docs/dev-log.md)** – Problemas resueltos, lecciones aprendidas
- **[Setup](docs/setup.md)** – Instrucciones de instalación y configuración
- **[Workflow](docs/workflow.md)** – Procesos Git y trabajo en equipo
- **[Dependencias](docs/dependencies.md)** – Justificación de librerías usadas

---

## 🔄 Flujo de Desarrollo

### Commits Semánticos

Usamos **Conventional Commits** para commit messages claros:

```bash
feat(auth): add JWT validation service
fix(docker): correct container startup command
docs(server): update architecture after refactor
refactor(db): optimize repository queries
chore(deps): update Serverpod to 3.3.1
```

### Crear Feature

```bash
git checkout -b feat/nombre-feature
# Hacer cambios...
git add .
git commit -m "feat(scope): descripción"
git push origin feat/nombre-feature
```

### Documentar Cambios

Después de cambios significativos:
- Actualizar `docs/architecture/` si afecta diseño
- Agregar entrada en `docs/dev-log.md` si fue un problema/solución
- Registrar decisión en `docs/decisions/adr-log.md` si fue elección técnica

---

## 🐳 Docker

### Servicios

- **PostgreSQL 15** en puerto `5432`
- **Redis 7** en puerto `6379`

### Comandos Útiles

```bash
# Iniciar servicios
docker compose up -d

# Ver logs
docker compose logs -f postgres

# Detener servicios
docker compose stop

# Limpiar todo
docker compose down -v
```

---

## 🧪 Testing

### Backend (Serverpod)

```bash
cd toysbubus_server
dart test
```

### Flutter

```bash
cd toysbubus_flutter
flutter test
```

---

## ⚠️ Seguridad

- **Nunca** hardcodear secrets en el código
- Usar `.env` o `config/passwords.yaml` (no versionado)
- Variables de entorno en `docker-compose.override.yaml`
- Auditoría de dependencias antes de actualizar

---

## 🛠️ Herramientas y Scripts

### Generar Código (Serverpod)

```bash
cd toysbubus_server
serverpod generate
```

### Análisis de Código

```bash
dart analyze
dart format lib/ --set-exit-if-changed
```

### Migraciones

```bash
cd toysbubus_server
serverpod create-migration --name <nombre>
dart bin/main.dart --apply-migrations
```

---

## 📚 Referencias

- [Documentación Serverpod 3.3.1](https://docs.serverpod.dev)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Best Practices](https://flutter.dev/docs/development/best-practices)
- [ADR Template](docs/decisions/adr-log.md)

---

## 📞 Contribuyendo

1. **Fork** el repositorio
2. **Crea rama** `feat/tu-feature` o `fix/bug-fix`
3. **Haz cambios** siguiendo la arquitectura
4. **Documen** cambios significativos
5. **Commit** con semántica: `feat(scope): descripción`
6. **Push** y abre Pull Request

---

## 📄 Licencia

[MIT](LICENSE)

---

**Última actualización:** 18 de febrero de 2026
