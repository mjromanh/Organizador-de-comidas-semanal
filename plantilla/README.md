# Organizador de comidas semanal — plantilla

Planificador de comidas y compras que **vive dentro de Claude**. Tú le cuentas cómo es tu
hogar una vez, y cada semana te entrega el menú, la lista de compras, el plan de cocina, el
guardado, las indicaciones por día, el descongelado y las notas de seguridad — adaptados por
comensal cuando hay dietas distintas, sobre una base común.

Esta es la **versión genérica**: sirve para cualquier hogar (una persona o varias, con o sin
niños, con cualquier dieta o ninguna).

## Empezar (una vez)

En Claude Code, abierto sobre este repositorio:

1. **`/configurar-hogar`** — Claude te entrevista (comensales, dietas, días de cocina,
   equipos, conservación, presupuesto, marcas, gustos) y genera tus archivos de referencia
   personalizados en la raíz del repo, a partir de las **plantillas** de `plantillas/`.

Eso es todo el setup. Después:

2. **`/planificar-semana`** — arma tu semana completa y guarda el plan en
   `planes/semana-AAAA-MM-DD.md` (te muestra el menú y la lista de compras lista para WhatsApp).
3. **`/cerrar-semana`** — al terminar la semana, actualiza la bitácora y registra marcas o
   platos nuevos que resultaron.

## Cómo está organizado

**Motor (igual para todos los hogares):**
- `instrucciones_agente_planificador.md` — la especificación del agente (qué entrega y cómo).
- `.claude/skills/configurar-hogar/` — la entrevista de configuración.
- `.claude/skills/planificar-semana/` — el planificador semanal.
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
