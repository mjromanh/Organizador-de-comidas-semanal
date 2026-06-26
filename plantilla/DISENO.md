# Diseño y pendientes

> Decisiones tomadas y trabajo de diseño que falta para que la versión exportable quede
> redonda. No son reglas del planificador; son notas del proyecto.

## Decidido
- **Alcance: solo Chile** (CLP, productos y tiendas chilenas). No se adapta a otros países.
- **Restricciones culturales/religiosas:** no se preguntan aparte; caen en "lo que evita /
  no come" de cada comensal.
- **Cierre de semana:** la routine cierra la semana anterior (actualiza `bitacora`) antes de
  planear la nueva, y un **doble verificador** (`verificar-semana`) revisa el plan generado.

## Pendiente

### 1. Repo propio
Publicar esta plantilla en **su propio repositorio** (hoy vive en `plantilla/` del repo del
hogar). Opcional: marcarlo como **template repository** de GitHub ("Use this template") y
agregar un `LICENSE`.

### 2. Cómo hace las preguntas (UX del onboarding) — *parte del diseño*
Revisar el **flujo conversacional** de `configurar-hogar`, no solo el contenido:
- Cuántas preguntas por vez, agrupación y orden para que no se sienta interrogatorio.
- Tono y lenguaje simple; manejo de "no sé" (ofrecer un default y marcarlo como supuesto).
- Mostrar resúmenes y pedir confirmación antes de escribir cada archivo.
- Adaptar la entrevista a lo que la persona va contando (saltar bloques que no aplican).

### 3. Cómo se instala y se automatiza — *parte del diseño*
Definir y documentar el **flujo de activación de punta a punta** para alguien nuevo:
- Cómo obtiene el repo (duplicar / "Use this template" / clonar).
- Abrir Claude Code sobre el repo → correr `/configurar-hogar` → primer `/planificar-semana`.
- Crear la **routine** semanal (ver `AUTOMATION.md`) y dejarla corriendo.
- Hacerlo lo más simple posible (idealmente pocos pasos, bien guiados).

## Ideas futuras (no urgente)
- Entrega del plan por correo/WhatsApp vía un conector (hoy queda en el repo).
- Recalibración de precios reales por ítem.
