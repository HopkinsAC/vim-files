"
"	Copyright (C) 2020 Andrew C. Hopkins
"	2020-06-15T10:30:00-07
"	Version 0.1
"
"	Contents
"		General Behavior
"		Specialized Behavior
"		Files and Directories
"		Fonts and Colors
"		GUI
"		Keymappings
"=======================================================================================
"


" General Behavior {{{
"=======================================================================================
"

set nocompatible			" be iMproved, required
filetype off				" required

"
" --- Plugin Compatability ---
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ColorSchemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'



" All of your Plugins must be added before the following line
call vundle#end()			" required

filetype plugin on			" For plugins to load correctly
filetype indent on

syntax on				" Turn on syntax highlighting

"
" --- Mapleader ---
"
let mapleader = ","			" With a map leader it's possible to do extra
					"    key combinations like <leader>w saves the
					"    current file

let maplocalleader=";"

" }}}


" Specialized Behavior {{{
"=======================================================================================
"

"
" --- Language ---
"
let $LANG='en'				" Avoid garbled characters in Chinese language windows OS
set spelllang=en_us			" spell checking
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"
" --- Wild Menu ---
"
set wildmenu				" Turn on the Wild menu
set wildchar=<TAB>			" Hitting TAB in command mode will
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc		" Ignore compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/* " Ignore source repositories
set wildignore+=*.DS_STORE,*.db,node_modules/**
set wildignore+=*.jpg,*.png,*.gif	" Ignore image files
set wildignore+=*/coverage

"
" --- Searching and Regexp ---
"
set gdefault				" RegExp global by default
set magic				" Enable extended regexes.
set hlsearch				" highlight searches
set incsearch				" show the `best match so far' astyped
set ignorecase				" Ignore case when searching
set smartcase				" When searching try to be smart about cases

nnoremap <CR> :nohlsearch<CR>		" Turns highlighting off in normal mode

"
" --- Sounds ---
"
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" }}}


" Files and Directories {{{
"=======================================================================================
"

"
" --- Local directories (centralize everything) ---
"
set directory=~/vimfiles/tempdirs/swaps
set backupdir=~/vimfiles/tempdirs/backups
set undodir=~/vimfiles/tempdirs/undodir

"
" --- Backup ---
"
set nobackup
set nowritebackup
set noswapfile
set undofile

"
" --- Encoding ---
"
set encoding=utf8 nobomb			" Set utf8 as standard encoding and en_US as the
						"    standard language
set ffs=unix,dos,mac				" Use Unix as the standard file type

set autoread					" reload files if changed externally
au FocusGained,BufEnter * checktime

nnoremap <leader>w :w!<cr>			" Fast saving

" }}}


" Fonts and Colors {{{
"========================================================================================
"

set t_Co=256				" 256 color terminal

if has('gui_running')
	"set guifont=ProggyClean:h16:cANSI:qDRAFT
	set guifont=Lucida_Console:h14:cANSI:qDRAFT
	set guitablabel=%M\ %t
endif

set background=dark

colorscheme badwolf
"	colorscheme molokai
"	colorscheme vividchalk

"}}}


" GUI {{{
"=======================================================================================
"

"
" --- General Behavior ---
"
set title				" Show the filename in the window title bar.
set ruler				" Always show current position
set cursorline				" Highlight current line
set laststatus=2			" Always show status line
set report=0				" Show all changes.
set showmode				" Show the current mode.
set showcmd				" show partial command on last line of screen.
set cmdheight=1				" Height of the command bar
set splitbelow splitright		" how to split new windows.
set whichwrap+=<,>,[,]

"
" --- performance / buffer ---
"
set hidden				" can put buffer to the background without
					"   writing to disk, will remember 
					"   history/marks.
set lazyredraw				" don't update the display while executing macros
set ttyfast				" Send more characters at a given time.

"
" --- Folding ---
"
set foldlevelstart=10			" Open most folds by default
set foldnestmax=10			" deepest fold is 10 levels
set foldcolumn=1			" Add a bit extra margin to the left
set foldmethod=manual			" manual fold
set nofoldenable			" don't fold by default

nnoremap <space> za			" space open closes folds

"
" --- Bracket Matching ---
"
set showmatch				" Show matching brackets when text indicator
					"    is over them
set mat=2				" How many tenths of a second to blink when
					"    matching brackets

"
" --- scrolling ---
"
set scrolloff=5				" Start scrolling n lines before horizontal
					"    border of window.
set sidescrolloff=7			" Start scrolling n chars before end of screen.
set sidescroll=1			" The minimal number of columns to scroll

"
" --- line numbers ---
"
set number relativenumber		" Enable line numbers.
set numberwidth=5			" width of numbers line (default on gvim is 4)
					"    horizontally.

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"
" --- diff ---
"
set diffopt=filler			" Add vertical spaces to keep right and left
					"    aligned.
set diffopt+=iwhite			" Ignore whitespace changes.

"
" --- list chars ---
"

" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:>-,eol:<,nbsp:%
set fillchars=fold:-
set list

nnoremap <leader>c :set nolist!<CR>

"
" --- Cursors ---
"

" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"
" --- UI Widgets ---
"
au GUIEnter * simalt ~x			" Open VIM Maximized on Windows 10

if has('gui_running')
	" toolbar and scrollbars
	"
	set guioptions-=m		" remove menu bar
	set guioptions-=T		" remove toolbar
	set guioptions-=L		" left scroll bar
	set guioptions-=r		" right scroll bar
	set guioptions-=b		" bottom scroll bar
	set guioptions-=h		" only calculate bottom scroll size of current line
	set shortmess=atI		" Don't show the intro message at start and
					"   truncate msgs (avoid press ENTER msgs).
endif

" }}}


" Keymappings {{{
"=======================================================================================
"
set timeoutlen=500			" how long it wait for mapped commands
set ttimeoutlen=100			" faster timeout for escape key and others
set backspace=eol,start,indent		" Configure backspace so it acts as it should act
set esckeys				" Allow cursor keys in insert mode.
set nostartofline			" Make j/k respect the columns

"
" --- Basic Motions ---
"
" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap k gk

"
" --- Window Motions ---
"
" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

"
" --- automatic esc, really uncommon to type jj,jk ---
"
noremap jj <ESC>
inoremap jk <Esc>

"
" --- Visually select the text that was last edited/pasted ---
"
nnoremap <leader>v `[v`]

"
" --- Easier vimrc handling ---
"
nnoremap <leader>ev :vsp $MYVIMRC<CR>		" Load the vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>	" Reload the vimrc

" }}}


" vim:foldmethod=marker:foldlevel=0
