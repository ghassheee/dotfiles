

# DOTFILE 


## Explanation of Files

~~~
.zshrc : zsh config file
  depending on  
    +- .env.zsh 
    +- .path.zsh
    +- .language.zsh
    +- .function.zsh 
    +- . 

.tmux.conf : tmux config file 
  UI is defined in .alias.zsh 
  depending on .tmux

.stardict : dictionaries are kept 
    depending on 'sdcv' command
    UI is defined in .alias.zsh
    e.g.
      * dic : all search command 
      * ox  : oxford english dictionary command   
      * lnx : linux dictionary search command
      ...
~~~


## Installation

~~~
git clone http://www.github.com/ghassheee/dotfiles && cd dotfiles && ./dot install 
~~~

## Glossaries

Basic
~~~
src     : source $HOME/.zshrc
dot     : goto dotfiles directory 
desk    : goto Desktop
dow     : goto Downloads
cl      : clean 
p       : pwd
pull    : git pull
push    : git add --all; git commit -m "Updated"; git push
commit  : git add --all; git commit -m "Updated"
~~~




