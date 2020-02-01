## setxkbmap -layout jp
source $HOME/.Xmodmap
export QT_IM_MODULE=fcitx
xbacklight -set 13
xcalib -a -blue 2 0 40 -green 1 0 65
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" -50,  -20
exec startxfce4

