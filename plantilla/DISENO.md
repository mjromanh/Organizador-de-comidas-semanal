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

### 3. Instalación lo más automática posible — objetivo: "solo contestar preguntas"
Meta: que la experiencia del usuario nuevo sea **abrir y contestar**; todo lo demás, automático alrededor de sus respuestas.

**Flujo:**
1. **Obtener el repo — 1 clic.** Publicar la plantilla como **template repository** de GitHub → "Use this template". *(Pendiente: ver punto 1.)*
2. **Abrir Claude Code sobre el repo.** *(Manual inevitable: el usuario abre la sesión.)* ✅ Pasos exactos clic por clic en `INSTALACION.md` (entrar a claude.ai/code, conectar GitHub, elegir el repo). La entrevista además pregunta si sabe conectar/crear la routine y, si no, lo guía.
3. **Arranque automático.** ✅ Implementado: un **hook SessionStart** (`.claude/settings.json` + `.claude/hooks/onboarding-check.sh`) detecta que no existe `perfiles_dieta.md` y hace que Claude **salude y empiece solo** la entrevista `configurar-hogar`. El usuario no necesita saber ningún comando.
4. **Solo contesta.** ✅ Implementado: al terminar la entrevista, `configurar-hogar` **encadena** escribir los archivos → primer plan → verificación → commit/push. El usuario no corre nada.
5. **Automatización semanal — único clic manual.** La Routine se crea en la web (no se puede desde una sesión web); se entrega el prompt listo y el enlace (`AUTOMATION.md`) para dejarla con los mínimos clics.

**Inevitablemente manual (y por qué):** abrir la primera sesión sobre el repo; crear la Routine (la plataforma solo permite crearlas desde la web/`/schedule`, no desde dentro de una sesión web). Todo lo demás queda detrás de "contestar".

## Ideas futuras (no urgente)
- Entrega del plan por correo/WhatsApp vía un conector (hoy queda en el repo).
- Recalibración de precios reales por ítem.
