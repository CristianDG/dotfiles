#! /bin/bash

while true; do
    xsetroot -name "$( date +"%F %R" )"
    sleep 1s    # Update time every minute
done &

feh -F --bg-fill /home/cristiandg/Imagens/Wallpaper/default_wallpaper.jpg
dwm
