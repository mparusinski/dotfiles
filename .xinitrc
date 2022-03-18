export GDK_SCALE=2
xrdb -merge ~/.Xresources
xset r rate 200 50
setxkbmap -option caps:super
exec xmonad
