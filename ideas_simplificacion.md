# IDEAS DE SIMPLIFICACIÓN (pendientes de decidir)

> Backlog de ideas para reducir tokens/complejidad en futuras corridas de `planificar-semana` y
> `verificar-semana`. Ninguna de estas está aplicada todavía — son propuestas a evaluar y, si se
> aprueban, se implementan editando los archivos de referencia correspondientes.

## Ya aplicadas (para referencia, no repetir)

- El desayuno no se planifica en el menú ni en la lista de compras (`perfiles_dieta.md`).
- La fruta del bebé no se planifica en el menú ni en la lista de compras (`perfiles_dieta.md`).
- La cena del viernes se suma a sábado/domingo como "salen o piden" — no se cocina ni se planifica
  para los adultos (`perfiles_dieta.md`).
- Una sola proteína por sesión de cocina para el comensal con swap de carne (`instrucciones_agente_planificador.md`).
- Rotación de acompañamientos/carbohidratos, no solo de proteínas (`instrucciones_agente_planificador.md`).

## Pendientes de evaluar

1. **Receta base de sopa fija** — la sopa de verduras se repite casi todas las semanas con la misma
   lógica (cebolla + zanahoria + zapallo + verdura verde). Fijarla como plantilla en
   `platos_de_referencia.md` con cantidades estándar, y que el plan solo la referencie ("sopa base,
   ver `platos_de_referencia`") en vez de redactar la receta completa cada semana.

2. **Tabla fija de mermas crudo↔cocido** — hoy cada semana se explica en prosa cuánto crudo equivale
   a cuánto cocido por proteína. Una tabla de conversión por tipo de proteína en `organizacion_hogar.md`
   (ej. vacuno/pollo/pavo ~30% de merma, pescado ~15%) evitaría repetir el razonamiento; el plan solo
   aplicaría el número de la tabla.

3. **Condimentos/despensa como "nunca se compran"** — aceite, sal, ajo, especias, orégano, etc. hoy a
   veces se listan o se razona si van. Declararlo una vez en `marcas_y_productos.md` como "stock
   permanente, no incluir en la lista de compras" evita que el modelo lo decida cada semana.

4. **Reporte del verificador más compacto** — hoy `verificar-semana` detalla evidencia de cada regla,
   incluso las que pasan sin drama. Podría reportar solo un check corto por regla que pasa, y evidencia
   extensa solo para lo que falla (❌) o es limítrofe (presupuesto ajustado, tiempos de sesión al límite).

5. **"Semana tipo" en la bitácora** — guardar una plantilla de estructura recurrente (qué tipo de comida
   va en qué día/sesión) para que el modelo solo tenga que variar proteína/verduras/carbohidrato en vez
   de re-derivar toda la estructura semanal desde cero cada vez.

## Cómo retomar esto

Cuando se quiera avanzar, revisar esta lista con el usuario, decidir cuáles aplicar, y editar los
archivos de referencia que correspondan (mismo patrón que las ideas ya aplicadas arriba). Borrar de
esta lista lo que se vaya aplicando y anotarlo en la sección "Ya aplicadas".
