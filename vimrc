"
"	Copyright (C) 2020 Andrew C. Hopkins
"	2020-06-15T10:30:00-07
"	Version 0.1
"
"	Contents
"		General Behavior
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
