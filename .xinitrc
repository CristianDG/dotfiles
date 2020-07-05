#! /usr/bin/sh

pulseaudio --start &&
    setxkbmap -layout br &&
    xrandr --output eDP1 --auto && 
    feh -F --bg-fill /home/cristiandg/Images/Wallpaper/default_wallpaper.jpg &&
    picom --config ~/.config/compton.conf -b
