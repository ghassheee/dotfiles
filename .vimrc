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
