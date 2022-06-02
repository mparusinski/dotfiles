# export GDK_SCALE=2
xrdb -merge ~/.Xresources
xset r rate 200 50
setxkbmap -option caps:super
setxkbmap -option compose:ralt
feh --bg-scale gu3eq9jjurk81.png
picom -D 0 -b
exec xmonad
