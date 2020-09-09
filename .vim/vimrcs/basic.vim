"""""""""""""""""""""""""""""""""""""
"              Basics               "
"""""""""""""""""""""""""""""""""""""

"let mapleader = "\\"
"let g:mapleader = "\\"
set so=5  

" Fast Saving 
nmap    <leader>w           :w!<cr>
command W                   w !sudo tee % > /dev/null

set history=1000                            " lines of history to remember
set autoread                                " Set to auto read when a file is changed from the outside

filetype plugin on                          " Enable filetype plugins
filetype indent off 

set shell=zsh
let $LANG='en'
set langmenu=en

set wildmenu                                " auto-complete filename 
set wildignore=*.o,*~,*.pyc                 " Ignore compiled files 
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set ruler                                   " Always show current position 

set cmdheight=2                             " Height of the command bar
set foldcolumn=1                            " Add a bit extra margin to the left

set hid                                     " A buffer becomes hidden when it is abandoned

set backspace=eol,start,indent              " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

set lazyredraw                              " Don't redraw while executing macros (good performance config)
" set magic                                 " For regular expressions turn magic on

set showmatch                               " Show matching brackets when text indicator is over them
set mat=2                                   " How many tenths of a second to blink when matching brackets

set noerrorbells                            " No annoying sound on errors
set novisualbell

""""""""""""""""""""""""""""""""""""""""  
"             SEARCH                   "  
""""""""""""""""""""""""""""""""""""""""  
" Disable highlight when <leader><cr> is pressed
map <silent><leader><cr>    :noh<cr>
map <space>                 /
map <c-space>               ?
set ignorecase
set smartcase
set hlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""
"    Files, backups and undo           " 
""""""""""""""""""""""""""""""""""""""""
set nobackup                                " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""
"    Text, tab and indent related      "
""""""""""""""""""""""""""""""""""""""""
set expandtab                               " Use spaces instead of tabs
set smarttab                                " Be smart when using tabs ;)
set shiftwidth=4                            " 1 tab == 4 spaces
set tabstop=4
set lbr                                     " enable Linebreak 
set tw=500                                  " Linebreak on 500 characters
set ai                                      " Auto indent
set si                                      " Smart indent
set wrap                                    " Wrap lines

""""""""""""""""""""""""""""""
"    Visual mode             " 
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""
"    Moving, tabs, windows and buffers    "
"""""""""""""""""""""""""""""""""""""""""""
map <C-j> <C-W>j                            " Smart way to move between windows
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
" Useful mappings for managing tabs
map <leader>t  :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabnext<cr>

let g:lasttab = 1                           " Let 'tl' toggle between this and the last accessed tab
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

try                                         " Specify the behavior when switching between buffers
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
"    Status line             " 
""""""""""""""""""""""""""""""
set laststatus=2            " Always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on maC
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ag '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! HasPaste()                " Returns true if paste mode is enabled
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif
   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Make VIM remember position in file after reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

