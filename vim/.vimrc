" VimPlug settings

call plug#begin('~/.vim/plugged')

" colors
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tomasiser/vim-code-dark'

" Atom One Dark / Light theme.
Plug 'rakr/vim-one'

" Gruvbox Community theme.

"Junegunn plugins"

Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
  nmap <Leader>l <Plug>(Limelight)
  xmap <Leader>l <Plug>(Limelight)
  nnoremap <Leader>ll :Limelight!<cr>
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Better manage Vim sessions.
Plug 'tpope/vim-obsession'

" Zoom in and out of a specific split pane (similar to tmux).
Plug 'dhruvasagar/vim-zoom'

" Pass focus events from tmux to Vim (useful for autoread and linting tools).
Plug 'tmux-plugins/vim-tmux-focus-events'

" Helpers for moving and manipulating files / directories.
Plug 'tpope/vim-eunuch'

" Run a diff on 2 directories.
Plug 'will133/vim-dirdiff'

" Run a diff on 2 blocks of text.
Plug 'AndrewRadev/linediff.vim'

" Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Highlight which character to jump to when using horizontal movement keys.
Plug 'unblevable/quick-scope'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Handle multi-file find and replace.
Plug 'mhinz/vim-grepper'

" Better display unwanted whitespace.
Plug 'ntpeters/vim-better-whitespace'

" Toggle comments in various ways.
Plug 'tpope/vim-commentary'
  map  gc  <Plug>Commentary
  nmap gcc <Plug>CommentaryLine

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plug 'tpope/vim-sleuth'


" A number of useful motions for the quickfix list, pasting and more.
Plug 'tpope/vim-unimpaired'

" Drastically improve insert mode performance in files with folds.
Plug 'Konfekt/FastFold'

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify'

" A git wrapper.
Plug 'tpope/vim-fugitive'

" Run test suites for various languages.
Plug 'janko/vim-test'

" Languages and file types.
Plug 'sheerun/vim-polyglot'

"Move faster in vim"
Plug 'easymotion/vim-easymotion'

"Tpope goodies"
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-vinegar'

"Chris plugins"
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'

"File Line
Plug 'bogado/file-line'

"Golden Ratio
Plug 'roman/golden-ratio'

"LightLine
Plug 'itchyny/lightline.vim'

call plug#end()


" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

"Set the color scheme"
colorscheme codedark
" set background=dark


" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "

" use vim settings, rather than Vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy paste
set pastetoggle=<F2>
set clipboard=unnamedplus,unnamed

" Spell Complete
set complete+=kspell
set completeopt=menuone,longest

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
set rnu

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
set backupdir=/tmp//,.

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
set autoread

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

" Timeout
set ttimeout
set timeoutlen=300
set ttimeoutlen=0

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Move between wrapped lines, rather than jumping over wrapped segments
nmap j gj
nmap k gk

"Esc Mapping
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap jk <Esc>
nnoremap kj <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>
xnoremap kj <Esc>
cnoremap kj <C-c>

"Copy paste"

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y y$

"Quick Windows movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" use tab to jump between blocks
nnoremap <tab> %
vnoremap <tab> %

"  automatically set current diretory to the directory of last opened fie
set autochdir

" enable mouse mode
set mouse+=a

" Map Ctrl + S to save in any mode
nnoremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" Also map leader + s
map <leader>s :update<CR>
map <leader>w :update<CR>


" Quickly close windows
nnoremap <leader>x :x <cr>
nnoremap <leader>X :q!<cr>


" Dont use Ex mode, use Q for formatting
map Q qq

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" Toggle relative line numbers and regular line numbers.
nmap <F6> :set invrelativenumber<CR>

" Toggle visually showing all whitespace characters.
noremap <F7> :set list!<CR>
inoremap <F7> <C-o>:set list!<CR>
cnoremap <F7> <C-c>:set list!<CR>

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nnoremap <silent> <Leader>qf :call QuickFix_toggle()<CR>

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
"inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
"inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
"inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
" inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
" inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"


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

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
autocmd BufNewFile,BufRead .*aliases* set ft=sh

" Make sure Kubernetes yaml files end up being set as helm files.
au BufNewFile,BufRead *.{yaml,yml} if getline(1) =~ '^apiVersion:' || getline(2) =~ '^apiVersion:' | setlocal filetype=helm | endif

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Mappings to make Vim more friendly towards presenting slides.
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>

  if !exists('#goyo')
    Goyo
  endif
endfunction

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:60%:hidden', 'ctrl-/']

" Map a few common things to do with FZF.
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fg :GitFiles<CR>
nnoremap <silent> <Leader>fc :Colors<CR>
nnoremap <silent> <Leader>fr :History<CR>
nnoremap <silent> <Leader>fh :Helptags<CR>
nnoremap <silent> <Leader>fs :Rg<CR>

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})


" .............................................................................
" unblevable/quick-scope
" .............................................................................

" Trigger a highlight in the appropriate direction when pressing these keys.
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

" Only underline the highlights instead of using custom colors.
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" .............................................................................
" ntpeters/vim-better-whitespace
" .............................................................................

let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" .............................................................................
" Konfekt/FastFold
" .............................................................................

let g:fastfold_savehook=0
let g:fastfold_fold_command_suffixes=[]

" .............................................................................
" junegunn/limelight.vim
" .............................................................................

let g:limelight_conceal_ctermfg=244

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1

" Clear
nnoremap <leader>cc :ClearEmAll<cr>

command! ClearEmAll call s:ClearEmAll()

function! s:ClearEmAll()
  nohlsearch
  cclose
  pclose
  lclose
  " call coc#util#float_hide()
  call popup_clear()
endfunction

" Quick sourcing of the current file, allowing for quick vimrc testing
nnoremap <leader>so :source %<cr>

" Help File Speedups
"-------------------

au filetype help call HelpFileMode()

function! HelpFileMode()
  wincmd _ " Maximze the help on open
  nnoremap <buffer> <tab> :call search('\|.\{-}\|', 'w')<cr>:noh<cr>2l
  nnoremap <buffer> <S-tab> F\|:call search('\|.\{-}\|', 'wb')<cr>:noh<cr>2l
  nnoremap <buffer> <cr> <c-]>
  nnoremap <buffer> <bs> <c-T>
  nnoremap <buffer> q :q<CR>
  setlocal nonumber
endfunction

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Vim-conflicted
nnoremap <leader>gnc :GitNextConflict<cr>

" Light Line
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

"Tmux runner

nnoremap <leader>t- :VtrOpenRunner { "orientation": "v", "percentage": 30 }<cr>
nnoremap <leader>t\ :VtrOpenRunner { "orientation": "h", "percentage": 30 }<cr>
nnoremap <leader>tk :VtrKillRunner<cr>
" nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>t0 :VtrAttachToPane 0<cr>:call system("tmux clock-mode -t 0 && sleep 0.1 && tmux send-keys -t 0 q")<cr>
nnoremap <leader>t1 :VtrAttachToPane 1<cr>:call system("tmux clock-mode -t 1 && sleep 0.1 && tmux send-keys -t 1 q")<cr>
nnoremap <leader>v2 :VtrAttachToPane 2<cr>:call system("tmux clock-mode -t 2 && sleep 0.1 && tmux send-keys -t 2 q")<cr>
nnoremap <leader>t3 :VtrAttachToPane 3<cr>:call system("tmux clock-mode -t 3 && sleep 0.1 && tmux send-keys -t 3 q")<cr>
nnoremap <leader>v4 :VtrAttachToPane 4<cr>:call system("tmux clock-mode -t 4 && sleep 0.1 && tmux send-keys -t 4 q")<cr>
nnoremap <leader>t5 :VtrAttachToPane 5<cr>:call system("tmux clock-mode -t 5 && sleep 0.1 && tmux send-keys -t 5 q")<cr>
nnoremap <leader>to :VtrFocusRunner<cr>
nnoremap <leader>tl :VtrSendLinesToRunner<cr>
nnoremap <leader>ts :VtrSendCommandToRunner<space>
