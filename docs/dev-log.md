# Dev Log – ToysBubus

Registro de cambios, problemas resueltos y lecciones aprendidas durante el desarrollo.

---

## 2026-02-18 - Configuración de Docker Compose con pgAdmin y Resolución de Conflictos de Puertos

**Problema:**
El servidor Serverpod marcaba error de conexión a la base de datos PostgreSQL. Además, no había forma de navegar visualmente la base de datos para desarrollo y debugging.

**Causa Raíz:**

- Puerto de base de datos en `config/development.yaml` (8090) no coincidía con el puerto expuesto en `docker-compose.yaml` (8092).
- Falta de herramienta de administración de DB como pgAdmin para inspeccionar tablas, queries, etc.
- Conflictos potenciales de puertos con otros servicios locales.

**Solución:**

1. Actualizar puerto en `toysbubus_server/config/development.yaml`:
   - Cambiar `port: 8090` a `port: 8092` para coincidir con Docker.

2. Modificar `toysbubus_server/docker-compose.yaml`:
   - Agregar servicio `pgadmin` con imagen `dpage/pgadmin4:latest`.
   - Configurar credenciales: email `admin@admin.com`, password `admin`.
   - Exponer puerto 8099 para acceso web.
   - Agregar volúmenes para persistencia de datos de pgAdmin.
   - Usar puertos no estándar (8092 para Postgres, 8091 para Redis, 8099 para pgAdmin) para evitar conflictos.

3. Verificar configuración de red en Postgres:
   - Comando `listen_addresses='*'` permite conexiones externas.
   - pgAdmin puede conectarse a `localhost:8092` con user `postgres` y password del environment.

**Cómo Funciona:**

- ✅ Docker Compose inicia Postgres, Redis y pgAdmin automáticamente.
- ✅ pgAdmin accesible en `http://localhost:8099` para gestión visual de DB.
- ✅ Servidor conecta sin errores a DB en puerto 8092.
- ✅ Volúmenes `./data` y `./pgadmin-data` persisten datos entre reinicios.

**Impacto Futuro:**

- Desarrollo más eficiente con debugging visual de DB.
- Menos errores de conexión por configuraciones desactualizadas.
- Facilita testing y migraciones al ver estado de tablas en tiempo real.

**Advertencias:**

- Verificar que puertos (8092, 8091, 8099) no choquen con otros servicios en la máquina.
- No compartir credenciales de pgAdmin en repos públicos.
- Si se reinicia contenedor Postgres, puede requerir recrear volúmenes si hay corrupción.

---

## 2026-02-18 - Agregar OpenAPI para Testing con Swagger

**Problema:**
No había forma fácil de testear los endpoints del backend. Swagger UI permitiría explorar y probar endpoints sin Postman.

**Causa Raíz:**

- Backend Serverpod sin documentación interactiva
- Necesidad de herramientas externas para testing
- Falta de especificación OpenAPI

**Solución:**

1. Investigado opciones en pub.dev:
   - `serverpod_swagger` (0.3.1) - más nuevo pero conflictos de dependencias
   - `serverpod_openapi` (0.0.3) - genera spec OpenAPI con Swagger UI ✅

2. Agregada dependencia en `pubspec.yaml`:

   ```yaml
   dependencies:
     serverpod_openapi: ^0.0.3
   ```

3. Configuración en `lib/server.dart`:
   - Importar: `import 'package:serverpod_openapi/serverpod_openapi.dart';`
   - Agregar ruta antes de `pod.start()`:

   ```dart
   pod.webServer.addRoute(
     RouteOpenApi(
       pod,
       title: 'ToysBubus API',
       version: '1.0.0',
       description: 'Interactive API documentation with authentication support.',
     ),
     '/openapi',
   );
   ```

**Cómo Funciona:**

- ✅ Genera OpenAPI 3.0 spec automáticamente de endpoints
- ✅ Infers HTTP methods de nombres (get*, post*, update*, delete*)
- ✅ Swagger UI disponible en `http://localhost:8080/openapi`
- ✅ Acceso a formats: JSON (`/openapi?format=json`), YAML (`/openapi?format=yaml`)
- ✅ Soporte automático de autenticación Bearer token
- ✅ Compatible con Postman y herramientas externas

**HTTP Method Inference:**

- GET: `get*`, `list*`, `fetch*`, `find*`, `read*`
- POST: `create*`, `add*`, `insert*`, `save*`, `login*`
- PATCH: `update*`, `modify*`, `edit*`, `patch*`
- DELETE: `delete*`, `remove*`, `destroy*`
- POST (default): métodos que no coinciden

**URL de Acceso:**

- Swagger UI: `http://localhost:8080/openapi`
- OpenAPI JSON: `http://localhost:8080/openapi?format=json`
- OpenAPI YAML: `http://localhost:8080/openapi?format=yaml`

**Impacto:**
✅ Documentación interactiva auto-generada
✅ Testing directo desde browser
✅ Compatible con Postman y herramientas REST
✅ Autenticación integrada
✅ Sin código manual de documentación

**Referencia:** [pub.dev/packages/serverpod_openapi](https://pub.dev/packages/serverpod_openapi)

**Estado:** ✅ Configurado y listo para usar

---

## 2026-02-18 - Documentación Completa del Proyecto

**Problema:**
El proyecto carecía de documentación clara sobre estructura, ejecución local y arquitectura. Nuevos desarrolladores no tenían punto de inicio obvio.

**Causa Raíz:**

- Repositorio en fase inicial pero sin documentación visible
- README.md y docs/ estaban vacíos
- Falta de guías para setup, workflow y decisiones técnicas

**Solución:**
Se creó suite completa de documentación:

1. **README.md** (1,200+ palabras)
   - Descripción proyecto y estructura
   - Quick start 4 pasos
   - Arquitectura por capas explicada
   - Docker, testing, seguridad
   - Contribución y referencias

2. **docs/architecture/server.md** (1,600+ palabras)
   - Flujo Request → Response diagrama ASCII
   - 5 capas detalladas: Endpoint, Service, Repository, Models, Exceptions
   - Ejemplo completo: "Crear Usuario"
   - Patrones de testing
   - Principios SOLID aplicados

3. **docs/setup.md** (900+ palabras)
   - Requisitos previos con versiones
   - Instalación paso a paso
   - Variables de entorno
   - Comandos Docker útiles
   - Troubleshooting común

4. **docs/workflow.md** (1,400+ palabras)
   - Git branching strategy
   - Conventional commits
   - Flujo desarrollo (8 pasos)
   - Code review checklist
   - Merge strategies

5. **docs/dependencies.md** (900+ palabras)
   - Justificación de cada dependencia
   - Matriz de compatibilidad
   - Proceso de updates
   - Seguridad y auditoría
   - Candidates para futuro

**Impacto Futuro:**
✅ Onboarding 10x más rápido
✅ Referencia clara de arquitectura
✅ Procesos standardizados
✅ Histórico de decisiones
✅ Menos preguntas repetidas

**Advertencias:**

- README.md debe actualizarse si cambian procesos en docs/
- Workflow.md puede necesitar ajustes con experiencia de equipo
- Architecture puede expandirse con más servicios complejos

**Commit Relacionado:**

- `docs: add comprehensive project documentation` (6 files, 1674 insertions)

---
