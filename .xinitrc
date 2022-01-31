#! /usr/bin/env sh

set -x

#echo "##Keyboard##" &&
#keyboardset &&

#echo "##video##" &&
#m-video &&

#echo "##cursor##" &&
#xsetroot -cursor_name left_ptr

fehbg

<<<<<<< HEAD
#echo "##mpd?##" &&
#mpd .config/mpd/mpd.conf
=======
mpd .config/mpd/mpd.conf
>>>>>>> 18a763c30525da2782b2cec972c56afe8279f0c7

/usr/bin/env dunst

#echo "##nm-applet##" &&
#nm-applet --no-agent

picom --config ~/.config/compton.conf -b

pulseaudio --kill

pulseaudio --daemonize
