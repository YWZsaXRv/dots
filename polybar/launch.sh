#!/usr/bin/env bash

pkill polybar

echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log &
disown

(
  sleep 1
  if [ ! -f /tmp/polybar_tray_state ]; then
    for m in tray-open systray tray-close; do
      polybar-msg action "#${m}.module_hide" 2>/dev/null
    done
  fi
) &
