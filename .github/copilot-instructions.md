# ToysBubus – Copilot Project Instructions (Versión 3.3.1)

Este archivo contiene las instrucciones para GitHub Copilot y Claude Code sobre cómo generar, documentar y organizar el proyecto ToysBubus. **Importante:** Para Serverpod (backend) siempre validar la documentación oficial más reciente en https://docs.serverpod.dev/ antes de sugerir o generar código.

# 1️⃣ ESTRUCTURA DEL PROYECTO
Monorepo fullstack:

toysbubus/
 ├─ toysbubus_server/        → Backend Serverpod
 ├─ toysbubus_client/        → Cliente RPC (si aplica)
 ├─ toysbubus_flutter/       → Frontend Flutter (futuro)
 ├─ docs/
 │   ├─ architecture/
 │   │   ├─ server.md
 │   │   └─ flutter.md
 │   ├─ decisions/
 │   │   └─ adr-log.md
 │   ├─ dependencies.md
 │   ├─ workflow.md
 │   ├─ setup.md
 │   └─ dev-log.md
 ├─ docker/
 ├─ config/
 └─ .github/copilot-instructions.md

> Nota: Por ahora el foco es backend. Flutter se documentará en su momento.

# 2️⃣ ARQUITECTURA BACKEND (OBLIGATORIA)
Se utiliza **arquitectura por capas profesional**:

1. Endpoint Layer – recibe solicitudes, NO contiene lógica, llama a services.
2. Service Layer – lógica de negocio, orquesta reglas, llama a repositories, lanza excepciones serializables.
3. Repository / Data Layer – acceso a base de datos, queries y persistencia.
4. Models – definidos en YAML, generados con `serverpod generate`, NO lógica compleja.
5. Exceptions – definidas en YAML, generadas, usadas en services y propagadas a endpoints.

> Reglas estrictas: no mezclar responsabilidades, endpoints delgados, código limpio y testeable.

# 3️⃣ GENERACIÓN DE CÓDIGO BACKEND
1. Crear endpoint en: `toysbubus_server/lib/src/endpoints/`
2. Crear service en: `toysbubus_server/lib/src/services/`
3. Crear modelos en: `toysbubus_server/lib/src/models/` (YAML + generate)
4. Crear excepciones en: `toysbubus_server/lib/src/exceptions/` (YAML + generate)

Siempre incluir documentación con `///`, explicación de responsabilidades y manejo básico de errores. Validar con documentación 3.3.1 antes de generar lógica.

# 4️⃣ DOCUMENTACIÓN
Copilot debe actualizar automáticamente los archivos correspondientes:

- Arquitectura: `docs/architecture/server.md` – flujo request → endpoint → service → repository → db, nuevas capas y módulos.
- Decisiones técnicas (ADR): `docs/decisions/adr-log.md`

Formato:
YYYY-MM-DD - Título
Contexto:
Motivo:
Alternativas:
Impacto:


- **Dependencias:** `docs/dependencies.md`  
Nombre, propósito y motivo de elección.

- **Dev Log:** `docs/dev-log.md`  
Formato:
YYYY-MM-DD - Título
Problema:
Causa raíz:
Solución:
Impacto futuro:
Advertencias:


- **Setup y Workflow:** `docs/setup.md` y `docs/workflow.md`  
Cambios en ejecución de proyecto o procesos Git.

---

# 5️⃣ COMMITS

- Usar **conventional commits**:
feat(scope): descripción
fix(scope): descripción
refactor(scope): descripción
docs(scope): descripción
chore(scope): descripción


- Ejemplos:
feat(auth): add JWT validation service
fix(docker): correct container startup command
docs(server): update architecture after service layer refactor


- Copilot puede sugerir y generar commits basados en cambios realizados.

---

# 6️⃣ SEGURIDAD

- Nunca exponer passwords ni secretos en repositorios públicos.  
- Usar `.env` o `config/passwords.yaml`.  
- Copilot debe advertir si algún snippet incluye hardcode de secretos.

---

# 7️⃣ DOCKER

- Actualizar docs/dev-log.md si se modifica docker-compose o Dockerfile.  
- Actualizar docs/setup.md si cambia el proceso de construcción/ejecución.

---

# 8️⃣ COMPORTAMIENTO DE COPILOT

Copilot debe:

- Validar documentación oficial de Serverpod en https://docs.serverpod.dev/ antes de sugerir código backend.
- Detectar tipo de cambio y ubicar documentación adecuada.
- Sugerir commits semánticos profesionales.
- Documentar automáticamente arquitectura, decisiones y logs.

---

# 9️⃣ FUTURO FLUTTER

- Aplicar separación por features.  
- Mantener lógica en services, no UI.  
- Actualizar docs/architecture/flutter.md.

---

# 🔟 ESTÁNDAR DE CALIDAD

- Código limpio y legible.  
- Separación clara por capas.  
- Comentarios útiles, mínimos pero claros.  
- Documentación siempre actualizada.  
- Commits profesionales y descriptivos.

---

Copilot y Claude Code deben actuar como:

- Asistente de arquitectura.  
- Documentador automático.  
- Generador de commits semánticos.  
- Guardián de buenas prácticas.  

---

# 11️⃣ FORMATEO MARKDOWN

- Agregar espacios antes de cada tema o bloque de código para separación visual.
- Después de cada título o encabezado (##, ###, **texto**, etc.), dejar un salto de línea antes del contenido siguiente.
- Para cada bloque de código, incluso si es texto, agregar espacios o saltos de línea y usar ```a como lenguaje.
- En las tablas, mantener espacios alrededor de los pipes (|) incluso en separadores ----- entre extremos.
- En títulos ##, no usar : en el texto, ej. "## Flujo de Desarrollo" sin :.  

---

# 12️⃣ USO DE DOCUMENTACIÓN OFICIAL DE SERVERPOD

- Para backend Serverpod, consultar siempre la documentación oficial en https://docs.serverpod.dev/ antes de proponer código o cambios estructurales.
- No usar información antigua o desactualizada cuando exista diferencia con la documentación oficial actual.
- Antes de implementar, validar sintaxis, comandos y patrones directamente en la documentación oficial.
- Si hay dudas o cambios entre versiones, priorizar siempre lo indicado en https://docs.serverpod.dev/.