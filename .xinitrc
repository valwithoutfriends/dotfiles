#!/bin/sh
#
# ~/xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Star compositor
picom -fb --experimental-backends --backend glx

# Start Wallpaper engine
~/.fehbg &

#Start Polybar(s)
polybar top &
polybar external &

# Start the window manager and key mapping
setxkbmap fi
sxkhd &
exec bspwm
