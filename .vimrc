set shell=/bin/bash
"Required
set nocompatible
filetype off
" Required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


"Plug 'flazz/vim-colorschemes'
"Plug 'scrooloose/syntastic'
"Plug 'chrisbra/csv.vim'
"Plug 'nathanaelkane/vim-indent-guides' "Indent Guide <Leader>ig to enable, <Leader> = '\'
"Plug 'davidhalter/jedi-vim'
"Plug 'rust-lang/rust.vim'
Plug 'tomasr/molokai'
Plug 'haya14busa/incsearch.vim'
"Plug 'oplatek/Conque-Shell'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'



" Initialize plugin system
call plug#end()

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
" Undo file
set undodir=~/.vim/undo-dir
set undofile
" Reset highlight
nnoremap <C-L> :nohl<CR><C-L>

set autoindent
set nostartofline
"Paste
set pastetoggle=<F2>
" Colors
set t_Co=256
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"set tabstop=8
set shiftwidth=4
set expandtab
set smarttab

" Colorscheme
colorscheme molokai
let g:molokai_original = 1

" Buffer maps
map gn :bn<cr>
map gp :bp<cr>
map gd :bp\|bd #<cr>

" Matching Parenthesis
hi MatchParen cterm=underline ctermbg=none ctermfg=none


"Jedi Config
"let g:jedi#popup_on_dot = 0
"let g:jedi#use_splits_not_buffers="bottom"
"let g:jedi#show_call_signatures = "0"
"autocmd FileType python setlocal completeopt-=preview


" SUPERTAB
"let g:SuperTabDefaultCompletionType = "<c-n>"

" go plugins
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

set autowrite
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)


" experimental transparent
hi Normal ctermbg=none
hi StatusLineNC cterm=none ctermbg=none

" CONQUE TERM
"cabbrev csh ConqueTerm bash

" BACKSPACE
set backspace=start,eol,indent

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
