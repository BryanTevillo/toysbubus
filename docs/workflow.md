# Workflow – Procesos de Desarrollo

Guía de Git flow, branching strategy, code review y deployment para ToysBubus.

---

## 🌳 Estrategia de Ramas

### Ramas Principales

```
main (production ready)
 ├── staging (pre-producción)
 └── develop (integración)
      ├── feat/user-auth
      ├── feat/todo-crud
      ├── fix/db-connection
      └── refactor/service-layer
```

### Nomenclatura de Ramas

| Tipo | Patrón | Ejemplo |
|------|--------|---------|
| Feature | `feat/nombre-corto` | `feat/jwt-auth` |
| Fix | `fix/bug-description` | `fix/null-pointer-ui` |
| Refactor | `refactor/area` | `refactor/repository-layer` |
| Docs | `docs/topic` | `docs/architecture` |
| Chore | `chore/task` | `chore/update-deps` |

**Reglas:**
- ✅ Usar kebab-case (guiones)
- ✅ Ser descriptivo pero conciso
- ✅ Empezar desde `develop`
- ❌ No usar números de issue como rama

---

## 🔄 Flujo de Desarrollo

### 1. Obtener Última Versión
```bash
git checkout develop
git pull origin develop
```

### 2. Crear Rama de Feature
```bash
git checkout -b feat/nombre-del-feature
```

### 3. Desarrollar Localmente
```bash
# Hacer cambios
# Ejecutar tests
dart test

# Validar código
dart analyze
dart format lib/ --set-exit-if-changed

# Commits frecuentes
git add .
git commit -m "feat(auth): implement password validation"
```

### 4. Push a Remoto
```bash
git push origin feat/nombre-del-feature

# Primera vez, upstream:
git push -u origin feat/nombre-del-feature
```

### 5. Crear Pull Request
En GitHub/GitLab:
- **Base:** `develop`
- **Compare:** `feat/nombre-del-feature`
- **Título:** Formato convencional: `feat(auth): Add JWT validation`
- **Descripción:** Qué cambió, por qué, ticket relacionado

### 6. Code Review
- Esperar revisión de al menos 1 dev
- Responder comentarios
- Hacer cambios solicitados con nuevos commits
- No reescribir historia (a menos que sea WIP)

### 7. Merge a Develop
```bash
# Después de aprobación, merge en GitHub ui o:
git checkout develop
git pull origin develop
git merge --squash feat/nombre-del-feature
git commit -m "feat(auth): Add JWT validation"
git push origin develop
```

### 8. Eliminar Rama
```bash
# Local
git branch -d feat/nombre-del-feature

# Remoto
git push origin -d feat/nombre-del-feature
```

---

## 📝 Conventional Commits

### Formato
```
type(scope): subject

body (opcional)

footer (opcional)
```

### Tipos
| Tipo | Uso | Ejemplo |
|------|-----|---------|
| `feat` | Nueva funcionalidad | `feat(auth): add JWT validation` |
| `fix` | Corrección de bug | `fix(db): handle null users query` |
| `refactor` | Cambio sin funcionalidad | `refactor(service): simplify login logic` |
| `docs` | Cambios en docs | `docs(readme): update setup instructions` |
| `test` | Tests nuevos/modificados | `test(auth): add login validation` |
| `style` | Formato, whitespace | `style: apply dart format` |
| `chore` | Deps, config | `chore(deps): upgrade serverpod to 3.3.1` |
| `perf` | Performance | `perf(db): add user email index` |
| `ci` | CI/CD | `ci: add github actions workflow` |

### Scope
Sin scope (solo si es global):
```
chore: update dependencies
```

Con scope (recomendado):
```
feat(auth): add JWT validation
```

### Subject (Asunto)
- ✅ Imperativo: "add" no "adds" o "added"
- ✅ Minúscula: "add" no "Add"
- ✅ Sin período: "add feature" no "add feature."
- ✅ Máximo 50 caracteres

### Ejemplos Completos

```
feat(auth): implement JWT token validation

Add JWT validation to AuthService. Validates token signature,
expiration, and issuer. Raises TokenExpiredException if invalid.

Closes #42
```

```
fix(db): handle null pointer in user query

Repository.findByEmail() was not checking null before accessing
user.id field. Add null check to prevent NPE.

Fixes #123
```

---

## 🧪 Testing Antes de Commit

### Backend
```bash
cd toysbubus_server

# Ejecutar todos los tests
dart test

# Tests de un archivo específico
dart test test/services/auth_service_test.dart

# Tests con coverage
dart test --coverage=coverage
```

### Flutter
```bash
cd toysbubus_flutter

# Ejecutar tests
flutter test

# Tests en archivo específico
flutter test test/screens/home_test.dart

# Tests con coverage
flutter test --coverage
```

### Análisis de Código
```bash
# Análisis lint
dart analyze

# Fix automático
dart fix --apply

# Formato
dart format lib/ --set-exit-if-changed
```

---

## 🔀 Fusionar Ramas

### Merge Squash (Recomendado)
```bash
git merge --squash feat/new-feature
git commit -m "feat(scope): single meaningful message"
```
✅ Historia limpia, 1 commit por feature

### Merge Normal (Alternativo)
```bash
git merge feat/new-feature --no-ff
```
✅ Preserva historia de feature branch

### Rebase (Solo en WIP)
```bash
git rebase develop
git push -f origin feat/...
```
❌ No usar en ramas compartidas

---

## 🚀 Deploy al Staging/Producción

### A Staging
```bash
git checkout staging
git pull origin staging
git merge develop
git push origin staging

# CI/CD automáticamente:
# 1. Build
# 2. Tests
# 3. Deploy a staging
```

### A Producción (Release)
```bash
# Crear rama de release
git checkout -b release/v1.0.0 develop

# Actualizar versiones
# - pubspec.yaml (version: 1.0.0)
# - CHANGELOG.md

git commit -m "chore(release): bump version to 1.0.0"
git push origin release/v1.0.0

# Pull Request a main
# Después de merge:

git checkout main
git pull origin main
git tag v1.0.0
git push origin v1.0.0

# Fusionar de vuelta a develop
git checkout develop
git pull origin develop
git merge main
git push origin develop
```

---

## 💬 Code Review Checklist

### Revisor Debe Verificar:

**Funcionalidad:**
- [ ] Código hace lo que dice el PR
- [ ] Tests incluidos y pasan
- [ ] Sin regressions en funciones existentes
- [ ] Manejo de edge cases

**Calidad:**
- [ ] Sigue arquitectura (endpoints → services → repos)
- [ ] Nombres claros y descriptivos
- [ ] Sin código duplicado
- [ ] Está completo (no WIP)

**Seguridad:**
- [ ] Sin hardcoded secrets
- [ ] Validaciones en Service
- [ ] Excepciones serializables
- [ ] SQL injection previsto

**Performance:**
- [ ] Queries optimizadas
- [ ] No N+1 queries
- [ ] Índices en campos buscados

**Documentación:**
- [ ] Comentarios útiles (///)
- [ ] Cambios en docs/ si aplica
- [ ] Commit messages semánticos

---

## 🐛 Hotfix en Producción

```bash
# Crear desde main si es urgente
git checkout -b hotfix/critical-bug main

# Hacer fix y tests
# ...

# Commit
git commit -m "fix(critical): resolve payment processing bug"

# Push
git push origin hotfix/critical-bug

# PR a main, merge, tag

# Después, fusionar a develop
git checkout develop
git merge hotfix/critical-bug
```

---

## 📊 Git Tips & Tricks

### Ver Historial Lineal
```bash
git log --oneline --graph --all
```

### Stash (Guardar cambios temporalmente)
```bash
git stash
git stash list
git stash pop
```

### Amend último commit
```bash
git add .
git commit --amend --no-edit
# Si ya pusheamos, force (cuidado)
git push -f origin feat/branch
```

### Reset a última versión online
```bash
git fetch origin
git reset --hard origin/develop
```

---

## ✋ Reglas a Seguir

| ✅ Hacer | ❌ Evitar |
|---------|----------|
| Commits pequeños y frecuentes | Commits gigantes |
| Messages semánticos | "wip", "fix", "updated" |
| Rebasar contra develop antes de PR | Mergear sin rebase |
| Reviews antes de merge | Pushpar directamente a develop |
| Deletear ramas después de merge | Dejar ramas obsoletas |
| Squash si tiene muchos commits WIP | Preservar commits de debug |

---

## 🔗 Referencias

- [Git Flow Cheatsheet](https://danielkummer.github.io/git-flow-cheatsheet/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)

---

**Versión:** 1.0
**Última actualización:** 18 de febrero de 2026
