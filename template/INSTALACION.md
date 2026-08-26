# Instalación

> **Para activar tu planificador, dentro de Claude Code dile:** «**ejecuta instalacion.md**».
> Eso corre todo solo: te entrevista, crea tus archivos, arma tu primer plan y te deja lista la
> automatización. **Tú solo contestas.**
>
> Abajo: **Parte A** = lo que haces tú para llegar a Claude; **Parte B** = lo que Claude ejecuta.

## Parte A — Antes de empezar (lo haces tú, una vez)

Necesitas una cuenta de **Claude** (plan Pro, Max o Team con Claude Code en la web) y una de
**GitHub** (gratis).

1. **Consigue tu copia del repo:** en GitHub, botón **Use this template → Create a new
   repository** (si no aparece, usa **Fork**). Ponle nombre (ej. `mis-comidas`), déjalo privado.
2. **Ábrelo en Claude Code:** entra a **https://claude.ai/code**, **conecta tu GitHub** (autoriza
   el acceso a ese repo), **elige tu repo** e inicia una **nueva sesión**.
   - ¿No sabes conectar GitHub? En claude.ai/code busca **"Connect GitHub" / "Add repository"** y
     autoriza la app de Claude sobre tu repo. Si te pegas, escríbele a Claude en la sesión:
     *"ayúdame a conectar mi repo de GitHub"*.
3. **Dile a Claude:** «**ejecuta instalacion.md**». *(Si no escribes nada, Claude igual te saluda
   y arranca solo.)*

## Parte B — Lo que Claude ejecuta (tú solo contestas)

**Para Claude:** cuando el usuario pida "ejecuta instalacion.md" (o abra un repo sin configurar),
haz esto de corrido, conduciendo tú la conversación:

1. **Entrevista:** corre la skill **`configurar-hogar`** de principio a fin — pregunta por el
   hogar (una tanda de preguntas a la vez) y, con las respuestas, escribe los archivos de
   referencia en la raíz del repo.
2. **Encadena (lo hace `configurar-hogar` en su cierre):** **primer plan** con
   `planificar-semana` → **doble chequeo** con `verificar-semana` → **commit y push**. Presenta el
   **plan completo en el chat** (autocontenido).
3. **Automatización:** guía al usuario, clic por clic, para crear la **Routine** semanal con los
   pasos de `AUTOMATION.md` (entrar a `claude.ai/code/routines` → **New routine** → pegar el
   prompt → **Weekly** + día/hora → **Create**). Sugiérele **Run now** para probar y dile que el
   resultado queda como una **sesión en la misma página de la routine** (sin abrir GitHub).

Al terminar, el hogar queda configurado, con su primer plan, y el plan automático corriendo cada
semana.
