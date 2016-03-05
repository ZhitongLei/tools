""""""""""""""""""""""""""""""
" basic setting
" """"""""""""""""""""""""""""
"设置语法高亮
syntax enable
syntax on

"设置行号
set number

"高亮显示匹配的括号
set showmatch

"突出显示当前行
"set cursorline

"设置缩进
set tabstop=4

"自动缩进
set autoindent

"显示标尺
set ruler

set nocp                    " 不设置 compatible
filetype plugin on          " 允许使用插件

""""""""""""""""""""""""""""""
" netrw setting
" """"""""""""""""""""""""""""
" absolute width of netrw window
let g:netrw_winsize = 28

" do not display info on the top of window
let g:netrw_banner = 0

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
let g:netrw_browse_split = 4

let g:netrw_alto = 1
let g:netrw_altv = 1


""""" 新建.c,.cpp,.cc,.h,.sh,.cpp,.cc,.py,.java文件，自动插入文件头 
"侦测文件类型
filetype on

autocmd BufNewFile *.cpp,.*.cc,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 

func SetTitle()
	if &filetype == 'sh' || &filetype == 'python'
			if &filetype == 'sh' 
				call setline(1, "\#!/bin/bash") 
			else
				call setline(1, "\#!/usr/bin/env python") 
			endif

			call append(line("."), "") 
			call append(line(".")+1,"\# File Name: ".expand("%")) 
			call append(line(".")+2, "\# Author: lei") 
			call append(line(".")+3, "\# Created Time: ".strftime("%F %T")) 
			call append(line(".")+4, "") 
			call append(line(".")+5, "") 
	endif

	if &filetype == "cpp" || &filetype == "c" || &filetype == "h" || &filetype == "java"
			call setline(1,"\// File Name: ".expand("%")) 
			call append(line("."), "\// Author: lei") 
			call append(line(".")+1, "\// Created Time: ".strftime("%F %T")) 
			call append(line(".")+2, "") 
			call append(line(".")+3, "") 
	endif
	
endfunc 

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
