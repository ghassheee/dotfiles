
"""""""""""""""""""""""""""""""""""""
"          Src Files                "
"""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim
set runtimepath+=~/vim/vim-syntax-christmas-tree

    source ~/.vim/vimrcs/filetypes.vim
    source ~/.vim/vimrcs/plugins_config.vim
    source ~/.vim/vimrcs/extended.vim
    source ~/.vim/vimrcs/basic.vim

"""""""""""""""""""""""""""""""""""""
"            COLOR                  "
"""""""""""""""""""""""""""""""""""""
syntax enable

if $COLORTERM == 'gnome-terminal'  
    set t_Co=256
endif

try
"colorscheme desert
"colorscheme peaksea
"colorscheme elflord
"colorscheme peaksea
"colorscheme mayansmoke
"colorscheme ir_black
"colorscheme morning
"colorscheme ron
"colorscheme pyte
colorscheme zellner
"colorscheme delek
catch
endtry

set background=dark

if has("gui_running")       " gvim 
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""
"             FONT                  "
"""""""""""""""""""""""""""""""""""""
set encoding=utf8
set ffs=unix,dos,mac  " file type standard


"""""""""""""""""""""""""""""""""""""
"           NERDTREE                "
"""""""""""""""""""""""""""""""""""""
nnoremap <silent><C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.cmo$','\.cmi$']

"""""""""""""""""""""""""""""""""""""
"           CLIPBOARD               "
"""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
map <leader>c :w !xsel -i -b<CR>
map <leader>v :r!xsel -b<CR>

"""""""""""""""""""""""""""""""""""""
"        VERTIVAL SPLIT             "
"""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""
"            MERLIN                 "
"""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp+=' . g:opamshare . '/merlin/vim'
execute 'set rtp^=' . g:opamshare . '/ocp-indent/vim'
" auto-completion shortcut:  Ctrl-f 
imap <C-f> <C-x><C-o>

"""""""""""""""""""""""""""""""""""""
"       DEOPLETE                    "
"""""""""""""""""""""""""""""""""""""
"let g:deoplete#complete_method = "complete" 
"let g:deoplete#auto_complete_delay = 0
"let g:deoplete#enable_at_startup = 1 



" Logical Character
"""""""""""""""""""""""""""""""""""""
"                                   "
"""""""""""""""""""""""""""""""""""""
imap <leader>top    <C-v>u22A4
imap <leader>bot    <C-v>u22A5
imap <leader>and    <C-v>u2227
imap <leader>or     <C-v>u2228
imap <leader>to     <C-v>u2192
imap <leader>models <C-v>u22A2
