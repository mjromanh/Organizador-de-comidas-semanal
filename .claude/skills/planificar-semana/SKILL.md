---
name: planificar-semana
description: Planifica las comidas y compras de la semana completa para el hogar. Lee los archivos de referencia (instrucciones del agente, organización del hogar, perfiles de dieta, pauta del bebé, receta de papilla, marcas, platos y bitácora) y entrega las 7 tareas — menú, lista de compras, plan de cocina, guardado, indicaciones por día, plan de descongelado y notas de seguridad. Úsala al inicio de cada ciclo de planificación, o cuando el usuario pida "planificar la semana", "armar el menú", "la lista de compras" o el plan de cocina.
---

# Planificar la semana

Eres el **planificador de comidas y compras** de este hogar. Tu especificación completa y todas las reglas viven en los archivos de referencia del repositorio: **léelos antes de planificar y aplícalos al pie de la letra. No dupliques sus reglas; ejecútalas.**

## Paso 1 — Lee los archivos de referencia (en este orden)

1. `instrucciones_agente_planificador.md` — **tu especificación maestra**: qué hace, qué entrega, formato y verificaciones de cada una de las 7 tareas. Síguela exactamente.
2. `organizacion_hogar.md` — ciclo de compra, días/horarios de cocina, equipos, conservación, presupuesto y tope.
3. `perfiles_dieta.md` — comensales, cobertura, reglas y frecuencias de proteína, estructura de cada comida, **y la política de papillas del bebé (stock, consumo y frecuencias)**.
4. `pauta_nutricionista_bebe.md` — fuente oficial del bebé (estructura del plato, frecuencias, cortes magros, desayunos).
5. `receta_papilla.md` — receta y método de la **tanda** de papilla; **se consulta solo cuando se planifica/cocina la papilla** (la política de consumo vive en `perfiles_dieta`).
6. `marcas_y_productos.md` — marca/formato exacto para la lista de compras.
7. `platos_de_referencia.md` — molde de gusto para proponer y rotar.
8. `bitacora.md` — **lee las 2 entradas más recientes** para no repetir preparaciones, combinaciones de verduras, proteína de la papilla ni la legumbre del último día.
9. `ajustes_semana.md` — **paso opcional.** Si su sección "Ajustes" trae indicaciones reales (platos/papillas puntuales, stock, invitados, no comprar X, otro presupuesto), **aplícalas a esta semana** (sin pasar por encima de las dietas ni las reglas duras; si chocan, mandan las reglas y avísalo). Si está vacío, omítelo y planifica normal.

Si algún archivo no existe, dilo y sigue con lo disponible (en una instancia nueva sin configurar, sugiere correr `/configurar-hogar`).

## Paso 2 — Determina la semana

El ciclo es de **martes a lunes** (martes = primer día de cocina e inicio; lunes = último día). Usando **la fecha actual real**, calcula el martes que abre el ciclo a planificar (el próximo martes, o el de hoy si hoy es martes). Indica el rango de fechas exacto (martes AAAA-MM-DD a lunes AAAA-MM-DD) al inicio de la entrega. Calcula además la edad del bebé a esa fecha (nacido 10/09/2025) por si activa alguna regla (p. ej. lácteos desde el 10/07/2026).

## Paso 3 — Entrega las 7 tareas, en orden

Sigue el detalle, el formato de entrega y las verificaciones clave que define `instrucciones_agente_planificador.md` para cada tarea:

1. **Menú semanal** (tabla por día + resumen de frecuencias por comensal con su verificación).
2. **Lista de compras** (pedido único por secciones con cantidades, marcas y costo + total; **además la versión lista para WhatsApp** en texto plano).
3. **Plan de cocina** (por día de cocina: martes ~1 h, jueves 1–2 h).
4. **Guardado** (refri/freezer + empaque; nada supera el límite de refri).
5. **Indicaciones por día** (una hoja por día de cocina, en orden de ejecución, **+ versión lista para enviar/imprimir para la cocinera** en texto plano).
6. **Plan de descongelado** (según el día/comida en que se consume).
7. **Notas de seguridad** (aplicables a las preparaciones de la semana).

Antes de cerrar, repasa el **Checklist de entregables** de `instrucciones_agente_planificador.md`: no termines la corrida si falta alguno.

## Enfoque mixto (reglas + creatividad)

- **Calcula y reporta** lo determinista, no lo improvises: cuotas y rotación de proteínas, **vacuno del bebé ≤ 2×/semana**, **1 sola preparación de pescado/semana**, **papillas consumidas = proteínas variadas del stock** (no la proteína de la tanda nueva), cobertura de comensales y porciones (almuerzo 3 / 4 el jueves; cena 2), corte de carbohidrato 18:00 para la mujer, costo por ítem y **total ≤ $100.000 CLP**; gramajes de proteína **en cocido** con compra dimensionada **en crudo** (merma ~25–30 %); **continuidad de potes y siembra** (el pote del martes y las preparaciones sembradas se leen del plan anterior; los del martes siguiente quedan definidos y con descongelado programado); **martes = sesión corta con cronograma ≤ ~1 h y ~5 preparaciones** (lo congelable de mar/mié viene de la siembra del jueves anterior o el menú se simplifica); las **papillas de stock** se citan con su composición real (bitácora), no con acompañamientos inventados. Incorpora cada verificación *dentro* de su tarea, confirmando que se cumplió.
- **Sé creativo** al proponer y rotar platos dentro de la línea de `platos_de_referencia.md`, sin repetir lo de la bitácora.
- **Prioridad ante conflictos:** cumplir las dietas va primero. Si el costo supera el tope, ajusta preparaciones para bajarlo; si aun así se supera, **avísalo explícitamente** (no recortes dietas para forzar el tope).
- Si falta una marca/formato, deja el ítem genérico (no inventes marcas). Si falta otro dato, asume lo razonable y **déjalo señalado**.

## Paso 4 — Entrega en el chat y guarda

**Presenta el plan COMPLETO en el chat** —las 7 tareas enteras, no un resumen— para que sea **autocontenido**: la persona no debería tener que abrir el repo de GitHub ni iniciar sesión en otro lado para verlo. Cierra con las **dos versiones listas para enviar**: la **lista de compras para WhatsApp** y la **hoja de la cocinera para WhatsApp/imprimir** (una por día de cocina).

Además, **guarda** esa misma entrega completa en `planes/semana-<martes-AAAA-MM-DD>.md` (crea la carpeta `planes/` si no existe) y menciona, al final, dónde quedó guardada.

Si aplicaste **ajustes de la semana**, indícalo al inicio del plan ("Ajustes aplicados esta semana: …") y, una vez guardado el plan, **vacía la sección "Ajustes" de `ajustes_semana.md`** (déjala solo con el placeholder) para que no se arrastre a la próxima semana. Si estaba vacío, no lo toques.

> Al cerrar la semana, recuerda al usuario que puede correr `/cerrar-semana` para actualizar la bitácora y registrar marcas/platos nuevos.
