# Setup – Instrucciones de Instalación

Guía para configurar el ambiente local y ejecutar ToysBubus en tu máquina.

---

## 📋 Requisitos Previos

### Sistema Operativo
- **Windows 10+**, **macOS 12+**, o **Linux** (Ubuntu 20.04+)

### Software Requerido

| Software | Versión | Propósito |
|----------|---------|----------|
| Dart SDK | `^3.8.0` | Lenguaje backend y cliente |
| Flutter | Última estable | Framework UI |
| Docker | 20.10+ | Ejecutar Postgres y Redis |
| Docker Compose | 2.0+ | Orquestar contenedores |
| Git | 2.30+ | Control de versión |
| VS Code / IDE | Cualquiera | Editor |

### Instalación de Requisitos

#### 1. Dart SDK
Descarga desde [dart.dev/get-dart](https://dart.dev/get-dart)

```bash
# Verificar instalación
dart --version
# Esperado: Dart SDK version 3.8.x
```

#### 2. Flutter
Descarga desde [flutter.dev/docs/get-started](https://flutter.dev/docs/get-started)

```bash
# Verificar instalación
flutter --version
# También instala Dart acoplado

# Ejecutar doctor
flutter doctor
```

#### 3. Docker
Descarga desde [docker.com](https://www.docker.com/products/docker-desktop)

```bash
# Verificar instalación
docker --version
docker compose --version
```

#### 4. Serverpod CLI (Opcional, pero recomendado)
```bash
dart pub global activate serverpod_cli
```

---

## 🚀 Instalación Local

### Paso 1: Clonar Repositorio

```bash
git clone https://github.com/tu-usuario/toysbubus.git
cd toysbubus
```

### Paso 2: Restaurar Dependencias

```bash
# Desde raíz del proyecto (workspace)
dart pub get

# O específicamente en cada paquete
cd toysbubus_server && dart pub get
cd ../toysbubus_client && dart pub get
cd ../toysbubus_flutter && flutter pub get
```

### Paso 3: Iniciar Servicios Docker

```bash
# Desde raíz
docker compose up -d

# Verificar contenedores están corriendo
docker compose ps
# Deberías ver: postgres | redis
```

### Paso 4: Ejecutar Migraciones (Primero si es primera vez)

```bash
cd toysbubus_server

# Generar código Serverpod
serverpod generate
# O: dart run serverpod_cli generate

# Aplicar migraciones DB
dart bin/main.dart --apply-migrations
```

### Paso 5: Ejecutar Backend

```bash
# Desde: toysbubus_server/
dart bin/main.dart

# Esperado:
# ✓ Server running on port 8080
# ✓ API available at http://localhost:8080
```

### Paso 6: Ejecutar Frontend (Nueva terminal)

```bash
# Desde: toysbubus_flutter/
flutter run

# Elige dispositivo (emulador o conectado)
```

---

## 📁 Variables de Entorno

### `.env.local` (No versionado)

Crear archivo `.env.local` en raíz del proyecto:

```env
# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=toysbubus

# Redis
REDIS_HOST=localhost
REDIS_PORT=6379

# JWT
JWT_SECRET=tu-secret-key-aqui-cambiar-en-prod
JWT_EXPIRE=7d

# Server
ENVIRONMENT=development
```

### `docker-compose.override.yaml` (Opcional)

Para sobrescribir valores por defecto localmente:

```yaml
version: '3'
services:
  postgres:
    environment:
      POSTGRES_PASSWORD: tu-password-local
```

---

## 🐳 Comandos Docker Útiles

### Ver Logs

```bash
# Todos los servicios
docker compose logs -f

# Solo PostgreSQL
docker compose logs -f postgres

# Últimas 100 líneas
docker compose logs --tail=100
```

### Conectarse a PostgreSQL

```bash
docker compose exec postgres psql -U postgres -d toysbubus
```

Comandos SQL básicos:
```sql
\dt                    -- Listar tablas
\d users               -- Describir tabla
SELECT COUNT(*) FROM users;  -- Query rápida
\q                     -- Salir
```

### Conectarse a Redis

```bash
docker compose exec redis redis-cli
> PING                 -- Verificar conexión
> KEYS *               -- Listar todas las keys
```

### Reiniciar Servicios

```bash
# Detener
docker compose stop

# Limpiar datos (CUIDADO)
docker compose down -v

# Volver a iniciar
docker compose up -d
```

---

## 🔍 Verificación de Setup

Script para verificar que todo está correcto:

```bash
#!/bin/bash

echo "✓ Verificando setup..."

# Dart
echo "├─ Dart: $(dart --version 2>&1)"

# Flutter
echo "├─ Flutter: $(flutter --version | head -1)"

# Docker
echo "├─ Docker: $(docker --version)"

# Conexión a Postgres
docker compose exec postgres pg_isready && echo "├─ PostgreSQL: ✓" || echo "├─ PostgreSQL: ✗"

# Conexión a Redis
docker compose exec redis redis-cli ping &>/dev/null && echo "├─ Redis: ✓" || echo "├─ Redis: ✗"

# Directorio de proyecto
echo "├─ Proyecto: $(pwd)"

echo "✓ Setup verificado"
```

---

## ⚡ Troubleshooting

### Error: "Port 5432 already in use"
```bash
# PostgreSQL ya corre en local o en otro contenedor
docker ps | grep 5432
# Cambiar puerto en docker-compose.yaml:
# ports:
#   - "5433:5432"  # Cambiar a 5433
```

### Error: "SDK constraint solved to..."
```bash
# Actualizar Dart
dart pub upgrade
# O
flutter upgrade
```

### Error: "Cannot connect to database"
```bash
# Verificar contenedor está corriendo
docker compose ps

# Reiniciar
docker compose restart postgres

# Ver logs
docker compose logs postgres
```

### Error en migraciones
```bash
# Borrar datos e intentar de nuevo
docker compose down -v
docker compose up -d
dart bin/main.dart --apply-migrations
```

### Flutter no encuentra servidor
```bash
# Verificar servidor está corriendo en puerto 8080
lsof -i :8080  # macOS/Linux
netstat -ano | findstr :8080  # Windows

# Backend debe estar ejecutándose ANTES de flutter run
```

---

## 🎯 Next Steps

- [ ] Leer [Workflow.md](workflow.md) para entender Git flow
- [ ] Revisar [Architecture](architecture/server.md) antes de escribir code
- [ ] Ejecutar tests: `dart test`
- [ ] Familiarizarse con [Copilot Instructions](.github/workflows/copilot-instructions.md)

---

**Versión:** 1.0
**Última actualización:** 18 de febrero de 2026
