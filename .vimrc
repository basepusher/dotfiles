set shell=/bin/bash
"Required
set nocompatible
filetype off
" Required

" VUNDLE START
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" VUNDLE START

" PLUGIN START
"Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'haya14busa/incsearch.vim'
Plugin 'oplatek/Conque-Shell'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
" PLUGIN END


" VUNDLE END
call vundle#end()            " required
filetype plugin indent on    " required
" VUNDLE END

" Syntax
syntax on
" clipboard
"set clipboard=unnamed
" Welcome Message off
set shortmess+=I
" show wildmenu
set wildmenu
" show intermediate commands
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set foldmethod=manual
set nofoldenable
" Line Number
set number
"Disable Swap
set noswapfile
" Reset highlight
nnoremap <C-L> :nohl<CR><C-L>

set autoindent
set nostartofline

"Paste
set pastetoggle=<F2>

" Colors
set t_Co=256
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Colorscheme
colorscheme molokai
let g:molokai_original = 1

" Buffer maps
map gn :bn<cr>
map gp :bp<cr>
map gd :bp\|bd #<cr>  

" Matching Parenthesis
hi MatchParen cterm=underline ctermbg=none ctermfg=none


" SUPERTAB
"let g:SuperTabDefaultCompletionType = "<c-n>"

" go plugins
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" experimental transparent
hi Normal ctermbg=none
hi StatusLineNC cterm=none ctermbg=none

" CONQUE TERM
cabbrev csh ConqueTerm bash 

" BACKSPACE
set backspace=start,eol,indent

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 


