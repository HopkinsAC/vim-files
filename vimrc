"
"	Copyright (C) 2020 Andrew C. Hopkins
"	2020-06-15T10:30:00-07
"	Version 0.1
"
"	Contents
"		General Behavior
"
"======================================================================================================
"

" General Behavior {{{
"======================================================================================================
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


" }}}

" GUI {{{
"=====================================================================================================
"

au GUIEnter * simalt ~x			" Open VIM Maximized


" }}}
