" Required
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
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides' "Indent Guide <Leader>ig to enable, <Leader> = '\'
Plugin 'haya14busa/incsearch.vim'
Plugin 'oplatek/Conque-Shell'
"Plugin 'davidhalter/jedi-vim'

" PLUGIN END


" VUNDLE END
call vundle#end()            " required
filetype plugin indent on    " required
" VUNDLE END

" Syntax
syntax on
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
set foldmethod=indent
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

" Colorscheme
colorscheme molokai
let g:molokai_original = 1

" Buffer maps
map gn :bn<cr>
map gp :bp<cr>
map gd :bp\|bd #<cr>  

" Matching Parenthesis
hi MatchParen cterm=underline ctermbg=none ctermfg=none

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"Jedi Config
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"
autocmd FileType python setlocal completeopt-=preview


" experimental transparent shit
hi Normal ctermbg=none
hi StatusLineNC cterm=none ctermbg=none


" CONQUE TERM
cabbrev csh ConqueTerm bash 
