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
de comidas y compras semanal) y ejecuta el runbook de instalación (la Parte B de instalacion.md): corre
la skill `configurar-hogar` de principio a fin, una tanda de preguntas a la vez, y al terminar encadena
el primer plan + verificación + commit y guía la creación de la Routine. No le pidas comandos: tú conduces.
MSG
fi
