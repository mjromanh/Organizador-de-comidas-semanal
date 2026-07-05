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
mjromanh/Organizador-de-comidas-semanal.

1. Ponte en la rama del proyecto (ahí viven las skills y los 8 archivos de referencia):
   git fetch origin claude/magical-franklin-136dag
   git checkout claude/magical-franklin-136dag
   git pull origin claude/magical-franklin-136dag

2. CIERRE: si en planes/ hay un plan de la semana que recién terminó, corre la skill
   `cerrar-semana` para registrar sus preparaciones en bitacora.md (así la semana nueva
   no repite). Si es la primera corrida y no hay semana previa, sáltate este paso.

3. PLANIFICA: ejecuta `planificar-semana` para el próximo ciclo (martes a lunes), con las
   7 tareas. Antes de armar el menú revisa `ajustes_semana.md`: si tiene indicaciones, aplícalas
   esta semana (sin pasar por encima de las dietas/reglas duras) y luego vacía su sección
   "Ajustes"; si está vacío, ignóralo. Guarda el plan en planes/semana-AAAA-MM-DD.md (la fecha
   es el martes que abre el ciclo).

4. VERIFICA: corre `verificar-semana` sobre el plan nuevo (doble chequeo independiente de
   dietas, frecuencias, cobertura, cantidades por headcount y presupuesto). Si encuentra
   ❌, corrige con `planificar-semana` y vuelve a verificar antes de seguir.

5. Haz commit (plan nuevo + bitacora actualizada) y push a la rama
   claude/magical-franklin-136dag. NO abras pull request.

6. En el mensaje final presenta el **plan completo** (las 7 tareas) + la lista de compras
   para WhatsApp + el resultado del verificador (✅ o los ❌). Que la corrida sea
   autocontenida: todo se ve abriendo la sesión, sin tener que abrir GitHub.
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
