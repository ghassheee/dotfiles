set runtimepath+=~/.vim
set runtimepath+=~/vim/vim-syntax-christmas-tree

    source ~/.vim/vimrcs/filetypes.vim
    source ~/.vim/vimrcs/plugins_config.vim
    source ~/.vim/vimrcs/extended.vim
    source ~/.vim/vimrcs/basic.vim

"" set t_Co='256'
set clipboard=unnamedplus
colorscheme peaksea
"colorscheme elflord

nnoremap <silent><C-n> :NERDTreeToggle<CR>
set shell=zsh
let NERDTreeShowHidden=1

map <leader>c :w !xsel -i -b<CR>
map <leader>v :r!xsel -b<CR>

nnoremap <silent><leader>vs :exe VS()<CR>
nnoremap <silent><leader>vss :exe VSS()<CR>

function! VS()
    exe "norm \<C-u>"
    let @z=&so              " save scrolloff in register z 
    set so=0 noscb          " set scrolloff to 0 and clear scrollbind
    bo vs                   " split window vertically
    exe "norm \<PageDown>"  
    setl scrollbind         " set local scrollbind in right window
    wincmd p                " jump to previous window
    setl scrollbind         " set local scrollbind in left window
    let &so=@z
endfunction
function! VSS()
    exe "norm \<C-u>"
    let @z=&so              " save scrolloff in register z 
    set so=0 noscb          " set scrolloff to 0 and clear scrollbind
    bo vs                   " split window vertically
    exe "norm \<PageDown>k"  
    setl scrollbind         " set local scrollbind in right window
    wincmd p                " jump to previous window
    setl scrollbind         " set local scrollbind in left window
    let @z=&so              " save scrolloff in register z 
    set so=0 noscb          " set scrolloff to 0 and clear scrollbind
    bo vs                   " split window vertically
    exe "norm \<PageDown>\<PageDown>"  
    setl scrollbind         " set local scrollbind in right window
    wincmd p                " jump to previous window
    setl scrollbind         " set local scrollbind in left window
    let &so=@z
endfunction

set runtimepath+=~/.vim/deoplete.nvim
set runtimepath+=~/.vim/nvim-yarp
set runtimepath+=~/.vim/vim-hug-neovim-rpc
set runtimepath+=~/.vim/deoplete-ocaml
let g:deoplete#enable_at_startup = 1 


syntax enable 
filetype plugin indent on 

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp+=' . g:opamshare . '/merlin/vim'


let g:deoplete#complete_method = "complete" 
let g:deoplete#auto_complete_delay = 0
