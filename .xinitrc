## setxkbmap -layout jp
source $HOME/.Xmodmap
#export QT_IM_MODULE=fcitx
export QT_IM_MODULE="ibus"
export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
xbacklight -set 30
xcalib -a -blue 2 0 55 -green 1 0 75
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" -50,  -20
#exec startxfce4

