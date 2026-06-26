# Organizador de comidas semanal

Planificador de comidas y compras que **vive dentro de Claude**. Lee los datos de
tu hogar (los archivos de referencia de abajo) y entrega cada semana el menú, la
lista de compras, el plan de cocina, el guardado, las indicaciones por día, el
plan de descongelado y las notas de seguridad — adaptados por comensal cuando hay
dietas distintas, sobre una base común.

## Cómo se usa

Dentro de Claude Code, en este repositorio:

- **`/planificar-semana`** — arma la semana completa (las 7 tareas) y guarda el
  plan en `planes/semana-AAAA-MM-DD.md`. Te muestra el menú y la lista de compras
  lista para WhatsApp.
- **`/verificar-semana`** — doble verificador independiente: revisa que el plan generado
  cumpla todas las reglas (dietas, frecuencias, cobertura, cantidades, presupuesto).
- **`/cerrar-semana`** — al terminar la semana, actualiza la bitácora y propone
  registrar marcas o platos nuevos que resultaron.

## Cómo está organizado

**Lógica (vive en Claude, igual para todos los hogares):**

- `.claude/skills/planificar-semana/` — la skill que planifica la semana.
- `.claude/skills/verificar-semana/` — el doble verificador del plan.
- `.claude/skills/cerrar-semana/` — la skill de cierre y mejora continua.
- `instrucciones_agente_planificador.md` — la especificación maestra del agente
  (qué entrega y cómo). Las skills la siguen al pie de la letra.

**Datos de tu hogar (lo que cambia de una casa a otra):**

- `organizacion_hogar.md` — días/horarios de cocina, equipos, conservación,
  presupuesto y tope, ciclo de compra.
- `perfiles_dieta.md` — comensales, cobertura, reglas y frecuencias de proteína.
- `pauta_nutricionista_bebe.md` — pauta oficial del bebé.
- `receta_papilla.md` — receta y método de la papilla.
- `marcas_y_productos.md` — marcas y formatos para la lista de compras *(aprende)*.
- `platos_de_referencia.md` — platos que funcionan, para proponer y rotar *(aprende)*.
- `bitacora.md` — preparaciones recientes, para no repetir *(aprende)*.

**Salidas:**

- `planes/` — los planes semanales generados.

## En camino

- **Automático:** una tarea programada que corre `/planificar-semana` sola cada
  semana (el ciclo pide el lunes, cocina el martes → el plan queda listo el lunes).
- **Versión exportable:** plantillas genéricas + una skill `/configurar-hogar` que
  entrevista a una persona nueva y le genera sus propios archivos, para que active
  este mismo planificador en su Claude.
