
#################
### LANGUAGES ###
#################


###############
###  OCAML  ###
###############

if [[ -d "$HOME/.opam" ]] ; then  ## OPAM
    . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null 
    OPAMROOT=~/.opam
    export OCAML_MY_LIBRARY=$HOME/Programs/ml/programming_in_ocaml/base
    alias utop="utop -I $OCAML_MY_LIBRARY"
fi                       
## export OCAMLPARAM="safe-string=0,_"        ## removes string-bytes error

################
###   RUST   ###  
################

if [[ -d "$HOME/.cargo/env" ]] ; then
    source ~/.cargo/env  ## RUSTUP
fi
alias rc='rustc'
export OPENSSL_DIR=$HOME/.openssl_dir
export CARGO_HOME=$HOME/.cargo
export PATH=$HOME/.cargo/bin:$PATH

###############
### HASKELL ###
###############

# alias ghc='stack ghc'
# alias ghci='stack ghci'
# alias runhaskell='stack runhaskell --'

################
###  PYTHON  ###
################

# export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
# export PYTHONPATH="/usr/local/lib/python3.6/site-packages"
export PYTHONPATH="/usr/local/lib/python3.7/site-packages"


##############
###   GO   ###
##############

export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/gocode"
export PATH=$PATH:"$GOPATH/bin":"$GOROOT/bin"

################
###   RUBY   ###
################

if   [[ `uname` == 'Linux'  ]]; then     PATH=$PATH:$HOME/.gem/bin;
elif [[ `uname` == 'Darwin' ]]; then    ;  # eval "$(rbenv init -)";
fi


################
###  JAVA    ###
################

PATH=$PATH:$HOME/.java/bin
