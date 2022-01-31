#! /usr/bin/env sh


#echo "##Keyboard##" &&
#keyboardset &&

echo "##video##" &&
m-video &&

#echo "##cursor##" &&
#xsetroot -cursor_name left_ptr

echo "##Feh##" &&
fehbg

#echo "##mpd?##" &&
#mpd .config/mpd/mpd.conf

echo "##Notifications##" &&
/usr/bin/env dunst

#echo "##nm-applet##" &&
#nm-applet --no-agent

echo "##Picom##" &&
picom --config ~/.config/compton.conf -b

echo "##Pulseaudio kill##" &&
pulseaudio --kill
echo "##Pulseaudio daemonize##" &&
pulseaudio --daemonize
