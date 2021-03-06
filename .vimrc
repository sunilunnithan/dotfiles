" use vim settings, rather than Vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy paste
set pastetoggle=<F2>
set clipboard=unnamed

"Rebind leader key
let mapleader = ","

" Turn on syntax highlighting
syntax enable

" Turn on file type detection
filetype plugin indent on

" Display incomplete commands
set showcmd

" Display the mode you're in
set showmode

" Intuitive backspacing.
set backspace=indent,eol,start

" Handle multiple buffers better.
set hidden

" Enhanced command line completion
set wildmenu
set wildmode=list:longest
set wildignore+=*.a,*.o,*.bmp,*.gif,*.pdf,*.ico,*.jpg,*.jpeg,*.png,*.swp,*.tmp,.DS_Store,.git,.hg,.svn

" case-insensitive searching
set ignorecase

" But case-sensitive if expression contains a capital letter.
set smartcase

" show line numbers.
set number

" show cursor position
set ruler

" Highlight matches as you type.
set incsearch

" Highlight matches
set hlsearch

" Turn on line wrappping
set wrap

" Show 3 lines of context around the cursor
set scrolloff=3

" Set the terminal's title
set title

" No beeping
set visualbell

" Don't make a backup before overwriting a file
set nobackup
set nowritebackup

" keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" Useful status line
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %P

" Global tap width
set tabstop=2
set shiftwidth=2
set expandtab

" indent to match previous line
set autoindent

" cin: use C-indenting
set cindent

" cink: Perl-friendly reindent keys
set cinkeys=O{,O},!^F,o,O,e

" cino : all sort of options
set cinoptions=t0,+4,(0,)60,u0,*100

" cinwords
set cinwords=if,else,while,do,for,elsif,sub

" com: perlish comments
set comments=n:#

" fo: word wrap, format comments
set formatoptions=crql

" nosi: smart indent useless when C-indent is on
set nosmartindent

" show matches on parens, bracketc, etc
set showmatch

" make search better
set gdefault


"Quick Windows movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" use tab to jump between blocks
nnoremap <tab> %
vnoremap <tab> %

" Map Ctrl + S to save in any mode
nnoremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" Also map leader + s
map <leader>s <C-s>

" Quickly close windows
nnoremap <leader>x :x <cr>
nnoremap <leader>X :q!<cr>

" Dont use Ex mode, use Q for formatting
map Q qq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.

if has("autocmd")

  "Enable file type detection
  filetype plugin indent on

  "Put in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " for all the text files set 'textwidth' to 78 characters
    autocmd FileType text setlocal textwidth=78

    "When editing a file, always jump to the last known cursor position.
    " Dont do it when the position is invalid or when inside an event handler
    " (happends when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") | 
          \ exe "normal g'\""|
          \ endif
    
  augroup END
    
else

  set autoindent

endif "has("autocmd")

" turn other file completion on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

" Plugins
" Load the  matchit plugins
runtime macros/matchit.vim

" VimPlug settings

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wincent/command-t'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}

call plug#end()

" NERDTree Settings

let g:NERDTreeDirArrows=0
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden file in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree 
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

"CtrlP Settings
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" Airline settings
let g:airline#extensions#tabline#enabled=1

