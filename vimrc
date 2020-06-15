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

set nocompatible			" Disable vi compatibility

filetype on				" filetype must be 'on' before setting it 'off'
filetype plugin on			" For plugins to load correctly
filetype indent on

syntax on				" Turn on syntax highlighting


" }}}

" GUI {{{
"=====================================================================================================
"

au GUIEnter * simalt ~x			" Open VIM Maximized


" }}}
