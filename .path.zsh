
################
###   PATH   ###
################


PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
PATH=$PATH:"$HOME/.local/bin"
#PATH=$PATH:"/usr/texbin"
PATH=$PATH:"$HOME/.bin"

PATH="/run/current-system/sw/bin":$PATH
PATH="/run/wrappers/bin":$PATH

set -- `uname -a`
[[ $1 == 'Linux' ]] && {
    MANPATH=""
    [[ $2 == 'nixos' ]] || PATH=$PATH:"/usr/bin/core_perl"
}

export PATH


#################
###    MAN    ###
#################

MANPATH=$MANPATH:/usr/local/man
MANPATH=$MANPATH:/run/current-system/sw/share/man
MANPATH=$MANPATH:/run/current-system/sw/sbin/man
MANPATH=$MANPATH:/run/current-system/sw/bin/man
#for i in $(echo /nix/store/*/share/man);
#do     MANPATH=$MANPATH:$i;    done
export MANPATH


#################
###  LIBRARY  ###
#################

export LIBRARY_PATH="/usr/local/lib"
export C_INCLUDE_PATH="/opt/X11/include"

