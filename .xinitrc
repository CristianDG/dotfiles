#! /usr/bin/sh


setxkbmap -layout br ;
m-video ;
mpd .config/mpd/mpd.conf ;
fehbg ;
/usr/bin/dunst ;
nm-applet --no-agent ;
picom --config ~/.config/compton.conf -b &&
pulseaudio
