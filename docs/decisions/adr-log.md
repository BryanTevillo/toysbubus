# Architectural Decision Record (ADR) Log

## 2026-02-18 - Módulo Business con modelo en carpeta models

Contexto:

Se requiere registrar negocios con UUID, datos de contacto, ubicación y estado activo, manteniendo separación estricta por capas en Serverpod.

Motivo:

Centralizar la gestión de negocios en un módulo backend mantenible y testeable, cumpliendo la instrucción de ubicar modelos en `lib/src/models/`.

Alternativas:

- Definir lógica directamente en endpoint (descartado por mezclar responsabilidades).
- Acceder a base de datos sin repository (descartado por menor mantenibilidad).
- Modelo en carpetas de feature en vez de `models` (descartado por incumplir instrucción del proyecto).

Impacto:

- Se agrega `Business` como tabla administrada por Serverpod.
- Se incorpora excepción serializable para validaciones de dominio.
- Se habilita CRUD básico por endpoint con service y repository dedicados.
- Se mejora consistencia arquitectónica para futuros módulos.
