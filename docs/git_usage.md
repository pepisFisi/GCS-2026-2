 # Estándar de Commits y Versionamiento

 **Proyecto:** Sistema Web\
 **Estándar:** Conventional Commits\
 **Versionamiento:** Semantic Versioning (SemVer)\
 **Versión del estándar:** 1.0.0

---

 ## 1\. Objetivo

 Este documento establece las convenciones para:

- Crear commits consistentes y descriptivos.
- Mantener un historial de Git legible.
- Identificar cambios de frontend, backend, base de datos y documentación.
- Determinar incrementos de versión.
- Facilitar la generación de changelogs.
- Mantener trazabilidad entre código, migraciones y documentación.
- Diferenciar cambios funcionales, correcciones y mantenimiento.

 El estándar aplica a todo el repositorio.

---

 ## 2\. Estructura actual del proyecto

 El proyecto integra diferentes tecnologías y responsabilidades:

```
.
├── db/
│   ├── migrations/
│   │   ├── 20260912215023_create_foots.sql
│   │   ├── 20260912220928_create_nations.sql
│   │   ├── 20260912221127_create_positions.sql
│   │   ├── 20260912221249_create_play_styles.sql
│   │   ├── 20260912221505_create_leagues.sql
│   │   ├── 20260912222836_create_teams.sql
│   │   ├── 20260912223016_alter_teams.sql
│   │   ├── 20260912223526_create_players.sql
│   │   ├── 20260912223721_create_players_positions.sql
│   │   ├── 20260912223753_create_players_play_styles.sql
│   │   ├── 20260912223850_create_goalkeepers.sql
│   │   ├── 20260912225213_fill_foots.sql
│   │   ├── 20260919223649_fill_nations.sql
│   │   ├── 20260919230151_fill_leagues.sql
│   │   └── 20260919231550_fill_teams.sql
│   └── schema.sql
├── docs/
│   ├── data_dicctionary.md
│   ├── orden.png
│   ├── schema.puml
│   ├── std_ddl.md
│   ├── UML-DB.mdj
│   └── UML.mdj
├── package.json
├── package-lock.json
├── prompts/
│   └── crear_db.txt
├── README.md
├── requirements.txt
└── scripts/
    ├── all_players.csv
    ├── female_players.csv
    ├── inserts_leagues.sql
    ├── inserts_nations.sql
    ├── inserts_teams.sql
    ├── male_players.csv
    └── to_db.ipynb
```

 ### Tecnologías

 | Componente | Tecnología | Gestión |
| --- | --- | --- |
| Frontend | Svelte | `package.json` |
| Bundler | Rollup | `package.json` |
| Backend | Python / Flask | `requirements.txt` |
| Base de datos | SQL | `db/migrations/` |
| Documentación | Markdown / PlantUML | `docs/` |
| Control de versiones | Git | Git |

---

 # 3\. Conventional Commits

 Todos los commits deben seguir la siguiente estructura:

```
<tipo>(<alcance>): <descripción>
```

 Ejemplo:

```
feat(auth): agregar autenticación JWT
```

 La descripción debe:

 - Estar escrita en infinitivo.
- Ser breve y específica.
- Describir qué cambia.
- No terminar con punto.
- Evitar descripciones genéricas como `cambios`, `fix`, `update` o `modificaciones`.

 ### Ejemplo incorrecto

```
update
```

```
cambios backend
```

```
fix cosas
```

 ### Ejemplo correcto

```
fix(auth): corregir validación del token JWT
```

---

 # 4\. Tipos de commit

 ## 4.1 `feat`

 Se utiliza para agregar una nueva funcionalidad.

 Ejemplos:

```
feat(auth): agregar autenticación JWT
```

```
feat(player): agregar endpoint para consultar jugadores
```

```
feat(frontend): agregar formulario de registro de jugadores
```

 ### Versionamiento

 Normalmente genera un incremento `MINOR`.

```
1.2.0 → 1.3.0
```

---

 ## 4.2 `fix`

 Se utiliza para corregir un error existente.

 Ejemplos:

```
fix(user): corregir validación de email
```

```
fix(auth): corregir expiración del token JWT
```

```
fix(player): corregir búsqueda por nacionalidad
```

 ### Versionamiento

 Normalmente genera un incremento `PATCH`.

```
1.2.0 → 1.2.1
```

---

 ## 4.3 `refactor`

 Se utiliza para modificar la estructura interna del código sin cambiar su comportamiento funcional.

 Ejemplos:

```
refactor(user): separar lógica de negocio del resource
```

```
refactor(api): reorganizar estructura de endpoints
```

```
refactor(frontend): separar componentes de jugadores
```

 Por defecto no genera una nueva versión funcional.

---

 ## 4.4 `test`

 Se utiliza para agregar o modificar pruebas.

 Ejemplos:

```
test(user): agregar pruebas para UserService
```

```
test(auth): agregar pruebas de autenticación
```

```
test(api): agregar pruebas para endpoints de jugadores
```

 Por defecto no genera una nueva versión funcional.

---

 ## 4.5 `docs`

 Se utiliza exclusivamente para cambios de documentación.

 Ejemplos:

```
docs(readme): actualizar instrucciones de instalación
```

```
docs(database): documentar modelo relacional
```

```
docs(api): documentar endpoints de jugadores
```

 Por defecto no genera una nueva versión funcional.

---

 ## 4.6 `style`

 Se utiliza para cambios de formato que no modifican la lógica.

 Ejemplos:

```
style(frontend): aplicar formato al código Svelte
```

```
style(backend): corregir formato de archivos Python
```

 Incluye:

 - Indentación.
- Espacios.
- Saltos de línea.
- Formateo automático.
- Orden visual del código.

---

 ## 4.7 `perf`

 Se utiliza para cambios destinados a mejorar el rendimiento.

 Ejemplos:

```
perf(db): optimizar consulta de usuarios
```

```
perf(frontend): reducir renders innecesarios
```

```
perf(api): reducir consultas duplicadas
```

 El impacto sobre la versión dependerá de si el cambio modifica o no el comportamiento público.

---

 ## 4.8 `build`

 Se utiliza para cambios relacionados con:

 - Compilación.
- Dependencias.
- Herramientas de construcción.
- Configuración de Node.js.
- Configuración de Rollup.
- Configuración de Python.

 Ejemplos:

```
build(frontend): configurar Rollup
```

```
build(frontend): actualizar dependencia de Svelte
```

```
build(backend): actualizar dependencias de Flask
```

```
build(deps): actualizar dependencias de Node
```

```
build(deps): actualizar requirements de Python
```

---

 ## 4.9 `ci`

 Se utiliza para cambios relacionados con integración continua y despliegue automatizado.

 Ejemplos:

```
ci(github): agregar workflow de integración continua
```

```
ci(github): ejecutar pruebas de frontend y backend
```

```
ci(deploy): agregar pipeline de producción
```

---

 ## 4.10 `chore`

 Se utiliza para tareas de mantenimiento que no modifican directamente la funcionalidad del sistema.

 Ejemplos:

```
chore(git): actualizar gitignore
```

```
chore(project): reorganizar estructura de directorios
```

```
chore(deps): actualizar dependencias
```

---

 ## 4.11 `db`

 Se utiliza para cambios relacionados específicamente con la base de datos.

 Ejemplos:

```
db(migration): crear tabla players
```

```
db(migration): agregar relación entre players y positions
```

```
db(seed): agregar datos iniciales de nations
```

```
db(schema): actualizar esquema de base de datos
```

---

 # 5\. Alcances (`scope`)

 El alcance identifica la parte del sistema afectada.

 Los scopes recomendados para este proyecto son:

 | Scope | Uso |
| --- | --- |
| `frontend` | Aplicación Svelte |
| `backend` | Aplicación Flask |
| `api` | API HTTP |
| `auth` | Autenticación y autorización |
| `player` | Jugadores |
| `team` | Equipos |
| `league` | Ligas |
| `nation` | Naciones |
| `position` | Posiciones |
| `play-style` | Estilos de juego |
| `goalkeeper` | Arqueros |
| `db` | Base de datos |
| `migration` | Migraciones |
| `schema` | Esquema SQL |
| `seed` | Datos iniciales |
| `docs` | Documentación |
| `deps` | Dependencias |
| `config` | Configuración |
| `ci` | Integración continua |
| `deploy` | Despliegue |
| `scripts` | Scripts auxiliares |

El scope debe ser lo más específico posible.

 ### Preferir

```
feat(player): agregar filtro por posición
```

 ### En lugar de

```
feat(backend): agregar filtro por posición
```

 cuando el cambio afecta específicamente al módulo de jugadores.

---

 # 6\. Frontend Svelte + Rollup

 Los cambios relacionados con Svelte y Rollup deben identificarse claramente.

 ## Nueva funcionalidad

```
feat(frontend): agregar listado de jugadores
```

 ## Componentes

```
feat(player): crear componente PlayerCard
```

 ## Correcciones

```
fix(player): corregir renderizado del nombre
```

 ## Rollup

```
build(frontend): configurar bundle de producción
```

 ## Dependencias

```
build(deps): actualizar versión de Svelte
```

 Cuando se modifiquen:

```
package.json
package-lock.json
```

 el commit debe reflejar el motivo del cambio.

 Evitar:

```
update package
```

 Preferir:

```
build(deps): actualizar dependencia de Svelte
```

---

 # 7\. Backend Python + Flask

 Los cambios del backend deben identificarse mediante `backend`, `api` o el dominio correspondiente.

 ## Endpoint

```
feat(api): agregar endpoint de jugadores
```

 ## Servicio

```
feat(player): implementar servicio de jugadores
```

 ## Corrección

```
fix(player): corregir búsqueda por nacionalidad
```

 ## Dependencias

```
build(deps): actualizar Flask
```

 Cuando cambie:

```
requirements.txt
```

 utilizar preferentemente:

```
build(deps): actualizar dependencias del backend
```

---

 # 8\. Base de datos

 Las migraciones deben mantenerse como cambios independientes siempre que sea posible.

 Ejemplo:

```
db(migration): crear tabla players
```

 Posteriormente:

```
db(migration): crear relación players_positions
```

 Y posteriormente:

```
db(migration): agregar índice a players
```

 ## Regla importante

 Una migración que ya fue ejecutada en un ambiente compartido **no debe modificarse retroactivamente**.

 ### Incorrecto

 Modificar:

```
20260912223526_create_players.sql
```

 después de que ya fue ejecutada.

 ### Correcto

 Crear una nueva migración:

```
20260912223526_create_players.sql
20260926120000_alter_players.sql
```

 Commit:

```
db(migration): modificar estructura de players
```

---

 # 9\. Datos iniciales / Seeds

 Los datos iniciales deben diferenciarse de los cambios estructurales.

 Ejemplos:

```
db(seed): agregar naciones iniciales
```

```
db(seed): agregar ligas iniciales
```

```
db(seed): agregar equipos iniciales
```

 Esto permite distinguir entre:

```
CREATE TABLE
```

 y:

```
INSERT INTO
```

---

 # 10\. Documentación

 La documentación debe utilizar el tipo `docs`.

 Ejemplos:

```
docs(readme): actualizar instrucciones de instalación
```

```
docs(db): actualizar diccionario de datos
```

```
docs(db): actualizar diagrama entidad relación
```

```
docs(api): documentar endpoint de jugadores
```

---

 # 11\. Dependencias

 ## 11.1 Node.js

 Las dependencias del frontend se administran mediante:

```
package.json
package-lock.json
```

 ### Agregar dependencia

```
build(deps): agregar dependencia de Svelte
```

 ### Actualizar dependencia

```
build(deps): actualizar dependencias del frontend
```

 No se debe modificar manualmente `package-lock.json` sin una modificación correspondiente de las dependencias.

---

 ## 11.2 Python

 Las dependencias del backend se administran mediante:

```
requirements.txt
```

 ### Agregar dependencia

```
build(deps): agregar Flask-CORS
```

 ### Actualizar dependencias

```
build(deps): actualizar dependencias del backend
```

---

 # 12\. Commits atómicos

 Un commit debe representar **un único cambio lógico**.

 ### Evitar

```
feat(project): implementar todo el sistema
```

 si el commit contiene:

 - Frontend.
- Backend.
- Base de datos.
- Documentación.
- Configuración.
- Pruebas.

 ### Preferir

```
db(migration): crear tabla players
```

```
feat(player): implementar endpoint de jugadores
```

```
feat(player): agregar componente de jugadores
```

```
test(player): agregar pruebas de jugadores
```

```
docs(player): documentar API de jugadores
```

 Esto permite revertir cambios independientemente.

---

 # 13\. Regla de un solo propósito

 Un commit debe responder claramente:

 > ¿Qué cambio lógico representa este commit?

 Si la respuesta contiene "y además", probablemente conviene dividir el commit.

 ### Poco recomendable

```
feat(player): agregar jugadores y modificar base de datos y actualizar documentación
```

 ### Recomendado

```
db(migration): crear tabla players
```

```
feat(player): agregar API de jugadores
```

```
feat(player): agregar interfaz de jugadores
```

```
docs(player): documentar módulo de jugadores
```

---

 # 14\. Breaking Changes

 Cuando un cambio rompe compatibilidad con una API, estructura, contrato o comportamiento existente, debe marcarse como `BREAKING CHANGE`.

 Se puede utilizar `!`:

```
feat(api)!: cambiar estructura de respuesta de jugadores
```

 También se puede documentar en el cuerpo del commit:

```
feat(api)!: cambiar respuesta del endpoint players

BREAKING CHANGE: el campo `name` ahora se divide en
`first_name` y `last_name`.
```

 El carácter `!` indica que existe un cambio incompatible.

---

 # 15\. Semantic Versioning

 El proyecto utilizará:

```
MAJOR.MINOR.PATCH
```

 Ejemplo:

```
1.4.2
```

---

 ## 15.1 MAJOR

 Se incrementa cuando existen cambios incompatibles.

```
1.4.2 → 2.0.0
```

 Ejemplos:

 - Cambio incompatible de API.
- Eliminación de endpoints.
- Cambio incompatible del modelo de datos.
- Cambio que requiere modificaciones importantes en los clientes.

---

 ## 15.2 MINOR

 Se incrementa cuando se agrega una funcionalidad compatible.

```
1.4.2 → 1.5.0
```

 Ejemplos:

```
feat(player): agregar búsqueda por nacionalidad
```

```
feat(auth): agregar refresh token
```

---

 ## 15.3 PATCH

 Se incrementa cuando se realizan correcciones compatibles.

```
1.4.2 → 1.4.3
```

 Ejemplos:

```
fix(player): corregir validación de posición
```

```
fix(auth): corregir expiración del token
```

---

 # 16\. Relación entre commits y versiones

 | Tipo de commit | Incremento |
| --- | --- |
| `fix` | PATCH |
| `feat` | MINOR |
| `feat!` | MAJOR |
| `BREAKING CHANGE` | MAJOR |
| `refactor` | Sin incremento |
| `test` | Sin incremento |
| `docs` | Sin incremento |
| `style` | Sin incremento |
| `chore` | Sin incremento |
| `build` | Normalmente sin incremento |
| `ci` | Sin incremento |
| `perf` | Depende del impacto |
| `db` | Depende del impacto |

Esta tabla define la política operativa del proyecto. El impacto real debe evaluarse según la compatibilidad y comportamiento público del cambio.

---

 # 17\. Ejemplo de desarrollo de una funcionalidad

 Supongamos que se implementa el módulo de jugadores.

 ## Paso 1 — Base de datos

```
db(migration): crear tabla players
```

 ## Paso 2 — Backend

```
feat(player): crear modelo de jugadores
```

```
feat(player): agregar servicio de jugadores
```

```
feat(api): agregar endpoint de jugadores
```

 ## Paso 3 — Pruebas

```
test(player): agregar pruebas del servicio
```

 ## Paso 4 — Frontend

```
feat(player): crear componente PlayerList
```

```
feat(player): integrar API de jugadores
```

 ## Paso 5 — Documentación

```
docs(api): documentar endpoint de jugadores
```

---

 # 18\. Ejemplo de historial

 Un historial esperado podría verse así:

```
db(migration): crear tabla players
db(migration): crear relación players_positions
feat(player): implementar servicio de jugadores
feat(api): agregar endpoint de jugadores
test(player): agregar pruebas del servicio
feat(player): crear componente PlayerList
feat(player): integrar API de jugadores
docs(api): documentar endpoints de jugadores
```

 ### Evitar historiales como:

```
update
fix
changes
final
final2
final-final
arreglos
```

---

 # 19\. Reglas para mensajes de commit

 ## 19.1 Primera letra

 La descripción debe comenzar en minúscula.

 ### Correcto

```
feat(player): agregar filtro por posición
```

 ### Incorrecto

```
feat(player): Agregar filtro por posición
```

---

 ## 19.2 Sin punto final

 ### Correcto

```
fix(auth): corregir validación del token
```

 ### Incorrecto

```
fix(auth): corregir validación del token.
```

---

 ## 19.3 Usar infinitivo

 ### Correcto

```
feat(player): agregar búsqueda por nombre
```

 ### Evitar

```
feat(player): agregando búsqueda por nombre
```

---

 ## 19.4 Evitar información innecesaria

 ### Evitar

```
fix(player): corregir algunas cosas que estaban fallando
```

 ### Preferir

```
fix(player): corregir búsqueda por nacionalidad
```

---

 # 20\. Commits recomendados para configuración

 ## Git

```
chore(git): agregar gitignore
```

 ## Node.js

```
build(frontend): configurar proyecto Node
```

 ## Svelte

```
build(frontend): configurar Svelte
```

 ## Rollup

```
build(frontend): configurar Rollup
```

 ## Flask

```
build(backend): inicializar aplicación Flask
```

 ## Base de datos

```
db(schema): crear esquema inicial
```

---

 # 21\. Relación entre estructura y scopes

 La estructura del proyecto se puede mapear de la siguiente manera:

```
db/                  → db
db/migrations/       → migration
db/schema.sql        → schema

docs/                → docs

package.json         → build / deps
package-lock.json    → build / deps

requirements.txt     → build / deps

scripts/             → scripts

README.md            → docs

frontend Svelte      → frontend
backend Flask        → backend / api
```

---

 # 22\. Versiones y tags

 Las versiones publicadas deben utilizar Git tags.

 Formato:

```
vMAJOR.MINOR.PATCH
```

 Ejemplos:

```
v1.0.0
v1.1.0
v1.1.1
v2.0.0
```

 Crear una versión:

```
git tag -a v1.2.0 -m "Release v1.2.0"
```

 Publicar el tag:

```
git push origin v1.2.0
```

---

 # 23\. Changelog

 Las versiones publicadas deben documentarse mediante un archivo:

```
CHANGELOG.md
```

 Ejemplo:

```
# Changelog

## [1.2.0] - 2026-09-26

### Added

- Autenticación JWT.
- Endpoint de jugadores.
- Componente Svelte para jugadores.

### Fixed

- Validación de email.

### Database

- Nueva tabla `players`.
- Nueva relación `players_positions`.

### Documentation

- Documentación del endpoint de jugadores.
```

---

 # 24\. Reglas especiales para la base de datos

 La base de datos tiene una característica especial:

```
db/migrations/
```

 Las migraciones representan un historial y, por lo tanto:

 1. No se deben eliminar migraciones aplicadas.
2. No se deben modificar migraciones ya ejecutadas.
3. Cada modificación estructural debe crear una nueva migración.
4. El nombre de la migración debe ser descriptivo.
5. El commit debe indicar claramente el propósito.
6. Las migraciones deben poder ejecutarse en el orden establecido.
7. Una migración debe representar un cambio lógico.

 ### Ejemplo

 Archivo:

```
20260926153000_add_birth_date_to_players.sql
```

 Commit:

```
db(migration): agregar fecha de nacimiento a players
```

---

 # 25\. Regla para archivos de datos

 Los archivos ubicados en `scripts/` deben tratarse según su propósito.

 ### CSV

```
chore(data): actualizar dataset de jugadores
```

 ### Scripts SQL

```
db(seed): actualizar datos iniciales de equipos
```

 ### Notebook

```
chore(scripts): actualizar notebook de carga de jugadores
```

 ### Script de transformación

```
chore(scripts): actualizar transformación de jugadores
```

---

 # 26\. Regla para documentación técnica

 Los documentos dentro de `docs/` deben utilizar commits `docs`.

 Ejemplos:

```
docs(db): actualizar diccionario de datos
```

```
docs(db): actualizar modelo entidad relación
```

```
docs(api): documentar endpoints
```

```
docs(project): actualizar arquitectura del proyecto
```

---

 # 27\. Regla para cambios múltiples

 Si un cambio afecta varias áreas pero forma parte de una única funcionalidad, se debe evaluar si puede mantenerse como un único commit.

 Por ejemplo:

```
feat(player): agregar búsqueda por nacionalidad
```

 podría incluir:

```
db/
backend/
frontend/
tests/
```

 si todos los cambios forman parte de la misma funcionalidad.

 Sin embargo, si los cambios son independientes, deben separarse.

 ### Ejemplo

 No mezclar:

```
feat(player): agregar búsqueda por nacionalidad
chore(project): reorganizar carpetas
docs(readme): corregir instalación
```

 en un único commit.

 Separar:

```
feat(player): agregar búsqueda por nacionalidad
```

```
chore(project): reorganizar estructura de directorios
```

```
docs(readme): corregir instrucciones de instalación
```

---

 # 28\. Revisión antes del commit

 Antes de crear un commit:

```
git status
```

 Revisar los cambios:

```
git diff
```

 Agregar archivos:

```
git add .
```

 Revisar lo que será incluido:

```
git diff --staged
```

 Crear el commit:

```
git commit -m "feat(player): agregar búsqueda por nacionalidad"
```

 Revisar historial:

```
git log --oneline --decorate --graph
```

---

 # 29\. Checklist

 Antes de realizar un commit:

```
[ ] El commit tiene un solo propósito.
[ ] El tipo de commit es correcto.
[ ] El scope identifica correctamente el módulo.
[ ] La descripción está en infinitivo.
[ ] La descripción comienza en minúscula.
[ ] La descripción no termina con punto.
[ ] El mensaje describe el cambio real.
[ ] No existen archivos innecesarios incluidos.
[ ] Las pruebas correspondientes fueron ejecutadas.
[ ] Las migraciones están correctamente versionadas.
[ ] Las dependencias están actualizadas.
[ ] La documentación fue actualizada cuando corresponde.
[ ] No se modificaron migraciones ya ejecutadas.
```

---

 # 30\. Plantilla rápida

 La plantilla general es:

```
<tipo>(<scope>): <descripción>
```

 Ejemplos:

```
feat(player): agregar búsqueda de jugadores
fix(auth): corregir validación del token
refactor(api): separar lógica de negocio
test(player): agregar pruebas de jugadores
docs(api): documentar endpoints
build(deps): actualizar dependencias
ci(github): agregar pipeline de integración continua
perf(db): optimizar consulta de jugadores
db(migration): agregar índice a players
chore(git): actualizar gitignore
```

 Para cambios incompatibles:

```
feat(api)!: cambiar contrato del endpoint players
```

---

 # 31\. Referencia rápida de tipos

 | Tipo | Descripción | Versión |
| --- | --- | --- |
| `feat` | Nueva funcionalidad | MINOR |
| `fix` | Corrección de error | PATCH |
| `refactor` | Reestructuración interna | - |
| `test` | Pruebas | - |
| `docs` | Documentación | - |
| `style` | Formato | - |
| `perf` | Rendimiento | Depende |
| `build` | Build/dependencias | Depende |
| `ci` | Integración continua | - |
| `chore` | Mantenimiento | - |
| `db` | Base de datos | Depende |

---

 # 32\. Referencia rápida de scopes

 | Scope | Componente |
| --- | --- |
| `frontend` | Svelte |
| `backend` | Flask |
| `api` | API |
| `auth` | Autenticación |
| `player` | Jugadores |
| `team` | Equipos |
| `league` | Ligas |
| `nation` | Naciones |
| `position` | Posiciones |
| `play-style` | Estilos de juego |
| `goalkeeper` | Arqueros |
| `db` | Base de datos |
| `migration` | Migraciones |
| `schema` | Esquema |
| `seed` | Datos iniciales |
| `deps` | Dependencias |
| `docs` | Documentación |
| `scripts` | Scripts |
| `config` | Configuración |
| `ci` | CI/CD |
| `deploy` | Despliegue |

---

 # 33\. Ejemplo completo de desarrollo

 Una funcionalidad completa podría generar el siguiente historial:

```
db(migration): crear tabla players
db(migration): crear relación players_positions
feat(player): crear modelo de jugadores
feat(player): implementar repositorio de jugadores
feat(player): implementar servicio de jugadores
feat(api): agregar endpoint de jugadores
test(player): agregar pruebas del servicio
test(api): agregar pruebas del endpoint
feat(player): crear componente PlayerList
feat(player): integrar API de jugadores
docs(api): documentar endpoints de jugadores
```

 Posteriormente se publica:

```
v1.1.0
```

---

 # 34\. Ejemplo de corrección

 Supongamos que la API permite registrar un jugador con un email inválido.

 Commit:

```
fix(player): corregir validación de email
```

 Prueba:

```
test(player): agregar prueba para email inválido
```

 Si la corrección es compatible:

```
1.1.0 → 1.1.1
```

---

 # 35\. Ejemplo de cambio incompatible

 Supongamos que el endpoint:

```
GET /api/players
```

 antes devuelve:

```
{
  "name": "Lionel Messi"
}
```

 y ahora devuelve:

```
{
  "first_name": "Lionel",
  "last_name": "Messi"
}
```

 El cambio rompe a los consumidores existentes.

 Commit:

```
feat(api)!: cambiar estructura de respuesta de players
```

 Cuerpo:

```
BREAKING CHANGE: el campo `name` fue reemplazado
por `first_name` y `last_name`.
```

 La versión pasa de:

```
1.x.x → 2.0.0
```

---

 # 36\. Objetivo del historial Git

 El historial de Git debe poder leerse como una historia del proyecto.

 Un desarrollador que no haya participado en el desarrollo debería poder ejecutar:

```
git log
```

 y comprender:

 - Qué funcionalidades fueron agregadas.
- Qué errores fueron corregidos.
- Qué partes fueron refactorizadas.
- Qué cambios ocurrieron en la base de datos.
- Qué dependencias fueron modificadas.
- Qué documentación fue actualizada.
- Qué cambios representan nuevas versiones.
- Qué cambios son incompatibles.

 El objetivo no es generar más commits.

 El objetivo es generar commits:

 - Pequeños.
- Atómicos.
- Trazables.
- Reversibles.
- Descriptivos.
- Técnicamente significativos.

---

 # 37\. Estándar definitivo

 Todo commit del proyecto debe seguir:

```
<TIPO>(<SCOPE>): <DESCRIPCIÓN>
```

 Ejemplo:

```
feat(player): agregar búsqueda por nacionalidad
```

 Los tipos principales son:

```
feat
fix
refactor
test
docs
style
perf
build
ci
chore
db
```

 Los cambios incompatibles deben utilizar:

```
feat(scope)!: descripción
```

 o:

```
BREAKING CHANGE:
```

 Las versiones deben seguir:

```
MAJOR.MINOR.PATCH
```

 con tags:

```
v1.0.0
v1.1.0
v1.1.1
v2.0.0
```

 Este estándar será la referencia oficial para los commits, versionamiento y trazabilidad del proyecto.