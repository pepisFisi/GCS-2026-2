# Diccionario de Datos

## 1. Descripción

El presente diccionario de datos documenta la estructura de la base de datos relacional utilizada para gestionar la información de jugadores, posiciones, equipos, naciones, ligas, estilos de juego, pies preferidos y atributos específicos de porteros.

El modelo se encuentra diseñado bajo los principios de normalización hasta la **Tercera Forma Normal (3FN)** y utiliza las convenciones establecidas en el estándar de creación de tablas relacionales.

> **Actualización:** Este diccionario refleja el esquema MySQL generado con migraciones `dbmate`. Se incorporan los cambios reales: `leagues.nation_id`, `players.ranking` en lugar de `rank`, y `teams` sin `nation_id`.

---

# 2. Convenciones

| Convención | Descripción |
| --- | --- |
| PK | Primary Key. Identifica de forma única un registro |
| FK | Foreign Key. Referencia a la clave primaria de otra tabla |
| INT | Número entero |
| VARCHAR | Cadena de caracteres |
| 1:N | Relación uno a muchos |
| N:M | Relación muchos a muchos |
| 1:0..1 | Relación uno a cero o uno |

### Convenciones de nombres

- Los nombres de tablas están escritos en inglés.
- Los nombres de tablas utilizan plural.
- Los atributos utilizan `snake_case`.
- Todas las claves primarias se denominan `id`.
- Todas las claves primarias son de tipo `INT`.
- Las claves foráneas utilizan el formato `<table_singular>_id`.
- Las tablas asociativas utilizan el formato `<table1>_<table2>`.

---

# 3. Tabla `players`

## Descripción

Almacena la información principal de los jugadores.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único del jugador |
| `ranking` | INT | | Posición o ranking del jugador |
| `name` | VARCHAR(40) | | Nombre del jugador |
| `ovr` | INT | | Valoración general del jugador |
| `pac` | INT | | Valoración de velocidad |
| `sho` | INT | | Valoración de disparo |
| `pas` | INT | | Valoración de pase |
| `dri` | INT | | Valoración de regate |
| `def` | INT | | Valoración defensiva |
| `phy` | INT | | Valoración física |
| `weak_foot` | INT | | Valoración del pie débil |
| `skill_moves` | INT | | Nivel de movimientos de habilidad |
| `height` | INT | | Altura del jugador |
| `weight` | INT | | Peso del jugador |
| `age` | INT | | Edad del jugador |
| `url` | VARCHAR(200) | | URL asociada al registro o fuente del jugador |
| `position_id` | INT | FK | Referencia a la posición principal del jugador |
| `nation_id` | INT | FK | Referencia a la nación del jugador |
| `team_id` | INT | FK | Referencia al equipo actual del jugador |
| `foot_id` | INT | FK | Referencia al pie preferido del jugador |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `positions` | N:1 | `position_id` |
| `nations` | N:1 | `nation_id` |
| `teams` | N:1 | `team_id` |
| `foots` | N:1 | `foot_id` |
| `players_positions` | 1:N | `player_id` |
| `players_play_styles` | 1:N | `player_id` |
| `goalkeepers` | 1:0..1 | `player_id` |

---

# 4. Tabla `positions`

## Descripción

Almacena las posiciones principales y alternativas disponibles para los jugadores.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único de la posición |
| `name` | VARCHAR(5) | | Nombre de la posición |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players` | 1:N | `players.position_id` |
| `players_positions` | 1:N | `position_id` |

---

# 5. Tabla `nations`

## Descripción

Almacena las naciones o países asociados a los jugadores y ligas.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único de la nación |
| `name` | VARCHAR(40) | | Nombre de la nación |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players` | 1:N | `players.nation_id` |
| `leagues` | 1:N | `leagues.nation_id` |

---

# 6. Tabla `leagues`

## Descripción

Almacena las ligas o competiciones a las que pertenecen los equipos.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único de la liga |
| `name` | VARCHAR(40) | | Nombre de la liga |
| `nation_id` | INT | FK | Referencia a la nación asociada a la liga |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `nations` | N:1 | `nation_id` |
| `teams` | 1:N | `teams.league_id` |

> Nota: Para que la relación `leagues 1:N teams` esté reflejada en el modelo físico, la tabla `teams` contiene el atributo `league_id`.

---

# 7. Tabla `teams`

## Descripción

Almacena la información de los equipos a los que pertenecen los jugadores.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único del equipo |
| `name` | VARCHAR(40) | | Nombre del equipo |
| `league_id` | INT | FK | Referencia a la liga a la que pertenece el equipo |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `leagues` | N:1 | `league_id` |
| `players` | 1:N | `team_id` |

---

# 8. Tabla `play_styles`

## Descripción

Almacena los diferentes estilos de juego que pueden estar asociados a los jugadores.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único del estilo de juego |
| `name` | VARCHAR(20) | | Nombre del estilo de juego |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players_play_styles` | 1:N | `play_style_id` |

---

# 9. Tabla `foots`

## Descripción

Catálogo de pies preferidos disponibles para los jugadores.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único del pie |
| `name` | VARCHAR(5) | | Nombre del pie |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players` | 1:N | `foot_id` |

---

# 10. Tabla `players_positions`

## Descripción

Tabla asociativa que representa la relación muchos a muchos entre jugadores y posiciones.

Permite almacenar las posiciones alternativas que puede desempeñar cada jugador.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único de la relación |
| `player_id` | INT | FK | Referencia al jugador |
| `position_id` | INT | FK | Referencia a la posición |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players` | N:1 | `player_id` |
| `positions` | N:1 | `position_id` |

### Regla de negocio

Un jugador puede tener múltiples posiciones alternativas y una posición puede estar asociada a múltiples jugadores.

```text
players N ---- M positions
```

La relación se resuelve mediante `players_positions`.

---

# 11. Tabla `players_play_styles`

## Descripción

Tabla asociativa que representa la relación muchos a muchos entre jugadores y estilos de juego.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único de la relación |
| `player_id` | INT | FK | Referencia al jugador |
| `play_style_id` | INT | FK | Referencia al estilo de juego |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players` | N:1 | `player_id` |
| `play_styles` | N:1 | `play_style_id` |

### Regla de negocio

Un jugador puede tener múltiples estilos de juego y un estilo de juego puede estar asociado a múltiples jugadores.

```text
players N ---- M play_styles
```

La relación se resuelve mediante `players_play_styles`.

---

# 12. Tabla `goalkeepers`

## Descripción

Almacena los atributos específicos de los jugadores que tienen características de portero.

La tabla representa una especialización de la entidad `players`.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `id` | INT | PK | Identificador único del registro de portero |
| `player_id` | INT | FK | Referencia al jugador |
| `gk_diving` | INT | | Valoración de reflejos o capacidad de estirada |
| `gk_handling` | INT | | Valoración de manejo del balón |
| `gk_kicking` | INT | | Valoración de saque o golpeo |
| `gk_positioning` | INT | | Valoración de posicionamiento |
| `gk_reflexes` | INT | | Valoración de reflejos |

### Relaciones

| Tabla relacionada | Cardinalidad | Clave foránea |
| --- | --- | --- |
| `players` | N:1 | `player_id` |

### Regla de negocio

Un jugador puede tener cero o un registro en `goalkeepers`.

```text
players 1 ---- 0..1 goalkeepers
```

> **Nota:** El esquema actual no impone una restricción `UNIQUE` sobre `goalkeepers.player_id`. La cardinalidad 1:0..1 se mantiene como regla de negocio, pero no está forzada a nivel de base de datos.

---

# 13. Resumen de relaciones

| Entidad origen | Entidad destino | Cardinalidad | Implementación |
| --- | --- | --- | --- |
| `nations` | `players` | 1:N | `players.nation_id` |
| `nations` | `leagues` | 1:N | `leagues.nation_id` |
| `leagues` | `teams` | 1:N | `teams.league_id` |
| `positions` | `players` | 1:N | `players.position_id` |
| `teams` | `players` | 1:N | `players.team_id` |
| `foots` | `players` | 1:N | `players.foot_id` |
| `players` | `positions` | N:M | `players_positions` |
| `players` | `play_styles` | N:M | `players_play_styles` |
| `players` | `goalkeepers` | 1:0..1 | `goalkeepers.player_id` |

---

# 14. Matriz de claves foráneas

| Tabla | Atributo FK | Tabla referenciada | Atributo referenciado |
| --- | --- | --- | --- |
| `players` | `position_id` | `positions` | `id` |
| `players` | `nation_id` | `nations` | `id` |
| `players` | `team_id` | `teams` | `id` |
| `players` | `foot_id` | `foots` | `id` |
| `leagues` | `nation_id` | `nations` | `id` |
| `teams` | `league_id` | `leagues` | `id` |
| `players_positions` | `player_id` | `players` | `id` |
| `players_positions` | `position_id` | `positions` | `id` |
| `players_play_styles` | `player_id` | `players` | `id` |
| `players_play_styles` | `play_style_id` | `play_styles` | `id` |
| `goalkeepers` | `player_id` | `players` | `id` |

---

# 15. Resumen de tablas

| Tabla | Tipo | Propósito |
| --- | --- | --- |
| `players` | Entidad principal | Información de los jugadores |
| `positions` | Catálogo | Posiciones de los jugadores |
| `nations` | Catálogo | Naciones |
| `leagues` | Catálogo | Ligas, asociadas a una nación |
| `teams` | Entidad | Equipos, asociados a una liga |
| `play_styles` | Catálogo | Estilos de juego |
| `foots` | Catálogo | Pies preferidos |
| `players_positions` | Asociativa | Relación N:M entre jugadores y posiciones |
| `players_play_styles` | Asociativa | Relación N:M entre jugadores y estilos de juego |
| `goalkeepers` | Especialización | Atributos específicos de porteros |
| `schema_migrations` | Técnica | Control de versiones de migraciones `dbmate` |

---

# 16. Reglas de integridad

Las siguientes reglas deben cumplirse:

1. Cada registro de `players` debe tener un `id` único.
2. Cada registro de las tablas debe tener un `id` único.
3. Todo `position_id` de `players` debe existir en `positions.id`.
4. Todo `nation_id` de `players` debe existir en `nations.id`.
5. Todo `team_id` de `players` debe existir en `teams.id`.
6. Todo `foot_id` de `players` debe existir en `foots.id`.
7. Todo `nation_id` de `leagues` debe existir en `nations.id`.
8. Todo `league_id` de `teams` debe existir en `leagues.id`.
9. Todo `player_id` de `players_positions` debe existir en `players.id`.
10. Todo `position_id` de `players_positions` debe existir en `positions.id`.
11. Todo `player_id` de `players_play_styles` debe existir en `players.id`.
12. Todo `play_style_id` de `players_play_styles` debe existir en `play_styles.id`.
13. Todo `player_id` de `goalkeepers` debe existir en `players.id`.
14. Un jugador no debe tener más de un registro en `goalkeepers` (regla de negocio; el esquema actual no incluye restricción `UNIQUE`).
15. No se deben almacenar múltiples valores dentro de un único atributo.
16. Las relaciones N:M deben utilizar tablas asociativas.
17. Se debe evitar almacenar información redundante que pueda derivarse de otra entidad.

---

# 17. Consideraciones de normalización

El modelo debe mantenerse en Tercera Forma Normal (3FN).

Se deben cumplir las siguientes condiciones:

### Primera Forma Normal

Los atributos deben contener valores atómicos y no deben almacenar listas de valores.

### Segunda Forma Normal

Los atributos no clave deben depender completamente de la clave primaria.

### Tercera Forma Normal

Los atributos no clave no deben depender de otros atributos no clave.

Por ejemplo, la información del equipo debe mantenerse en `teams` y no duplicarse en `players`.

```text
players
-------
id
name
team_id
```

```text
teams
-----
id
name
```

En lugar de:

```text
players
-------
id
name
team_id
team_name
```

---

# 18. Fuente de los datos originales

El modelo relacional parte de un conjunto de datos con atributos como:

```text
id
Rank
Name
OVR
PAC
SHO
PAS
DRI
DEF
PHY
Position
Weak foot
Skill moves
Preferred foot
Height
Weight
Alternative positions
Age
Nation
League
Team
play style
GK Diving
GK Handling
GK Kicking
GK Positioning
GK Reflexes
```

Los atributos originales que representan entidades, catálogos o relaciones se descomponen en las tablas correspondientes para cumplir con los principios de normalización.

| Atributo original | Tabla destino |
| --- | --- |
| `Name` | `players.name` |
| `OVR` | `players.ovr` |
| `PAC` | `players.pac` |
| `SHO` | `players.sho` |
| `PAS` | `players.pas` |
| `DRI` | `players.dri` |
| `DEF` | `players.def` |
| `PHY` | `players.phy` |
| `Weak foot` | `players.weak_foot` |
| `Skill moves` | `players.skill_moves` |
| `Preferred foot` | `foots.name` |
| `Height` | `players.height` |
| `Weight` | `players.weight` |
| `Age` | `players.age` |
| `Position` | `positions.name` |
| `Alternative positions` | `players_positions` |
| `Nation` | `nations.name` |
| `League` | `leagues.name` |
| `Team` | `teams.name` |
| `play style` | `players_play_styles` |
| `GK Diving` | `goalkeepers.gk_diving` |
| `GK Handling` | `goalkeepers.gk_handling` |
| `GK Kicking` | `goalkeepers.gk_kicking` |
| `GK Positioning` | `goalkeepers.gk_positioning` |
| `GK Reflexes` | `goalkeepers.gk_reflexes` |
| `Rank` | `players.ranking` |
| `URL` | `players.url` |

> **Nota:** La tabla `leagues` incluye `nation_id`, que referencia a `nations.id`. Este valor puede derivarse de la nación asociada a la liga según la fuente original o asignarse durante la carga de datos.

---

# 19. Tabla técnica `schema_migrations`

## Descripción

Tabla utilizada por `dbmate` para llevar el control de las migraciones aplicadas.

| Atributo | Tipo | Clave | Descripción |
| --- | --- | --- | --- |
| `version` | VARCHAR(128) | PK | Versión de la migración aplicada |

### Relaciones

No tiene relaciones con las tablas del modelo de negocio.

---

# 20. Uso de `dbmate` para la gestión de migraciones

## 20.1 ¿Qué es `dbmate`?

`dbmate` es una herramienta de línea de comandos que permite gestionar migraciones de base de datos de forma sencilla y agnóstica del motor. En este proyecto se utiliza para versionar los cambios estructurales de la base de datos `fifa25` en MySQL.

Cada migración se escribe en un archivo SQL con un timestamp como prefijo. `dbmate` aplica las migraciones pendientes en orden y registra las versiones aplicadas en la tabla `schema_migrations`.

## 20.2 Estructura del proyecto de migraciones

```text
db
├── migrations
│   ├── 20260912215023_create_foots.sql
│   ├── 20260912220928_create_nations.sql
│   ├── 20260912221127_create_positions.sql
│   ├── 20260912221249_create_play_styles.sql
│   ├── 20260912221505_create_leagues.sql
│   ├── 20260912222836_create_teams.sql
│   ├── 20260912223016_alter_teams.sql
│   ├── 20260912223526_create_players.sql
│   ├── 20260912223721_create_players_positions.sql
│   ├── 20260912223753_create_players_play_styles.sql
│   └── 20260912223850_create_goalkeepers.sql
└── schema.sql
```

- `db/migrations/`: contiene los archivos SQL de cada migración.
- `db/schema.sql`: volcado del esquema actual generado por `dbmate dump`.

## 20.3 Scripts de NPM

El proyecto define los siguientes scripts en `package.json` para ejecutar `dbmate`:

```json
{
  "name": "svelte-app",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "scripts": {
    "db:new": "npx dbmate -d \"db/migrations\" -e \"DB\" new ",
    "db:up": "npx dbmate -d \"db/migrations\" -e \"DB\" up",
    "db:rollback": "npx dbmate -d \"db/migrations\" -e \"DB\" rollback",
    "db:dump": "npx dbmate -d \"db/migrations\" -e \"DB\" dump "
  },
  "dependencies": {
    "dbmate": "^2.15.0",
    "better-sqlite3": "^11.10.0",
    "mysql2": "^3.11.0"
  }
}
```

- `db:new`: crea un nuevo archivo de migración con el nombre indicado.
- `db:up`: aplica todas las migraciones pendientes.
- `db:rollback`: revierte la última migración aplicada.
- `db:dump`: genera el archivo `db/schema.sql`.

La variable de entorno `DB` debe contener la URL de conexión a MySQL, por ejemplo:

```bash
export DB="mysql://usuario:contraseña@localhost:3306/fifa25"
```

## 20.4 Flujo de trabajo real (sesión de terminal)

A continuación se muestra el flujo de trabajo seguido para llegar a la versión actual del esquema:

```bash
# Aplicar todas las migraciones pendientes
npm run db:up
# → Writing: ./db/schema.sql

# Revertir la última migración (create_leagues)
npm run db:rollback
# → Rolling back: 20260912221505_create_leagues.sql
# → Rolled back: 20260912221505_create_leagues.sql

# Revertir la siguiente migración (create_play_styles)
npm run db:rollback
# → Rolling back: 20260912221249_create_play_styles.sql
# → Rolled back: 20260912221249_create_play_styles.sql

# Volver a aplicar las migraciones revertidas
npm run db:up
# → Applying: 20260912221249_create_play_styles.sql
# → Applied: 20260912221249_create_play_styles.sql
# → Applying: 20260912221505_create_leagues.sql
# → Applied: 20260912221505_create_leagues.sql
# → Writing: ./db/schema.sql

# Revertir create_leagues nuevamente
npm run db:rollback
# → Rolling back: 20260912221505_create_leagues.sql
# → Rolled back: 20260912221505_create_leagues.sql

# Volver a aplicar create_leagues
npm run db:up
# → Applying: 20260912221505_create_leagues.sql
# → Applied: 20260912221505_create_leagues.sql
# → Writing: ./db/schema.sql

# Crear una nueva migración para la tabla teams
npm run db:new create_teams
# → Creating migration: db/migrations/20260912222836_create_teams.sql

# Aplicar la nueva migración
npm run db:up
# → Applying: 20260912222836_create_teams.sql
# → Applied: 20260912222836_create_teams.sql
# → Writing: ./db/schema.sql

# Crear una migración para alterar la tabla teams
npm run db:new alter_teams
# → Creating migration: db/migrations/20260912223016_alter_teams.sql

# Aplicar la migración de alteración
npm run db:up
# → Applying: 20260912223016_alter_teams.sql
# → Applied: 20260912223016_alter_teams.sql
# → Writing: ./db/schema.sql

# Crear migración para la tabla players
npm run db:new create_players
# → Creating migration: db/migrations/20260912223526_create_players.sql

# Aplicar migración de players (primer intento con error)
npm run db:up
# → Applying: 20260912223526_create_players.sql
# → Error: Error 1064 (42000): You have an error in your SQL syntax;
#   check the manual that corresponds to your MySQL server version for the right syntax
#   to use near 'rank INT NOT NULL, ...' at line 5

# Corregir el error renombrando `rank` a `ranking` en el archivo SQL
# y volver a aplicar
npm run db:up
# → Applying: 20260912223526_create_players.sql
# → Applied: 20260912223526_create_players.sql
# → Writing: ./db/schema.sql

# Crear migración para players_positions
npm run db:new create_players_positions
# → Creating migration: db/migrations/20260912223721_create_players_positions.sql

# Aplicar migración
npm run db:up
# → Applying: 20260912223721_create_players_positions.sql
# → Applied: 20260912223721_create_players_positions.sql
# → Writing: ./db/schema.sql

# Crear migración para players_play_styles
npm run db:new create_players_play_styles
# → Creating migration: db/migrations/20260912223753_create_players_play_styles.sql

# Aplicar migración
npm run db:up
# → Applying: 20260912223753_create_players_play_styles.sql
# → Applied: 20260912223753_create_players_play_styles.sql
# → Writing: ./db/schema.sql

# Crear migración para goalkeepers
npm run db:new create_goalkeepers
# → Creating migration: db/migrations/20260912223850_create_goalkeepers.sql

# Aplicar migración final
npm run db:up
# → Applying: 20260912223850_create_goalkeepers.sql
# → Applied: 20260912223850_create_goalkeepers.sql
# → Writing: ./db/schema.sql
```

## 20.5 Error encontrado y solución

Durante la creación de la tabla `players`, se utilizó inicialmente el nombre de columna `rank`, que es una palabra reservada en MySQL. Esto provocó el error:

```text
Error: Error 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank INT NOT NULL, ...' at line 5
```

**Solución:** Se renombró la columna `rank` a `ranking` en el archivo `20260912223526_create_players.sql`. Luego se volvió a ejecutar `npm run db:up` y la migración se aplicó correctamente.

## 20.6 Migraciones aplicadas

Las migraciones que componen esta versión son las siguientes:

| Versión | Archivo | Propósito |
| --- | --- | --- |
| `20260912215023` | `create_foots.sql` | Crea la tabla `foots` |
| `20260912220928` | `create_nations.sql` | Crea la tabla `nations` |
| `20260912221127` | `create_positions.sql` | Crea la tabla `positions` |
| `20260912221249` | `create_play_styles.sql` | Crea la tabla `play_styles` |
| `20260912221505` | `create_leagues.sql` | Crea la tabla `leagues` con `nation_id` |
| `20260912222836` | `create_teams.sql` | Crea la tabla `teams` |
| `20260912223016` | `alter_teams.sql` | Modifica `teams` (agrega `league_id` y FK) |
| `20260912223526` | `create_players.sql` | Crea la tabla `players` con sus FKs |
| `20260912223721` | `create_players_positions.sql` | Crea la tabla asociativa `players_positions` |
| `20260912223753` | `create_players_play_styles.sql` | Crea la tabla asociativa `players_play_styles` |
| `20260912223850` | `create_goalkeepers.sql` | Crea la tabla `goalkeepers` |

## 20.7 Relación con `schema_migrations`

`dbmate` inserta una fila en `schema_migrations` por cada migración aplicada. La tabla solo tiene la columna `version`, que coincide con el timestamp del nombre del archivo.

Ejemplo de contenido:

```sql
INSERT INTO `schema_migrations` (version) VALUES
  ('20260912215023'),
  ('20260912220928'),
  ('20260912221127'),
  ('20260912221249'),
  ('20260912221505'),
  ('20260912222836'),
  ('20260912223016'),
  ('20260912223526'),
  ('20260912223721'),
  ('20260912223753'),
  ('20260912223850');
```

## 20.8 Buenas prácticas

- **No modificar migraciones ya aplicadas** en entornos compartidos. Si se necesita un cambio, crear una nueva migración.
- **Mantener `db/schema.sql` actualizado** con `npm run db:dump` después de cada migración.
- **Versionar los archivos de migración** junto con el código.
- **Probar las migraciones** en una base de datos local antes de subirlas.
- **Usar nombres descriptivos** en los archivos, por ejemplo `create_players.sql`, `alter_teams.sql`.
- **No incluir datos de prueba** en las migraciones estructurales; para datos usar seeds o scripts aparte.
- **Evitar palabras reservadas** de MySQL en nombres de columnas (por ejemplo, `rank`). En su lugar, usar alternativas como `ranking`.

---

# 21. Conclusión

El modelo relacional se encuentra normalizado hasta 3FN y se gestiona mediante migraciones versionadas con `dbmate`. La tabla `schema_migrations` garantiza la trazabilidad de los cambios aplicados. Para reproducir esta versión, basta con configurar la variable de entorno `DB`, ejecutar `npm run db:up` y verificar el estado con `npm run db:dump`.