#!/usr/bin/env bash
# seletor de wallpaper
# baseado no script do Justus0405 (MIT)
# https://github.com/Justus0405/i3wm-dotfiles/blob/main/src/config/i3/scripts/wallpaper-picker.sh

wallpaperDirectory="${HOME}/.config/wallpapers"

# o rofi empilha os itens, entao o preview precisa caber na altura.
# reserva a polybar e as bordas, e divide o que sobrou em 3 linhas
screen=$(xrandr --current | grep -oP 'connected primary \K[0-9]+x[0-9]+')
screen_height=${screen#*x}

lines=3
thumb_size=$(( (screen_height - 160) / lines ))
((thumb_size > 220)) && thumb_size=220
((thumb_size < 100)) && thumb_size=100

mapfile -d '' files < <(find "${wallpaperDirectory}" -type f -print0)

chosen_index=$(
    for file in "${files[@]}"; do
        printf '%s\0icon\x1f%s\n' "$(basename "${file}")" "${file}"
    done | rofi -dmenu -i -show-icons -format 'i' \
            -p " Wallpapers " \
            -theme-str "
                window { width: ${thumb_size}px; }
                element { orientation: vertical; padding: 4px; }
                element-icon { size: ${thumb_size}px; padding: 0; }
                element-text { text-align: center; }
                listview { lines: ${lines}; }
            "
)

[ -z "${chosen_index}" ] && exit 0

feh --bg-fill "${files[${chosen_index}]}"
