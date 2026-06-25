# Automatización — plan semanal automático (Routine)

> Cómo dejar el planificador corriendo **solo cada semana** usando **Routines** de Claude Code
> (`claude.ai/code/routines`). La routine levanta una sesión cloud, corre `planificar-semana`,
> guarda el plan y lo pushea — sin que tengas que abrir nada.

## Requisito previo

Haber corrido **`/configurar-hogar`** al menos una vez (para que existan tus archivos de
referencia) y tener un primer plan validado a mano.

## Pasos (una sola vez)

1. Entra a **https://claude.ai/code/routines** → **New routine**.
2. **Nombre:** `Plan de comidas semanal`.
3. **Prompt:** pega el bloque de abajo.
4. **Repositorio:** selecciona este repo.
5. **Environment:** Default (Trusted) — solo necesita acceso a GitHub para el push.
6. **Trigger → Schedule → Weekly**, el día y hora que prefieras (la víspera del día de compra).
7. **Create** (y **Run now** para una prueba).

## Prompt de la routine

```
Eres el planificador de comidas y compras de este hogar. Trabaja en este repositorio.

1. Asegúrate de estar en la rama del proyecto y con lo último (git pull).
2. Ejecuta la skill `planificar-semana`: lee los archivos de referencia y arma el plan
   completo del próximo ciclo, con las 7 tareas (menú, lista de compras, plan de cocina,
   guardado, hoja por día, descongelado y notas de seguridad). Guarda el plan en
   planes/semana-AAAA-MM-DD.md.
3. Aplica y reporta las verificaciones que define instrucciones_agente_planificador.md
   (dietas, frecuencias, cantidades para todos los comensales, total bajo el tope).
4. Haz commit del plan nuevo y push. NO abras pull request.
5. En el mensaje final, muestra el menú resumido y la lista de compras lista para WhatsApp.
```

## Notas

- La routine es **persistente** (no expira), corre en la nube aunque tengas todo cerrado.
- Empuja por defecto a ramas con prefijo `claude/`; si quieres que escriba en otra rama,
  habilita *Allow unrestricted branch pushes* para este repo en la routine.
- El resultado aparece como una **corrida** en la página de la routine y como archivo en
  `planes/`. (No envía correo por sí solo; para eso haría falta un conector.)
- El **cierre de semana** (`cerrar-semana`) puede ser otra routine, o correrse a mano.
