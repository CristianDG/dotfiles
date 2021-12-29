#! /usr/bin/env sh

set -x

#echo "##Keyboard##" &&
#keyboardset &&

#echo "##video##" &&
#m-video &&

#echo "##cursor##" &&
#xsetroot -cursor_name left_ptr

fehbg

mpd .config/mpd/mpd.conf

/usr/bin/env dunst

#echo "##nm-applet##" &&
#nm-applet --no-agent

picom --config ~/.config/compton.conf -b

pulseaudio --kill

pulseaudio --daemonize
