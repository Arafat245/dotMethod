" THE VIMRC $MYVIMRC
" vim configuration file
" Edited by Emrul Hasan Zawad <mechezawad@outlook.com>
"
" long live vim
set encoding=utf-8
set nocompatible

" When writing buffer encoding to utf-8
set fileencoding=utf-8
" Script Encoding When writing to buffer
scriptencoding utf-8

" Pathogen support
" execute pathogen#infect()

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" color schemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/Skittles-Dark'
Plugin 'sickill/vim-monokai'
Plugin 'hukl/Smyck-Color-Scheme'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'altercation/vim-colors-solarized.git'

" plugins
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/trailing-whitespace'
Plugin 'vim-scripts/taglist.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'gregsexton/gitv'
Plugin 'wincent/Command-T'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'powerline/powerline'
Plugin 'othree/html5.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sudar/Arduino-Makefile'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'mbbill/undotree'

" Bundle
Bundle 'joonty/vdebug.git'

" syntax files
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'voithos/vim-python-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'derekwyatt/vim-scala'
Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rstacruz/sparkup'

call vundle#end()
filetype plugin indent on

" command-t config
let g:CommandTTraverseSCM = 'pwd'

" taglist config
let g:Tlist_Use_Right_Window = 1

" coffeescript config
hi link coffeeSpaceError NONE

" syntax highlighting and auto-indentation
syntax on
filetype indent on
filetype plugin on
inoremap # X<C-H>#
set ai
set si
set nu

" omg folding is the worst
set nofoldenable

" " folding is optional, that's why commenting these option

" set viewoptions-=options
" augroup foldingMethod
"     autocmd BufWritePost *
"     \   if expand('%') != '' && &buftype !~ 'nofile'
"     \|      mkview
"     \|  endif
"     autocmd BufRead *
"     \   if expand('%') != '' && &buftype !~ 'nofile'
"     \|      silent loadview
"     \|  endif
" augroup END
"
" set foldlevel=999999

" omg automatic comment insertion is the worst
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" expand tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" faster tab navigation
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>

" always show tab line to avoid annoying resize
set showtabline=2

" searching options
set incsearch
set ignorecase
set smartcase
" set hlsearch

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable annoying beep on errors
set noerrorbells
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" syntax color enable
syntax enable
" font options
set background=dark
set t_Co=256
colorscheme solarized

" keep at least 5 lines below the cursor
set scrolloff=5

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" enable mouse support
set mouse=a

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" word wrapping
set wrap
set linebreak
set nolist

" better tab completion on commands
set wildmenu
set wildmode=list:longest
set wildignore+=*.pyc,__pycache__

" close buffer when tab is closed
set nohidden

" ctags
set tags=./tags,tags;

" better moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Ctrl+{h,j,k,l}: move among windows
" ii: operate on all text at current indent level
" ai: operate on all text plus one line up at current indent level

" shortcuts to common commands
let mapleader = ","

" ,a: ack from the current directory
nnoremap <leader>a :Ack

" ,b: browse tags
nnoremap <leader>b :TlistToggle<CR>

"  TComment Works in both normal and Visual mode
" ,c: toggle comments
" ,C: toggle block comments
nnoremap <leader>c :TComment<CR>
nnoremap <leader>C :TCommentBlock<CR>
vnoremap <leader>c :TComment<CR>
vnoremap <leader>C :TCommentBlock<CR>

" ,e: open file in new tab
" ,g: ctags go to definition in new tab
" ,G: ctags go to definition in new buffer
" ,l: toggle NERDTree
" ,h: horizontal split window
" ,m: toggle mouse support
" ,p: toggle paste mode
" ,o: open file
" ,s: split window
" ,t: new tab
" ,w: close tab

nnoremap <leader>e :tabnew<CR>:CommandT<CR>
nnoremap <leader>g <C-w><C-]><C-w>T
nnoremap <leader>G <C-]>
nnoremap <leader>h :split
nnoremap <leader>l :NERDTreeTabsToggle<CR>
nnoremap <leader>k :SyntasticCheck<CR>
nnoremap <leader>o :CommandT<CR>
nnoremap <leader>p :set invpaste<CR>
nnoremap <leader>t :tabnew
nnoremap <leader>s :vsplit
nnoremap <leader>w :tabclose<CR>

" undotree vim plugin
nnoremap <Leader>u :UndotreeToggle<CR>

" Auto change directory to match current file
nnoremap ,d :cd %:p:h<CR>:pwd<CR>

" ; is better than :
nnoremap ; :

" omni completion for <C-x><C-o> in insert mode
inoremap <C-d> <C-x><C-o>

" more logical vertical navigation
nnoremap <silent> k gk
nnoremap <silent> j gj

" make copy/pasting nice
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=r
        set nonu
    else
        set mouse=a
        set nu
    endif
endfunction
nnoremap <leader>m :call ToggleMouse()<CR>

"Only auto omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Auto completion for PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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

" Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

" Only apply to help files...
function! HelpInNewTab()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

"Automatically removing all trailing whitespace

autocmd BufWritePre * :%s/\s\+$//e

" Interesting and Advanced vim Configuration by Damiam Conway
" Make the 81st column stand out

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" setting personalized rulerformat
set rulerformat=%15(%c%V\ %p%%%)

" relative number
set relativenumber

" Dragging and duplicating visuals
" You can change your binding as you wish

vmap <expr> <C-h>   DVB_Drag('left')
vmap <expr> <C-l>  DVB_Drag('right')
vmap <expr> <C-j>   DVB_Drag('down')
vmap <expr> <C-k>     DVB_Drag('up')

vmap <expr> <C-D>      DVB_Duplicate()

function! ToggleGUICruft()
  if &guioptions=='irml'
    exec('set guioptions=irLmT')
  else
    exec('set guioptions=irml')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" By default, hide gui menus
set guioptions=irml

"undo persistant
if has('persistant_undo')
    set undofile
endif

   " hightlight C and C++
hi Function guifg=red
hi Identifier guifg=red

let g:syntastic_enable_balloons = 1
" Syntastic Plugin C11 support Clang Compiler
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = ' -std=c11 -Wall -Werror -pedantic-errors '

" Syntastic Plugin C++11 support for Clang Compiler
let g:syntastic_cpp_checkers = ['clang_check', 'gcc']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall -Werror - pedantic-errors '


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim  setlocal ts=2 sts=0 sw=2 expandtab fdm=marker fdl=0
  autocmd FileType sh   setlocal ts=2 sts=0 sw=2 expandtab
  autocmd FileType c    setlocal ts=4 sts=0 sw=4 expandtab
  autocmd FileType cpp  setlocal ts=4 sts=0 sw=4 expandtab
  autocmd FileType java setlocal ts=4 sts=0 sw=4 expandtab
  autocmd FileType php  setlocal ts=4 sts=0 sw=4 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " for aurduino support
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
endif

"""Othree/html5 plugin configuration

" Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0
" Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0
" Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0
" Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0

" Stop that damn ex mode
nnoremap Q <nop>

" " IF you want to off Arrow key Functionality
" for better purity and muscle trainning
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" Tab completion - local
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"

" Vdebug options
let g:vdebug_options = {"on_close":"detach"}

" Syntastic Checker
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" html smart indentation
" Only works in vim --noplugin mode

augroup htmlIndent
  autocmd!
  autocmd BufRead,BufWritePost *.html normal gg=G
augroup END

" single line commenting in .c file
" better for .c and .cpp build and run
augroup sourceCodeC
  autocmd!
  autocmd FileType c nnoremap <leader>r :! make
  autocmd FileType c nnoremap <leader>c I // <esc>
augroup END

augroup sourceCodeCPP
  autocmd!
  autocmd FileType cpp nnoremap <leader>r :! make
augroup END

" Better for javac
augroup sourceCodeJava
  autocmd!
  autocmd FileType java nnoremap <leader>r :! javac
augroup END

" for PHP cli mode
augroup sourceCodePHP
  autocmd!
  autocmd FileType php nnoremap <leader>r :! php
  " autocmd FileType php colo skittles_dark
augroup END


" cursorline
set cursorline

" Match angle bracket
set matchpairs+=<:>

" better tab completion
runtime plugin/smartcom.vim

" Vim airline custom setting
let g:airline#extensions#tabline#enabled = 1
" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" vim statusline when ~$vim --noplugin
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'}]  " filetype
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Escape key alteration
" inoremap jk <esc>

" repoen a file at the same line it was on when previously closed
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

" Managing undo in the temp directory
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

" supporting undo and history level
set textwidth=120
set undofile
set undolevels=1000
set history=1000


" promt user Confirmation
set confirm

" Set colo
colo solarized

" autoread from outside buffer
" set autoread

" Indenting PARADIGM

set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks


nnoremap <silent> >> :call ShiftLine()<CR>|               "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction

"""
" autosaving mode in vim
" set autowriteall


" more to come :)
