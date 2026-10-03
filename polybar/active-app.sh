#!/usr/bin/env bash
# polybar mostra o app, nao a janela. dentro do terminal o nome util
# esta no processo filho, entao dois niveis de shell sao atravessados

active_win=$(xprop -root _NET_ACTIVE_WINDOW 2>/dev/null | grep -o '0x[0-9a-f]*' | head -1)

if [ -z "$active_win" ]; then
    echo "desktop"
    exit 0
fi

win_pid=$(xprop -id "$active_win" _NET_WM_PID 2>/dev/null | grep -o '[0-9]*$')

if [ -z "$win_pid" ]; then
    echo "desktop"
    exit 0
fi

app_name=$(ps -p "$win_pid" -o comm= 2>/dev/null)

# terminal sozinho nao diz nada, o filho diz
case "$app_name" in
    alacritty|kitty|xterm|urxvt|st|gnome-terminal|xfce4-terminal|terminator)
        child_pid=$(pgrep -P "$win_pid" -n 2>/dev/null | head -1)
        if [ -n "$child_pid" ]; then
            child_name=$(ps -p "$child_pid" -o comm= 2>/dev/null)
            case "$child_name" in
                bash|zsh|fish)
                    # shell puro nao serve, tenta o neto
                    grandchild_pid=$(pgrep -P "$child_pid" -n 2>/dev/null | head -1)
                    if [ -n "$grandchild_pid" ]; then
                        grandchild_name=$(ps -p "$grandchild_pid" -o comm= 2>/dev/null)
                        [ -n "$grandchild_name" ] && app_name="$grandchild_name"
                    fi
                    ;;
                *)
                    app_name="$child_name"
                    ;;
            esac
        fi
        ;;
esac

echo "$app_name" | sed 's/.*/\u&/'
