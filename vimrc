" Header {{{
"
"	Andy Hopkins
"	20200515 T15:44 PDT
"	Version 0.1.1
"
"	Contents
"		Behavior
"		GUI
"______________________________________________________________________________	
"

"}}}
" Behavior {{{
" _______________________________________________________________________________________________
"

set nocompatible            			" Disable vi compatibility

filetype on                 			" filetype must be 'on' before setting it 'off'
                            			"   otherwise it exits with a bad status and breaks
                            			"   git commit.
filetype off                			" force reloading *after* pathogen loadedocompatible



filetype plugin indent on			" For plugins to load correctly
syntax on 					" Turn on syntax highlighting


" }}}
" GUI {{{
" __________________________________________________________________________________________________
"

au GUIEnter * simalt ~x				" Open VIM Maximized


" }}}
