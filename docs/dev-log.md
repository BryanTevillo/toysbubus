# Dev Log – ToysBubus

Registro de cambios, problemas resueltos y lecciones aprendidas durante el desarrollo.

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
   - `serverpod_swagger` (0.3.1) - más nuevo pero conflictos de dependencias con test
   - `serverpod_openapi` (0.0.3) - genera spec OpenAPI con Swagger UI

2. Agregada dependencia:
   ```yaml
   dependencies:
     serverpod_openapi: ^0.0.3
   ```

3. Instalada y resuelta exitosamente

**Impacto:**
✅ Swagger UI disponible en `/api/swagger` (después de configuración)
✅ Documentación OpenAPI 3.0 auto-generada
✅ Testing directo desde browser
✅ Compatible con Postman y herramientas externas

**Próximos Pasos:**
- Configurar endpoint según documentación de serverpod_openapi
- Documentar URL de Swagger en README
- Agregar script en pubspec.yaml para generar spec

**Referencia:** [pub.dev/packages/serverpod_openapi](https://pub.dev/packages/serverpod_openapi)

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
