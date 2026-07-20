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
9. `ajustes_semana.md` — **paso opcional.** Si su sección "Ajustes" trae indicaciones reales (platos puntuales, stock, invitados, no comprar X, otro presupuesto), **aplícalas a esta semana** (sin pasar por encima de las dietas ni las reglas duras; si chocan, mandan las reglas y avísalo). Si está vacío, omítelo y planifica normal.

Si algún archivo no existe, dilo y sigue con lo disponible (en una instancia nueva sin configurar, sugiere correr `/configurar-hogar`).

## Paso 2 — Determina la semana

El **ciclo** (día de inicio/fin y días de cocina) está definido en `organizacion_hogar`. Usando **la fecha actual real**, calcula el día que abre el próximo ciclo a planificar e indica el **rango de fechas exacto** (AAAA-MM-DD a AAAA-MM-DD) al inicio de la entrega. Si `perfiles_dieta` define reglas que dependen de la **edad** de un comensal (p. ej. un bebé con hitos por mes), calcula su edad a esa fecha por si se activa alguna regla.

**Resguardo anti-desfase de la bitácora:** antes de planificar, verifica que el **plan más reciente en `planes/`** (el ciclo que acaba de terminar) **ya tenga su entrada en `bitacora.md`**. Si NO la tiene (se planificó sin cerrar), **corre primero `/cerrar-semana`** para registrarla; así el ciclo nuevo no repite lo del anterior. En corrida autónoma (Routine) esto ya es un paso previo, pero repítelo aquí como red de seguridad para las corridas manuales.

## Paso 3 — Entrega las 7 tareas, en orden

Sigue el detalle, el formato de entrega y las verificaciones clave que define `instrucciones_agente_planificador.md` para cada tarea:

1. **Menú semanal** (tabla por día + resumen de frecuencias por comensal con su verificación).
2. **Lista de compras** (pedido único por secciones con cantidades, marcas y costo + total; **además la versión lista para WhatsApp** en texto plano).
3. **Plan de cocina** (por día de cocina, dentro del tiempo de cada sesión según `organizacion_hogar`).
4. **Guardado** (refri/freezer + empaque; nada supera el límite de refri).
5. **Indicaciones por día** (una hoja por día de cocina, en orden de ejecución, **+ versión lista para enviar/imprimir para quien cocina** en texto plano).
6. **Plan de descongelado** (según el día/comida en que se consume).
7. **Notas de seguridad** (aplicables a las preparaciones de la semana).

Antes de cerrar, repasa el **Checklist de entregables** de `instrucciones_agente_planificador.md`: no termines la corrida si falta alguno.

## Enfoque mixto (reglas + creatividad)

- **Calcula y reporta** lo determinista, no lo improvises: cuotas y rotación de proteínas **y de acompañamientos/carbohidratos**, **topes y reglas duras de cada comensal** (según `perfiles_dieta`, p. ej. límites de una proteína, cortes horarios, mínimos), **cobertura y porciones por headcount** de cada comida (adicionales con porción normal), y **costo por ítem con total bajo el tope** de `organizacion_hogar`. Si el hogar maneja papillas/stock, respeta su política (consumo vs. tanda nueva) y cita su **composición real**. **Distingue crudo vs. cocido** (compra en crudo dimensionada a la necesidad cocida, merma ~25–30 %); cuida la **continuidad** (lee del plan anterior lo heredado —potes/siembra— y define lo que dejas para la semana siguiente, con su descongelado); y respeta la **carga de cada sesión de cocina** (cronograma en minutos; la sesión más corta no se sobrecarga). Incorpora cada verificación *dentro* de su tarea, confirmando que se cumplió.
- **Sé creativo** al proponer y rotar platos dentro de la línea de `platos_de_referencia.md`, sin repetir lo de la bitácora.
- **Prioridad ante conflictos:** cumplir las dietas va primero. Si el costo supera el tope, ajusta preparaciones para bajarlo; si aun así se supera, **avísalo explícitamente** (no recortes dietas para forzar el tope).
- Si falta una marca/formato, deja el ítem genérico (no inventes marcas). Si falta otro dato, asume lo razonable y **déjalo señalado**.

## Paso 4 — Entrega en el chat y guarda

**Presenta el plan COMPLETO en el chat** —las 7 tareas enteras, no un resumen— para que sea **autocontenido**: la persona no debería tener que abrir el repo de GitHub ni iniciar sesión en otro lado para verlo. Cierra con las **dos versiones listas para enviar**: la **lista de compras para WhatsApp** y la **hoja de quien cocina para WhatsApp/imprimir** (una por día de cocina).

Además, **guarda** esa misma entrega completa en `planes/semana-<AAAA-MM-DD>.md` (la fecha es el día que abre el ciclo; crea la carpeta `planes/` si no existe) y menciona, al final, dónde quedó guardada.

Si aplicaste **ajustes de la semana**, indícalo al inicio del plan ("Ajustes aplicados esta semana: …") y, una vez guardado el plan, **vacía la sección "Ajustes" de `ajustes_semana.md`** (déjala solo con el placeholder) para que no se arrastre. Si estaba vacío, no lo toques.

> Al cerrar la semana, recuerda al usuario que puede correr `/cerrar-semana` para actualizar la bitácora y registrar marcas/platos nuevos.
