#! /usr/bin/sh


keyboardset &
m-video &
xsetroot -cursor_name left_ptr &
mpd .config/mpd/mpd.conf &
fehbg &
/usr/bin/dunst &
nm-applet --no-agent &
picom --config ~/.config/compton.conf -b &
pulseaudio --daemonize &
