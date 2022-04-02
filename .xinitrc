# export GDK_SCALE=2
xrdb -merge ~/.Xresources
xset r rate 200 50
setxkbmap -option caps:super
feh --bg-scale pics/wallpapers/gu3eq9jjurk81.png
picom -D 0 -b
pulseaudio -D || true
exec xmonad
