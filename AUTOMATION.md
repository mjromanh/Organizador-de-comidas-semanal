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

2. Ejecuta la skill `planificar-semana`: lee los archivos de referencia y arma el plan
   completo del próximo ciclo (martes a lunes), con las 7 tareas (menú, lista de compras,
   plan de cocina, guardado, hoja por día, descongelado y notas de seguridad). Guarda el
   plan en planes/semana-AAAA-MM-DD.md (la fecha es el martes que abre el ciclo).

3. Aplica y reporta las verificaciones que define instrucciones_agente_planificador.md
   (dietas, frecuencias del bebé, vacuno <=2, 1 sola preparación de pescado, papillas del
   stock, cantidades para todos los comensales incluidos los adicionales, total bajo el
   tope con subtotales).

4. Haz commit del plan nuevo y push a la rama claude/magical-franklin-136dag.
   NO abras pull request.

5. En el mensaje final, muestra el menú resumido y la lista de compras lista para WhatsApp.
```

## Notas

- **Rama por defecto:** la routine clona la rama por defecto del repo y luego hace checkout
  de `claude/magical-franklin-136dag` (paso 1). Si más adelante mergeas el proyecto a `main`,
  puedes simplificar el paso 1.
- **Cadencia y ciclo:** corre el **lunes**; el plan generado es para el ciclo que empieza el
  **martes siguiente** (un día después), que es justo cuando llegan las compras.
- **Cierre de semana:** `cerrar-semana` (bitácora) se puede dejar como otra routine semanal
  (p. ej. lunes más tarde), o seguir corriéndola a mano. A definir.
- **Gestión:** pausar, editar el prompt o el horario, y ver cada corrida desde la misma
  página de la routine. Cada corrida queda como una sesión que puedes abrir y revisar.
```
