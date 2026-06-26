# Organizador de comidas semanal — plantilla

Planificador de comidas y compras que **vive dentro de Claude**. Tú le cuentas cómo es tu
hogar una vez, y cada semana te entrega el menú, la lista de compras, el plan de cocina, el
guardado, las indicaciones por día, el descongelado y las notas de seguridad — adaptados por
comensal cuando hay dietas distintas, sobre una base común.

Esta es la **versión genérica**: sirve para cualquier hogar (una persona o varias, con o sin
niños, con cualquier dieta o ninguna).

> **Alcance:** pensado para **Chile** — la lista de compras usa **pesos chilenos (CLP)** y
> productos/tiendas locales. No está adaptado a otros países (moneda/unidades/marcas).

## Empezar (solo contestar)

**Abre este repositorio en Claude Code y listo: Claude te saluda y empieza a preguntarte solo**
(gracias a un hook de arranque). Tú **solo contestas** sobre tu hogar: comensales, dietas, días
de cocina, equipos, presupuesto, gustos. Con tus respuestas, Claude:

1. Genera tus archivos de referencia personalizados en la raíz (a partir de `plantillas/`).
2. Arma tu **primer plan** de la semana y lo **verifica**.
3. Deja todo commiteado.

No necesitas escribir comandos. *(Si prefieres iniciarlo a mano, igual puedes correr
**`/configurar-hogar`**.)*

Para que el plan se genere **solo cada semana**, queda un último paso (crear una Routine): ver
`AUTOMATION.md`.

### Comandos disponibles (por si los quieres a mano)
- **`/configurar-hogar`** — la entrevista de configuración.
- **`/planificar-semana`** — arma la semana y guarda el plan en `planes/`.
- **`/verificar-semana`** — doble verificador: revisa que el plan cumpla todas las reglas.
- **`/cerrar-semana`** — al terminar la semana, actualiza la bitácora y registra marcas o
  platos nuevos que resultaron.

## Cómo está organizado

**Motor (igual para todos los hogares):**
- `instrucciones_agente_planificador.md` — la especificación del agente (qué entrega y cómo).
- `.claude/skills/configurar-hogar/` — la entrevista de configuración.
- `.claude/skills/planificar-semana/` — el planificador semanal.
- `.claude/skills/verificar-semana/` — el doble verificador del plan.
- `.claude/skills/cerrar-semana/` — el cierre y la mejora continua.

**Plantillas (moldes que se rellenan en la configuración):**
- `plantillas/` — versiones en blanco de los archivos de tu hogar.

**Tus datos (se generan con `/configurar-hogar`, en la raíz):**
- `organizacion_hogar.md`, `perfiles_dieta.md`, `marcas_y_productos.md`,
  `platos_de_referencia.md`, `bitacora.md`, y —si aplica— `pauta_nutricionista_bebe.md` y
  `receta_papilla.md`.

**Salidas:**
- `planes/` — los planes semanales generados.

## Automático

Para que el plan se genere solo cada semana, ver **`AUTOMATION.md`** (se configura una
**Routine** de Claude Code que corre `/planificar-semana` en el día que elijas y deja el plan
en el repo).

## Compartirlo

Este repo es la plantilla. Cualquiera puede duplicarlo (o usarlo como template de GitHub),
abrirlo en Claude Code y correr `/configurar-hogar` para tener su propio planificador.
