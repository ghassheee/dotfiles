#####################
###     BASIC     ###
#####################
alias l='ls -FG'
alias la='ls -aFG'
alias ll='ls -lhFG'
alias lll='ls -alhFGt'
alias lla='ls -alhFGt'
alias lss='ll | less'
alias mv='mv -i'
alias rm='rm -i'
alias rmrf='rm -r -f -i'
alias cp='cp -i'
alias p='pwd'
alias desk='cd $DESK'
alias dow='cd $DOWN'
alias cl='clear'
alias bin="cd $DOT/.bin"
alias globalip='curl ifconfig.me'
alias src='source ~/.zshrc'
alias mk='make' 
alias mkl='make clean' 

alias jctl='journalctl'
alias sctl='systemctl'
alias sq='sort | uniq'
alias grepip="grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'"

# set -o noclobber ## Forbids OVERWRITE a FILE

####################
###     Tmux     ###
####################
alias tm='tmux new \; source-file ~/.tmux/new-session'
alias tmuxconf='tmux new -s tmuxconf \; source-file ~/.tmux/tmuxconf  || tmux attach -t tmuxconf'
alias eth2='tmux new -s eth2 \; source-file ~/.tmux/eth2 || tmux attach -t eth2'
alias hs='tmux new -s hs \; source-file ~/.tmux/haskell || tmux attach -t hs'
alias ag='tmux new -s ag \; source-file ~/.tmux/agda || tmux attach -t ag'
alias kr='tmux new -s kr \; source-file ~/.tmux/kr || tmux attach -t kr'
alias ml='tmux new -s ml \; source-file ~/.tmux/ocaml  || tmux attach -t ml'
alias pen='tmux new -s pen \; source-file ~/.tmux/pen  || tmux attach -t pen'
alias coq='tmux new -s coq \; source-file ~/.tmux/coq  || tmux attach -t coq'
alias rust='tmux new -s rust \; source-file ~/.tmux/rust  || tmux attach -t rust'
alias c='tmux new -s c \; source-file ~/.tmux/c  || tmux attach -t c'
alias dump='tmux new -s dump \; source-file ~/.tmux/dump  || tmux attach -t dump'
alias ssh-monitor='tmux new -s ssh-monitor \; source-file ~/.tmux/ssh-monitor  || tmux attach -t ssh-monitor'
alias js='tmux new -s js \; source-file ~/.tmux/javascript  || tmux attach -t js'
alias sc='tmux new -s sc \; source-file ~/.tmux/scheme  || tmux attach -t sc'
alias blog='tmux new -s blog \; source-file ~/.tmux/blog  || tmux attach -t blog'
alias ethereum='tmux new -s ethereum \; source-file ~/.tmux/ethereum  || tmux attach -t ethereum'
alias ta='tmux attach'
alias killeth2='        tmux kill-session -t eth2'
alias killag='          tmux kill-session -t ag'
alias killjs='          tmux kill-session -t js'
alias killkr='          tmux kill-session -t kr'
alias killc='           tmux kill-session -t c'
alias killdump='        tmux kill-session -t dump'
alias killrust='        tmux kill-session -t rust'
alias killhs='          tmux kill-session -t hs'
alias killml='          tmux kill-session -t ml'
alias killpen='         tmux kill-session -t pen'
alias killssh-monitor=' tmux kill-session -t ssh-monitor'
alias killcoq='         tmux kill-session -t coq'
alias killsc='          tmux kill-session -t sc'
alias killblog='        tmux kill-session -t blog'
alias killethereum='    tmux kill-session -t ethereum'
alias killtmuxconf='    tmux kill-session -t tmuxconf'
alias killalltmux='     tmux kill-server'
alias killtmux='        tmux kill-session -t'

####################
###  DICTIONARY  ###
####################
alias dicw='    sdcv'
alias en='      sdcv -u "dictd_www.dict.org_gcide"'
alias oxw='     sdcv -u "Oxford Advanced Learner'\''s Dictionary 8th Ed."'
alias lnx='     sdcv -u "GNU/Linux English-English Dictionary"'
alias pc='      sdcv -u "Free On-Line Dictionary of Computing"'
alias en-fr='   sdcv -u "English - French"'
alias en-ru='   sdcv -u "English-Russian full dictionary"'
alias en-fi='   sdcv -u "English-Finnish dictionary"'
alias en-ge='   sdcv -u "English-German dictionary"'
alias ge='      sdcv -u "German-English dictionary"'
alias fr='      sdcv -u "French-English dictionary"'
alias ru='      sdcv -u "Russian-English short dictionary"'
alias longman=' sdcv -u "Longman Dictionary of Contemporary English"'
local coloring () { 
    xcolorize sky "^•.*" sky " • " sky "▪" pink "/" orange "~" \
        darkgray "\(formal\)" darkgray "NAmE " darkgray "BrE " darkgray "AW " purple "sth" purple "sb" \
        magenta "Example" magenta "Bank" magenta "Word" magenta "Origin" magenta "Idioms" magenta "Thesaurus" green "Syn" green "Synonyms" \
        purple ":" purple "; " \
        green "adverb" green "verb" green "pronoun" green "noun" green "adjective" green "preposition" green "conjunction" green "determiner"\
        green "-->" orange ">" orange "<" orange  "\(" orange "\)" orange "\{" orange "\}" \
        green "^Found.*" orange "see also" orange "compare " orange "intransitive" orange "transitive"    }
local rmjpgwav () {
    sed -e 's/[A-Za-z0-9_]*.wav//g' -e 's/[A-Za-z0-9_]*.jpg//g' }
oxc() { oxw $@  | rmjpgwav | coloring }
dicc(){ dicw $@ | rmjpgwav | coloring }
ox()  { oxc $@  | less -FX }
dic() { dicc $@ | less -FX }

####################
###  GHASSHEE    ###
####################

ghasshee() {
    set +u
    if   [ -z "$1" ] ;then
        echo "USAGE: $0 Category Title \nDESCRIPTION: \
                See the contents of ghassheee.github.io"
    elif [ -z "$2" ] ;then
        curl https://ghassheee.github.io/$1/ | less -X
    else
        curl https://ghassheee.github.io/$1/$2.md/ | less -X
    fi; set -u
}

####################
###     Git      ###
####################
alias pull='     git pull   '
alias push='     make clean; git add --all; git commit -m "Updated"; git push '
alias commit='   git add --all; git commit -m "Updated"           '
gitglobal() {git config --global user.email "${1}@gmail.com"; git config --global user.name $1; }



####################
###     Nix      ###
####################
nix-hs() {
    nixhsarg=$1;
    [[ $1 == '-i' ]] && {
        shift;
        nix-env -f "<nixpkgs>" -iA \
            $(for i in $@ ; do echo "haskellPackages.$i"; done)
    } || {
        nix-env -f "<nixpkgs>" -qaP -A haskellPackages | grep $nixhsarg
    }
}

alias nixos-update="sudo nixos-rebuild switch"
alias nixos-gc="sudo nix-env -p /nix/var/nix/profiles/system/ --delete-generations old && sudo nixos-rebuild switch && sudo rm /etc/zshrc && nix-collect-garbage -d"



## Locate
# alias updatedb='sudo /usr/libexec/locate.updatedb'

## Clock Weather
alias clock='tty-clock -c -C 5'

weather(){
    set +u
    if [ -z "$1" ] ; then
        curl wttr.in/Osaka
    else
        curl wttr.in/$1
    fi;set -u}



## PYTHON SERVER
alias pyserver='python2 -m SimpleHTTPServer'

## SHIFT2UTF
alias shift2utf='iconv -f SHIFT-JIS -t UTF-8'

## SCAN Neighbor Network
alias arpscan='sudo arp-scan --interface=$BROADCAST_INTERFACE --localnet'

## Parity
# alias parity-classic="$PARITY ui --datadir $PARITY_CLASSIC_DATADIR --chain classic --warp --jsonrpc-apis \"web3,eth,net,parity,traces,rpc,personal\""

alias mupdf='mupdf-x11'


## SCHEME 
alias scheme='rlwrap scheme' 


## SMLSharp 
alias smlsharp='rlwrap smlsharp'
