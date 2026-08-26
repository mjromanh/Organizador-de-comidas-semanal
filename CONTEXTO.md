# CONTEXTO DEL PROYECTO (handoff para otro chat)

> Documento para que una sesión nueva de Claude retome sin releer todo el historial.
> El README.md es la portada de usuario; **este archivo es el traspaso técnico/estado**.

## Qué es
Planificador de comidas y compras semanales que **vive dentro de Claude Code**, para un
hogar chileno (2 adultos + bebé, con almuerzos de oficina). Entrega 7 partes: menú, lista de
compras, plan de cocina, guardado, indicaciones por día, descongelado y notas de seguridad.
Corre **solo cada semana** vía una **Routine**. Además hay una **versión exportable genérica**
(`template/`) para que otras personas lo activen.

## Cómo se trabaja
- **Skills** (en `.claude/skills/`): `/planificar-semana`, `/verificar-semana`, `/cerrar-semana`.
  Son la **lógica genérica**; leen los archivos de referencia y ejecutan `instrucciones_agente_planificador.md` (spec maestra).
- **Datos del hogar** (se editan a mano cuando cambia una regla): `organizacion_hogar.md`,
  `perfiles_dieta.md`, `pauta_nutricionista_bebe.md`, `receta_papilla.md`, `marcas_y_productos.md`,
  `platos_de_referencia.md`, `bitacora.md`.
- **`ajustes_semana.md`** = pedido opcional para la semana siguiente (un plato, stock, invitados,
  no comprar X). Si tiene contenido bajo `## Ajustes`, `planificar-semana` lo aplica y **lo vacía solo**
  después. Vacío = se planifica normal. **Actualmente está vacío.**
- **`planes/`** = salidas (`semana-AAAA-MM-DD.md`). Ya hay varias semanas generadas por la Routine.

## Git / convenciones (IMPORTANTE)
- Rama de trabajo = **`claude/magical-franklin-136dag`**, que es **la rama por defecto del repo**
  (no hay `main` separado). Todo se commitea y pushea ahí. `git push -u origin claude/magical-franklin-136dag`.
- **No** crear pull requests salvo que se pida explícitamente.
- El remoto suele recibir pushes de la Routine en paralelo → si el push es rechazado, `git pull --rebase` y reintentar.
- No poner el id del modelo en commits. Mensajes de commit cierran con las líneas Co-Authored-By / Claude-Session del entorno.

## Arquitectura y decisiones clave (viven en los archivos, NO duplicar)
- **Skill genérico + datos del hogar separados.** Nunca hardcodear datos del hogar en las skills ni en la plantilla.
- **Papillas del bebé = modelo cuotas + reglas** (en `perfiles_dieta` → "Papillas — política"): cuotas semanales
  vacuno 2 · pollo/pavo 5 (1 BLW + 4 papilla) · legumbre 3 · pescado 2 · huevo 2. Papillas reales de carne = 6/semana
  → **tanda = 6 porciones** (`receta_papilla`). El planificador arma el día a día variando; no es una semana congelada.
- **Desayuno y fruta del bebé = FUERA del plan** (decisión del hogar): no se escriben en el menú ni en la lista;
  el hogar los maneja aparte (ver nota en `perfiles_dieta` cobertura). El planificador cubre **solo almuerzos y cenas**.
  *(En la plantilla genérica esto es configurable por hogar, no forzado.)*
- **Entregables blindados:** `instrucciones_agente_planificador.md` tiene un **"Checklist de entregables"** (7 partes)
  + versiones **listas para enviar**: lista de compras para WhatsApp y **hoja de la cocinera** por día de cocina.
- **Reglas transversales** clave (en la spec y en `verificar-semana`): rotación de proteínas Y carbohidratos;
  crudo vs. cocido (compra en crudo, dieta en cocido, merma ~25–30 %); continuidad del pote de oficina entre semanas (sin siembra; el martes cocina fresco);
  1 sola proteína por sesión para el comensal con swap; composición real de papillas de stock; cronograma en minutos por sesión.
- `perfiles_dieta` y `pauta_nutricionista_bebe` = **autoridad manual**; `cerrar-semana` no los toca.

## Automatización (Routine) — YA FUNCIONA
- Prompt canónico en **`AUTOMATION.md`** (pégalo en `claude.ai/code/routines`). Pasos: git checkout de la rama →
  `cerrar-semana` (paso 2, automático) → leer/aplicar/vaciar `ajustes_semana` → `planificar-semana` →
  `verificar-semana` (si ❌, corrige y re-verifica) → commit+push → mostrar plan completo + WhatsApp + hoja de cocinera.
- Identidad de la Routine en los commits: autor **`meal-planner-agent`**. Ya generó varias semanas y limpió `ajustes_semana`.
- Si se editara el nombre de la rama a `main`, hay que actualizar el `git checkout` del prompt (ver AUTOMATION.md).

## Versión exportable (`template/`)
- Bundle genérico completo (spec, 4 skills incl. `configurar-hogar`, `plantillas/` en blanco, `ajustes_semana.md`,
  AUTOMATION/INSTALACION/README/DISENO, hook de onboarding). **Ya está sincronizado con todas las mejoras del principal**,
  en versión genérica (sin datos de este hogar; desayuno/fruta configurables; "quien cocina"; ciclo desde `organizacion_hogar`;
  regla actual **sin "siembra"** — cada sesión cocina fresco para los días que abastece).
- Instalación pensada para: "Use this template" en GitHub → abrir en Claude Code → escribir «ejecuta instalacion.md»
  → `configurar-hogar` entrevista y genera los archivos → primer plan → Routine.

## Pendientes / en curso
1. **Publicar `template/` como su propio repo** (paso manual del usuario; `template/` hoy es subcarpeta de este repo).
2. **Probar la plantilla con un hogar nuevo** (test): crear repo nuevo, copiar el **contenido** de `template/` a la raíz
   —incluida la carpeta oculta `.claude`— y correr «ejecuta instalacion.md» con un hogar distinto (ideal sin bebé, otros
   días de cocina, otro tope) para cazar fugas. En un intento, los archivos se subieron **sueltos sin carpetas**; la forma
   robusta de ordenarlos en esa sesión es `git clone -b claude/magical-franklin-136dag <repo-fuente>` y `cp -r fuente/template/. .`.
3. **Confirmar que la Routine agendada** tenga el prompt actual de `AUTOMATION.md` (no se puede leer su config desde el repo).

## Reglas de oro (no hacer)
- No crear PRs sin pedirlo. No pushear a otra rama sin permiso.
- No meter datos de este hogar en las skills ni en `template/`.
- No editar `pauta_nutricionista_bebe`/`perfiles_dieta` automáticamente al cerrar semana.
- No re-introducir desayuno/fruta al plan de **este** hogar (fue una decisión explícita de sacarlos).
