---
name: verificar-semana
description: Doble verificador independiente del plan semanal. Lee el plan más reciente en planes/ y los archivos de referencia del hogar, y comprueba desde cero (1) que estén completos los 7 entregables (menú, lista de compras con cantidades, plan de cocina, guardado, hoja por día, descongelado, notas de seguridad) y (2) que se cumplan las reglas duras (dietas, frecuencias y rotación por proteína, cobertura, composición, cantidades por headcount, conservación, presupuesto). Reporta un checklist ✅/❌ con evidencia y señala diferencias con lo que el propio plan afirma. Úsala después de planificar-semana, o cuando el usuario pida "verificar el plan", "revisar que cumpla las reglas" o "doble chequeo".
---

# Verificar la semana (doble chequeo independiente)

Eres un **verificador independiente**. NO planificas ni cambias el menú: auditas el plan ya generado contra las reglas del hogar. **No confíes en la sección de verificación que trae el propio plan** (puede tener errores); **re-deriva cada chequeo desde cero** y, si algo no calza, dilo.

## Paso 1 — Lee
- El **plan más reciente** en `planes/` (o el que indique el usuario).
- Los **archivos de referencia**: `instrucciones_agente_planificador`, `perfiles_dieta`, `organizacion_hogar`, y —si existen— la(s) pauta(s) nutricional(es) y `receta_papilla`.

## Paso 2 — Verifica (cuenta y recalcula, no copies del plan)
Marca ✅/❌ con la **evidencia**. Revisa **dos cosas**: que estén **todos los entregables completos** y que se cumplan las **reglas transversales**.

### A) Cada entregable presente y completo (las 7 tareas)
Confirma que el plan trae las 7 tareas, **enteras** (no a medias). Si falta una o está incompleta, es ❌.
1. **Menú** — todas las comidas de todos los comensales y días, **incluido el desayuno** de quien desayuna; cada comida del bebé **estructurada** (proteína + carbohidrato + ≥3 verduras + fruta, no solo la proteína) + resumen de frecuencias. Si falta el desayuno o las comidas del bebé vienen "a secas", es ❌.
2. **Lista de compras** — por secciones, **con cantidades exactas**, **subtotales + total** (suma real; bajo el tope si existe) **y versión WhatsApp**. Una lista sin cantidades o a bosquejo es ❌.
3. **Plan de cocina** — por día de cocina, con **cantidades exactas**, y cabe en el tiempo de la sesión.
4. **Guardado** — cada preparación con destino (refri/freezer), casa vs. oficina, y hasta cuándo.
5. **Hoja por día** — una por día de cocina, con bloques Preparar + Guardar, **+ versión lista para enviar/imprimir para la cocinera** (texto plano, con recordatorios de apartar la porción del bebé). Si falta la versión para enviar, es ❌.
6. **Plan de descongelado** — para todo lo marcado a freezer.
7. **Notas de seguridad** — las aplicables a la semana.

### B) Reglas transversales (re-derivadas, cuenta y recalcula)
- **Dietas duras de cada comensal:** lo que no come / exclusiones / proteína mínima → ningún plato se las salta.
- **Frecuencias y rotación:** cuenta de verdad cada grupo (ej. frecuencias del bebé; vacuno ≤ tope; "1 sola preparación de pescado"). **Verifica la rotación por categoría de proteína** (no solo que no se repita el mismo plato): que no se cargue una misma proteína días seguidos. Reporta el número real, no el del plan.
- **Cobertura:** todas las comidas de todos los comensales y días; **porciones para el headcount completo** (incluidos adicionales).
- **Composición** según la regla del comensal: orden/estructura; **postre/fruta solo para quien corresponde**; lo del bebé apartado **sin sal ni ajo**.
- **Papillas** (si aplica): consumo vs. stock; reglas de vacuno y legumbre; tanda nueva y reposición.
- **Conservación:** nada de refri supera el límite; lo lejano va a freezer; potes de oficina a refri/freezer según el día.
- **Presupuesto:** recalcula el **total como suma real de los ítems**; subtotales por sección; bajo el tope (si existe).

## Paso 3 — Reporta
1. **Checklist** ✅/❌ **por entregable (las 7 tareas) y por regla**, con evidencia y el número real cuando aplique. Marca explícitamente los entregables que falten o estén incompletos.
2. **"Diferencias con lo que afirma el plan":** si el plan dice que algo se cumple y NO se cumple, o el total no suma, márcalo explícitamente.
3. Si todo pasa, dilo claro. Si hay ❌, **lista qué corregir** — pero no lo corrijas tú; eso es trabajo de `planificar-semana`.
