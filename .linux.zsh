# VARIABLES
FILE_MANAGER='Thunar'
export VISUAL='vim'
export BROWSER="chromium"

# ESPEAK 
espeak-paplay (){ espeak --stdout $@ | paplay }
alias speak='espeak-paplay'

# FFPLAY
#alias ffplay='ffplay2.8'
alias playm4a='for i in $(echo *.m4a ); do ffplay -af volume=0.5 -nodisp -autoexit $i; done'
alias playmp4='for i in $(echo *.mp4 ); do ffplay -af volume=0.5 -fs     -autoexit $i; done'
alias playall='for i in $(echo *     ); do ffplay -af volume=1.0 -nodisp -autoexit $i; done'

# TIMIDITY
alias timi='timidity -iA Os'

# COPY PASTE
alias pbpaste='xsel -bo'
alias pbcopy='xsel -bi'
# alias rename='perl-rename'

# XCALIB 
alias redshift='    xcalib -a -blue 2 0 60 -green 1 0 80'
alias convert='     xcalib -i -a'
alias clear_color=' xcalib -c'
alias red='         xcalib -a -blue 1 10 50 -green 1 10 70'

# MOUSE
alias mouse='bluetoothmouse'

# Open 
alias open=$FILE_MANAGER

# ibus 
export XIM=ibus
export XIM_PROGRAM=/usr/bin/ibus-daemon
export XIM_ARGS="--xim"
export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export QT_IM_MODUEL="ibus"
ibus-daemon -d -x

# get IP 
export BROADCAST_INTERFACE=$(ip addr | grep BROADCAST | awk '{print $2}' | sed 's/://')
export LOCAL_IP=$(ip addr | grep inet | grep $BROADCAST_INTERFACE | awk '{print $2}' | sed 's/...$//')

# DJVU
#alias djvu2pdf='ddjvu --format=pdf'


# shutdown 
alias shutdown='sudo umount $MOUNT; sudo shutdown -h now' 
alias reboot='sudo umount $MOUNT; sudo reboot' 
alias shut='shutdown'
alias hiber='sudo systemctl hibernate'
