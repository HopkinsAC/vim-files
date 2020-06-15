"
"	Copyright (C) 2020 Andrew C. Hopkins
"	2020-06-15T10:30:00-07
"	Version 0.1
"
"	Contents
"		General Behavior
"		Specialized Behavior
"		Fonts and Colors
"		GUI
"		Shortcuts
"
"============================================================================================
"

" General Behavior {{{
"============================================================================================
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
let mapleader = ","			" With a map leader it's possible to do extra key
					"    combinations like <leader>w saves the current
					"    file

let maplocalleader=";"

" }}}


" Specialized Behavior {{{
"============================================================================================
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

" Fonts and Colors {{{
"============================================================================================
"

set t_Co=256				" 256 color terminal

if has('gui_running')
    "set guifont=ProggyClean:h16:cANSI:qDRAFT
    set guifont=Lucida_Console:h16:cANSI:qDRAFT
    set guitablabel=%M\ %t
endif

set background=dark

colorscheme badwolf
"   colorscheme molokai
"   colorscheme vividchalk

"}}}


" GUI {{{
"============================================================================================
"

au GUIEnter * simalt ~x			" Open VIM Maximized


" }}}


" Shortcuts {{{
"============================================================================================
"

"
" --- Easier vimrc handling ---
"
nnoremap <leader>ev :vsp $MYVIMRC<CR>		" Load the vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>	" Reload the vimrc

" }}}
