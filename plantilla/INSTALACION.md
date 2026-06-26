# Instalación desde cero (paso a paso)

> Para activar tu planificador necesitas dos cuentas: **Claude** (plan Pro, Max o Team, con
> Claude Code en la web) y **GitHub** (gratis). Si ya las tienes, son ~5 minutos.

## Paso 1 — Consigue tu copia del repositorio (1 clic)

1. Abre la página de esta plantilla en GitHub.
2. Haz clic en el botón verde **Use this template → Create a new repository**.
   *(Si no aparece ese botón, usa **Fork**.)*
3. Ponle un nombre (ej. `mis-comidas`), déjalo **privado** y crea el repo. Ya tienes tu copia.

## Paso 2 — Abre tu repo en Claude Code

1. Entra a **https://claude.ai/code**.
2. La **primera vez** te pedirá **conectar tu cuenta de GitHub**: haz clic en conectar/autorizar
   y dale acceso al repo que creaste (puedes limitar el acceso solo a ese repo).
3. **Elige tu repo** (`mis-comidas`) e inicia una **nueva sesión / tarea** sobre él.

> ¿No sabes conectar GitHub o no te aparece el repo? En claude.ai/code busca **"Connect GitHub"**
> / **"Add repository"** y sigue el asistente; tienes que **autorizar la app de Claude** sobre tu
> cuenta y marcar el repo. Si te quedas pegado, escríbele a Claude en la sesión: *"ayúdame a
> conectar mi repo de GitHub"*.

## Paso 3 — Contesta las preguntas

En cuanto se abre la sesión, **Claude te saluda y empieza a preguntarte solo** (comensales,
dietas, días de cocina, presupuesto, gustos…). **Solo contesta.** Al terminar, Claude crea tus
archivos, arma tu **primer plan** y lo guarda — sin que escribas comandos.

## Paso 4 — Déjalo automático cada semana (la Routine)

Es corto y se hace **una sola vez**. Hay que hacerlo a mano porque la programación se crea desde
la web. Pasos exactos en **`AUTOMATION.md`**, en resumen:

1. Entra a **https://claude.ai/code/routines** → **New routine**.
2. Nombre: `Plan de comidas semanal`.
3. **Pega el prompt** que está en `AUTOMATION.md`.
4. Repositorio: tu repo. Trigger: **Weekly**, el día y hora que prefieras.
5. **Create** (y **Run now** para probar).

Listo: cada semana el plan se genera solo y queda en `planes/` de tu repo.
