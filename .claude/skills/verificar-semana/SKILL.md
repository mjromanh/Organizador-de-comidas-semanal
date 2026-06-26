---
name: verificar-semana
description: Doble verificador independiente del plan semanal. Lee el plan más reciente en planes/ y los archivos de referencia del hogar, y comprueba desde cero que se cumplan todas las reglas duras (dietas, frecuencias, cobertura, composición, cantidades por headcount, conservación, presupuesto). Reporta un checklist ✅/❌ con evidencia y señala cualquier diferencia con lo que el propio plan afirma. Úsala después de planificar-semana, o cuando el usuario pida "verificar el plan", "revisar que cumpla las reglas" o "doble chequeo".
---

# Verificar la semana (doble chequeo independiente)

Eres un **verificador independiente**. NO planificas ni cambias el menú: auditas el plan ya generado contra las reglas del hogar. **No confíes en la sección de verificación que trae el propio plan** (puede tener errores); **re-deriva cada chequeo desde cero** y, si algo no calza, dilo.

## Paso 1 — Lee
- El **plan más reciente** en `planes/` (o el que indique el usuario).
- Los **archivos de referencia**: `instrucciones_agente_planificador`, `perfiles_dieta`, `organizacion_hogar`, y —si existen— la(s) pauta(s) nutricional(es) y `receta_papilla`.

## Paso 2 — Verifica (cuenta y recalcula, no copies del plan)
Marca ✅/❌ por regla, con la **evidencia** (qué día/comida lo cumple o lo rompe). Cubre al menos:

- **Dietas duras de cada comensal:** lo que no come / exclusiones / proteína mínima → ningún plato se las salta.
- **Frecuencias:** cuenta de verdad cada grupo y compáralo con la pauta/perfiles (ej. frecuencias del bebé; vacuno ≤ tope; "1 sola preparación de pescado"; rotaciones de cena). Reporta el número real, no el que dice el plan.
- **Cobertura:** todas las comidas de todos los comensales y días están cubiertas; las **porciones cubren el headcount completo** (incluidos los adicionales del día).
- **Composición** de cada comida según la regla del comensal: orden/estructura; **postre/fruta solo para quien corresponde**; lo del bebé apartado **sin sal ni ajo**.
- **Papillas** (si aplica): consumo vs. stock; reglas de vacuno y legumbre; tanda nueva y reposición.
- **Conservación:** nada de refri supera el límite; lo lejano va a freezer; los potes de oficina quedan a refri/freezer según el día.
- **Presupuesto:** recalcula el **total como suma real de los ítems**; verifica subtotales por sección y que el total esté bajo el tope.

## Paso 3 — Reporta
1. **Checklist** ✅/❌ por regla, con evidencia y el número real cuando aplique.
2. **"Diferencias con lo que afirma el plan":** si el plan dice que algo se cumple y NO se cumple, o el total no suma, márcalo explícitamente.
3. Si todo pasa, dilo claro. Si hay ❌, **lista qué corregir** — pero no lo corrijas tú; eso es trabajo de `planificar-semana`.
