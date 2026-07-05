# Automatización — plan semanal cada lunes (Routine)

> Cómo dejar el planificador corriendo **solo cada lunes** usando **Routines** de Claude Code
> (`claude.ai/code/routines`). La routine levanta una sesión cloud, corre la skill
> `planificar-semana`, guarda el plan y lo pushea — sin que tengas que abrir nada.

## Por qué una Routine (y no el cron de sesión)

El cron dentro de una sesión (`/loop`, `CronCreate`) solo corre mientras esa sesión está
viva y **expira a los 7 días**. Una **Routine** corre en infraestructura de Anthropic, es
**persistente**, y se ejecuta aunque tengas todo cerrado. Es la opción correcta para un
"todos los lunes".

## Pasos para crearla (una sola vez)

1. Entra a **https://claude.ai/code/routines** y haz clic en **New routine**.
2. **Nombre:** `Plan de comidas semanal`.
3. **Prompt:** pega el bloque de abajo ("Prompt de la routine").
4. **Repositorio:** selecciona `mjromanh/Organizador-de-comidas-semanal`.
5. **Environment:** Default (Trusted) sirve — solo necesita acceso a GitHub para el push.
6. **Trigger → Schedule:** elige **Weekly**, día **lunes**, hora **~07:00** (tu zona; se
   convierte sola). Mínimo permitido: cada 1 hora (semanal está OK).
7. **Create.** Para probar de inmediato, abre la routine y haz clic en **Run now**.

> La routine empuja a ramas con prefijo `claude/` por defecto, así que puede escribir en
> `claude/magical-franklin-136dag` sin permisos extra.

## Prompt de la routine (pégalo tal cual)

```
Eres el planificador de comidas y compras de este hogar. Trabaja en el repositorio
mjromanh/Organizador-de-comidas-semanal, rama claude/magical-franklin-136dag (es la rama
por defecto; ahí viven las skills y los archivos de referencia).

1. Ponte en esa rama y con lo último:
   git fetch origin claude/magical-franklin-136dag
   git checkout claude/magical-franklin-136dag
   git pull origin claude/magical-franklin-136dag

2. CIERRE: si en planes/ hay un plan de la semana que recién terminó, corre la skill
   `cerrar-semana` para registrar sus preparaciones en bitacora.md (así la semana nueva
   no repite). Si no hay semana previa, sáltate este paso.

3. AJUSTES (opcional): revisa `ajustes_semana.md`. Si su sección "Ajustes" tiene indicaciones,
   aplícalas al plan de esta semana (sin pasar por encima de las dietas ni las reglas duras;
   si chocan, mandan las reglas y avísalo). Si está vacío, ignóralo.

4. PLANIFICA: ejecuta la skill `planificar-semana` para el próximo ciclo (martes a lunes), con
   las 7 tareas completas. Guarda el plan en planes/semana-AAAA-MM-DD.md (la fecha es el martes
   que abre el ciclo). Si aplicaste ajustes, indícalo al inicio del plan y luego vacía la sección
   "Ajustes" de ajustes_semana.md (déjala solo con el placeholder).

5. VERIFICA: corre la skill `verificar-semana` sobre el plan nuevo (chequeo independiente de los
   7 entregables + dietas, frecuencias, rotación, cobertura, cantidades por headcount, conservación
   y presupuesto). Si encuentra ❌, corrige con `planificar-semana` y vuelve a verificar hasta ✅.

6. Haz commit (plan nuevo + bitacora + ajustes_semana vaciado) y push a la rama
   claude/magical-franklin-136dag. NO abras pull request.

7. En el mensaje final presenta el **plan completo** (las 7 tareas) + la **lista de compras para
   WhatsApp** + la **hoja de la cocinera para enviar** (por día de cocina) + el resultado del
   verificador (✅ o los ❌). Autocontenido: todo se ve en la sesión, sin abrir GitHub.
```

## Notas

- **Rama por defecto:** la routine clona la rama por defecto del repo y luego hace checkout
  de `claude/magical-franklin-136dag` (paso 1). Si más adelante mergeas el proyecto a `main`,
  puedes simplificar el paso 1.
- **Cadencia y ciclo:** corre el **lunes**; el plan generado es para el ciclo que empieza el
  **martes siguiente** (un día después), que es justo cuando llegan las compras.
- **Ajustes de la semana (paso opcional tuyo):** si quieres pedir algo puntual para el próximo
  plan (un plato o papilla en particular, qué hay en stock, invitados, no comprar X, otro
  presupuesto), escríbelo en **`ajustes_semana.md`** (sección "Ajustes") y **commitea/pushea a
  la rama antes del lunes**. La Routine lo aplica esa semana y **vacía el archivo solo** después,
  así no se arrastra. Si lo dejas vacío, la semana se planifica normal, sin que tengas que hacer nada.
- **Cierre de semana (automático):** `cerrar-semana` **ya corre solo** como **paso 2** de
  esta misma Routine, cada lunes, **antes** de planificar: registra en `bitacora.md` las
  preparaciones de la semana que terminó para que la nueva no las repita. No hay que correrlo
  a mano. *(En la primera corrida, al no haber semana previa, el paso se salta solo.)*
- **Gestión:** pausar, editar el prompt o el horario, y ver cada corrida desde la misma
  página de la routine. Cada corrida queda como una sesión que puedes abrir y revisar.
```
