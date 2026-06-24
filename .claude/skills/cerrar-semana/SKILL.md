---
name: cerrar-semana
description: Cierra la semana y actualiza los archivos que aprenden. Agrega la entrada de la semana a la bitácora (para no repetir las próximas semanas), propone líneas nuevas para marcas_y_productos y para platos_de_referencia cuando un producto o plato resultó. Úsala al terminar una semana planificada, o cuando el usuario diga "cerrar la semana", "actualizar la bitácora" o "registrar lo de esta semana".
---

# Cerrar la semana (mejora continua)

Cierras el ciclo actualizando los archivos que aprenden, según la sección **"Mejora continua"** de `instrucciones_agente_planificador.md`. Lee esa sección y el `bitacora.md` (su formato y la regla de ventana) antes de escribir.

## Paso 1 — Identifica la semana cerrada

Toma el plan más reciente en `planes/` (o pregúntale al usuario cuál semana cerrar si hay ambigüedad). De ahí salen las preparaciones a registrar.

## Paso 2 — Actualiza `bitacora.md` (escritura directa)

Agrega **una entrada nueva arriba del historial** con el formato definido en el archivo:

- Papilla nueva — proteína
- Papilla nueva — verduras (combinación)
- Legumbre del último día
- Preparaciones principales (por comensal)
- Combinaciones de verduras destacadas
- Notas / no repetir la próxima

Mantén la **ventana acotada** (~últimas 4 semanas): borra las entradas más antiguas que sobren.

## Paso 3 — Propón actualizaciones a los archivos de gusto/compras

- `marcas_y_productos.md` — si en la lista de compras se usó una marca/formato específico que **no estaba registrado**, agrégalo en su sección.
- `platos_de_referencia.md` — si un plato nuevo resultó y fue aceptado, agrégalo a la sección que corresponda.

Para estos dos, **muestra al usuario la línea exacta que vas a agregar y confírmala** antes de escribir (cambios de gusto, no automáticos del todo).

## Regla dura

`perfiles_dieta.md` y `pauta_nutricionista_bebe.md` **no se modifican** automáticamente (autoridad manual). Si algo sugiere cambiarlos, solo señálalo al usuario; no los edites.

## Cierre

Resume qué archivos actualizaste y deja la bitácora lista para que la próxima corrida de `/planificar-semana` no repita lo de esta semana.
