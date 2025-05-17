## setxkbmap -layout jp
source $HOME/ghasshee/dotfiles/.env.zsh
source $HOME/ghasshee/dotfiles/.function.zsh
is_ubuntu || source $DOT/.Xmodmap
is_ubuntu && xmodmap $DOT/.Xmodmap
#export QT_IM_MODULE=fcitx
#export QT_IM_MODULE="ibus"
#export GTK_IM_MODULE="ibus"
#export XMODIFIERS="@im=ibus"
xbacklight -set 30
xset x off -dpms

is_ubuntu || { 
    xbacklight -set 30
    xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" -50,  -20
}
#redshift 
#xcalib -a -blue 2 0 70 -green 1 0 95
#exec startxfce4

