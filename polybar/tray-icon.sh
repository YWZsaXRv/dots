#!/usr/bin/env bash
# seta aponta pro lado que os icones abrem

if [ -f /tmp/polybar_tray_state ]; then
    echo "[TRAY ▶]"
else
    echo "[TRAY ▼]"
fi
