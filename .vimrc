"""""""""""""""""""""""""""""""""""""
"          Src Files                "
"""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim
set runtimepath+=~/vim/vim-syntax-christmas-tree

    source ~/.vim/filetypes.vim
    source ~/.vim/plugins_config.vim
    source ~/.vim/extended.vim
    source ~/.vim/basic.vim

"""""""""""""""""""""""""""""""""""""
"            COLOR                  "
"""""""""""""""""""""""""""""""""""""
syntax enable

if $COLORTERM == 'gnome-terminal'  
    set t_Co=256
endif

try
colorscheme mayansmoke
colorscheme elflord
colorscheme pablo
"colorscheme ir_black
"colorscheme desert
"colorscheme peaksea
"colorscheme morning
"colorscheme delek
""colorscheme ron
""colorscheme pyte
""colorscheme zellner
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
let NERDTreeIgnore = ['\.cmo$','\.cmi$','\.hi$','\.o$']
map <leader>b :bp<CR>

"""""""""""""""""""""""""""""""""""""
"           CLIPBOARD               "
"""""""""""""""""""""""""""""""""""""
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
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
"       MATH SYMBOLS                "
"""""""""""""""""""""""""""""""""""""
imap <leader>top    <C-v>u22A4
imap <leader>bot    <C-v>u22A5
imap <leader>and    <C-v>u2227
imap <leader>or     <C-v>u2228
imap <leader>to     <C-v>u2192
imap <leader>models <C-v>u22A2

imap <leader>mu     <C-v>u264C
imap <leader>pi     <C-v>u2650
imap <leader>Pi     <C-v>u2630
imap <leader>sigma  <C-v>u2652
imap <leader>Sigma  <C-v>u2632
imap <leader>theta  <C-v>u2648
imap <leader>Gamma  <C-v>u2623
imap <leader>gamma  <C-v>u2643


"""""""""""""""""""""""""""""""""""""
"       pathogen init (bundle dir)  "
"""""""""""""""""""""""""""""""""""""
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""
"       AUTO SAVE                   "
"""""""""""""""""""""""""""""""""""""

" autocmd TextChanged,TextChangedI <buffer> silent write 


"""""""""""""""""""""""""""""""""""""
"           COQ                     "
"""""""""""""""""""""""""""""""""""""

function HoTT()
    let g:coqtail_coq_path = '/home/ghasshee/HoTT'
    let g:coqtail_coq_prog = 'hoqidetop' 
    echo 'HOTT LOADED.'
endfunction 
command HOTT :exe HoTT()

nmap <leader>l :CoqToTop<cr>:CoqToLine<cr>
filetype plugin on 
filetype indent on 
syntax on 



"""""""""""""""""""""""""""""""""""""
"         HASKELL                   "
"""""""""""""""""""""""""""""""""""""

command GHCI9 :w | ! /usr/local/bin/ghci % 
command GHCI  :w | ! ghci %
command SCM   :w | ! rlwrap scheme --load %


"""""""""""""""""""""""""""""""""""""
"          OCAML                    "
"""""""""""""""""""""""""""""""""""""

command OCAML :w | ! rlwrap ocaml 


command TM    :bo vert term
command MK    :bo vert term make
command MKL   :bo vert term make clean

nmap <leader>q :q<CR>
