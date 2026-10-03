#!/usr/bin/env bash
# esconde e mostra os icones por ipc em vez de reiniciar a barra,
# senao o polybar pisca inteiro

STATE_FILE="/tmp/polybar_tray_state"

# os colchetes entram e saem junto dos icones
MODULES=(tray-open systray tray-close)

if [ -f "$STATE_FILE" ]; then
    for m in "${MODULES[@]}"; do
        polybar-msg action "#${m}.module_hide" 2>/dev/null
    done
    rm -f "$STATE_FILE"
else
    for m in "${MODULES[@]}"; do
        polybar-msg action "#${m}.module_show" 2>/dev/null
    done
    touch "$STATE_FILE"
fi
