################
###   ENV    ###
################

source $HOME/.private.zsh
source $HOME/ghasshee/dotfiles/.env.zsh
source $DOT/.path.zsh


#################
### OH-MY-ZSH ###
#################

if [ -d $DOT/.oh-my-zsh ]
then
    ZSH=$DOT/.oh-my-zsh
    ZSH_THEME="robbyrussell"
    #ZSH_THEME="sorin"
    #ZSH_THEME="refined"
    #ZSH_THEME="obraun"
    ZSH_THEME="norm" 
    ZSH_THEME="amuse"
    ZSH_THEME_GIT_PROMPT_STASHED=""
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

source $DOT/.color.zsh
source $DOT/.alias.zsh
source $DOT/.language.zsh
source $DOT/.function.zsh
source $DOT/.ipban.zsh
is_linux && source $DOT/.nix.zsh;

#################
###    O S    ###
#################

set +u
is_linux && source $DOT/.linux.zsh;
is_macos && source $DOT/.macos.zsh;


is_ubuntu && xmodmap $DOT/.Xmodmap
# __ETC_ZSHRC_SOURCED=1

