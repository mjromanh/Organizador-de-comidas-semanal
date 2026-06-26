#!/usr/bin/env bash
# Onboarding automático del planificador de comidas.
# Si el hogar aún no está configurado (no existe perfiles_dieta.md en la raíz),
# inyecta una instrucción para que Claude inicie la entrevista solo, sin que la
# persona tenga que escribir ningún comando.

if [ ! -f "perfiles_dieta.md" ]; then
  cat <<'MSG'
[ONBOARDING — PLANIFICADOR DE COMIDAS]
Este repositorio todavía NO está configurado para ningún hogar (no existe perfiles_dieta.md en la raíz).
Acción inmediata: saluda a la persona en español, explícale en 1–2 frases qué es esto (un planificador
de comidas y compras semanal) y comienza de una vez la skill `configurar-hogar` para entrevistarla y
crear sus archivos. No le pidas que escriba comandos: tú conduces la conversación, una tanda de preguntas
a la vez. Al terminar, encadena el primer plan y deja todo commiteado (ver el cierre de la skill).
MSG
fi
