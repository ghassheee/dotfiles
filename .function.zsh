## To move directories in terminal,
## The command must be built-in


is_ubuntu () { 
    [[ `cat /etc/issue | head -1 | tail -1 | cut -d " " -f 1` == "Ubuntu" ]] 
}

is_linux () { 
    [[ `uname` == 'Linux'  ]] 
}

is_macos () { 
    [[ `uname` == 'Darwin' ]] 
} 

loop () {
    while true;
    do 
        $@;
        sleep 1;
    done
}


# music () {
#     set +u
#     if   [[ -z $1 ]] ; then 
#         [[ -z $MUSIC ]] || cd $MUSIC;
#     elif [[ "$1" == "list" ]] ; then
#         ls $MUSIC;
#     else 
#         $HOME/.bin/music $@
#     fi
#     set -u
# }
# 


dot () {
    set +u
    if [[ -z $1 ]] ; then cd $DOT;
    else
        $DOT/dot $@;
    fi
    set -u 
}

nix(){
    set +u 
    if [[ -z $1 ]] ; then 
        cd $NIX; $NIX/nix help;
    else
        $NIX/nix $@;
    fi
    set -u 
}

#################
###  CD BACK  ###
#################

# do ". acd_func.sh"
# acd_func 1.0.5, 10-nov-2004
# petar marinov, http:/geocities.com/h2428

cd_func ()
{
    set +u
    local x2 the_new_dir adir index
    local -i cnt

    if [[ $1 ==  "--" ]]; 
        then dirs -v ; return 0
    fi

    the_new_dir=$1
    [[ -z $1 ]] && the_new_dir=$HOME

    if [[ ${the_new_dir:0:1} == '-' ]]; then
        # Extract dir N from dirs
        index=${the_new_dir:1}
        [[ -z $index ]] && index=1
        adir=$(dirs +$index)
        if [[ -z "$adir" ]]; then
            cd ~${index}  ;return 0
        fi
        the_new_dir=$adir
    fi

    # '~' has to be substituted by ${HOME}
    [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

    # Now change to the new dir and add to the top of the stack
    pushd "${the_new_dir}" > /dev/null
    [[ $? -ne 0 ]] && return 1
    the_new_dir=$(pwd)

    # Trim down everything beyond 11th entry
    popd -n +11 2>/dev/null 1>/dev/null

    # Remove any other occurence of this dir, skipping the top of the stack
    for ((cnt=1; cnt <= 10; cnt++)); do
        x2=$(dirs +${cnt} 2>/dev/null)
        [[ $? -ne 0 ]] && return 0
        [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
        if [[ "${x2}" == "${the_new_dir}" ]]; then
            popd -n +$cnt 2>/dev/null 1>/dev/null
            cnt=cnt-1
        fi
    done

    set -u
    return 0
}

alias cd=cd_func

########################
###     XCOL         ###
########################


function xcolorize()
{
    set +u
  local bold=$(tput bold)                         # make colors bold/bright
  local normal=$'\e[0m'                           # (works better sometimes)

  local red=$(tput setaf 1)                # bright red text
  local green=$(tput setaf 2)                     # dim green text
  local fawn=$(tput setaf 3); beige="$fawn"       # dark yellow text
  local yellow=$(tput setaf 11)                   # bright yellow text
  local orange=$(tput setaf 180)
  local darkblue=$(tput setaf 4)                  # dim blue text
  local blue
  local blue="$bold$darkblue"                     # bright blue text
  local sky=$(tput setaf 117)
  local purple=$(tput setaf 135);
  local magenta=$(tput setaf 12)
  local pink="$bold$purple"                       # bright magenta text
  local darkcyan=$(tput setaf 6)                  # dim cyan text
  local cyan="$bold$darkcyan"                     # bright cyan text
  local gray=$(tput setaf 7)                      # dim white text
  local darkgray="$bold"$(tput setaf 0)           # bold black = dark gray text
  local white="$bold$gray"                        # bright white text

  local bell=$(tput bel)                          # bell/beep
  local y=0


  # produce separator character ^A (for _sed_)
  local A=$(echo | tr '\012' '\001')

  # compile all rules given at command line to 1 set of rules for SED
  while [ "/$1/" != '//' ] ; do
    local c1=''; local re='';  local beep=''
    c1=$1 ; re="$2" ; shift 2 || break
    # if a beep is requested in the optional 3rd parameter set $beep
    [ "/$1/" != '//' ] && [[ ( "$1" = 'bell' || "$1" = 'beep' ) ]] \
      && beep=$bell && shift
    # if the regular expression includes \/ we split the substitution
    if [ "/${re/*\\\/*/}/" = '//' ] ; then
      # we need to count "("s before the \/ (=$left)
      local left="${re%\\/*}"; local leftlength=${#left}
      # first we count "\("
      local dummy=${left//\\(}; escdgroups=$(( (leftlength-${#dummy})/2 ))
      # now "(" (and we add 2 for the groups used for ($re) in $sedrules)
      local dummy=${left//(}; groupcnt=$((leftlength-${#dummy}-escdgroups+2))
      # replace \/ with )( so below we get (left-re)(right-re)
      re="${re/\\\//)(}"
      local sedrules="$sedrules;s$A($re)$A\1${(P)c1}\\$groupcnt$beep$normal${A}g"
      sedrules="${sedrules}I"   # add case insensitive
    else
      local sedrules="$sedrules;s$A($re)$A${(P)c1}\1$beep$normal${A}g"
      sedrules="${sedrules}I"   # add case insensitive
    fi
    # limit parsing of arguments
    (( y++ && y>888 )) && { echo "$0: too many arguments" >&2; return 1; }
  done

  if [[ `uname` == 'Darwin' ]]
  then 
    gsed --regexp-extended -e "$sedrules" 
  else 
    sed --regexp-extended -e "$sedrules"
  fi
  return
}

# Colorize your standard output using xcolorize with a grep-like usage
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage piping from stdin:
#   mount | xcol mnt "sda." "sdb." cgroup tmpfs proc
#
# Usage reading from a file:
#   xcol pae fpu vme mhz sse2 cache cores /proc/cpuinfo
#
# Notes:
#   It supports sed compatible regular expressions
function xcol()
{
    set +u 
  local bold=$(tput bold)                         # make colors bold/bright
  local red="$bold$(tput setaf 1)"                # bright red text
  local green=$(tput setaf 2)                     # dim green text
  local fawn=$(tput setaf 3); beige="$fawn"       # dark yellow text
  local yellow="$bold$fawn"                       # bright yellow text
  local darkblue=$(tput setaf 4)                  # dim blue text
  local blue="$bold$darkblue"                     # bright blue text
  local purple=$(tput setaf 5)
  local pink="$bold$purple"                       # bright magenta text
  local darkcyan=$(tput setaf 6)                  # dim cyan text
  local cyan="$bold$darkcyan"                     # bright cyan text
  local gray=$(tput setaf 7)                      # dim white text
  local darkgray="$bold"$(tput setaf 0)           # bold black = dark gray text
  local white="$bold$gray"                        # bright white text

  local COLS=( white yellow red cyan gray purple pink fawn )

  [ -t 0 ] && local STDIN=0 || local STDIN=1

  if [[ $STDIN == 0 ]]; then 
    local FILE=$argv[$#];                         # last argument is the file name
    argv[$#]=()                                   # remove last argument
  fi

  local IDX=1                                     # rotate colors in a cycle
  for arg in $argv[@]; do
    local ARGS=( ${ARGS[@]} ${COLS[$IDX]} $arg )
    IDX=$(( IDX + 1 )) 
    [[ $IDX == ${#COLS[@]} ]] && IDX=1
  done
  [[ $STDIN == 1 ]] && {
    xcolorize --unbuffered ${ARGS[@]}
    } || {
    cat $FILE | xcolorize --unbuffered ${ARGS[@]}
  }
}


video(){
    [[ $3 == "" ]] && { 
    echo "Usage:"
    echo " $ video time name howManyTimes " 
    echo " $ video 3600 'Lunch' 10"
} || {
    INPUT_MIC='alsa_input.usb-046d_0825_855D4C10-02.analog-mono'
    INPUT_AUDIO='alsa_input.pci-0000_38_00.6.analog-stereo'
    CAMERA='/dev/video0'
    FRAMERATE=25
    VIDEOSIZE=800x600
    for i in $(seq -w 1 $3); 
    do  
        ffmpeg -f pulse -i $INPUT_MIC -t $1 -f v4l2 -framerate $FRAMERATE -video_size $VIDEOSIZE -i $CAMERA -t $1 "$(date +%Y%m%d)-$2-$i".mkv ; 
    done
}
} 


unko () {
gnuplot -e "
        set terminal gif anim;
        set output 'unko.gif';
        se hid;
        se pa;
        se is 100,10;
        se vi equal xyz;
        do for[i=1:30]{
            se vi 60,360-12*i;
            sp [0:6*pi][-pi:pi] u*cos(u)*(cos(v)+1),u*sin(u)*(cos(v)+1),u*sin(v)-((u+3)/8*pi)**2-20}"
}
