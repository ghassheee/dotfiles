#################
### OH-MY-ZSH ###
#################


set +u
if [ -d $HOME/.oh-my-zsh ]
then
    ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="robbyrussell"
    DISABLE_AUTO_UPDATE="true"
    UPDATE_ZSH_DAYS=180
    ENABLE_CORRECTION="false"
    COMPLETION_WAITING_DOTS="true"
    CASE_SENSITIVE="true"
    HIST_STAMPS="01/01/2017"
    TERM="xterm-256color"
    TERM_PROGRAM=""
    DISABLE_LS_COLORS=""
    HYPHEN_INSENSITIVE=""
    WINDOW=""
    DISABLE_UNTRACKED_FILES_DIRTY=""
    ZSH_CUSTOM=""
    ZSH_CACHE_DIR=""
    ZSH_COMPDUMP=""
    HISTFILE=""
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
fi


#################
###  GENERAL  ###
#################

source $HOME/.private.zsh
source $HOME/.color.zsh
source $HOME/.env.zsh
source $HOME/.path.zsh
source $HOME/.alias.zsh
source $HOME/.language.zsh
source $HOME/.function.zsh
source $HOME/.ipban.zsh

#################
###    O S    ###
#################

set +u
[[ `uname` == 'Linux'  ]] && source $HOME/.linux.zsh;
[[ `uname` == 'Darwin' ]] && source $HOME/.macos.zsh;

__ETC_ZSHRC_SOURCED=1
