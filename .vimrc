"  ____        _             _       ____        _       
" |  _ \ _   _| | _____  ___( )___  |  _ \  ___ | |_ ___ 
" | |_) | | | | |/ / _ \/ _ \// __| | | | |/ _ \| __/ __|
" |  __/| |_| |   <  __/  __/ \__ \ | |_| | (_) | |_\__ \
" |_|    \__, |_|\_\___|\___| |___/ |____/ \___/ \__|___/
"        |___/                                           

" Why would you not?
syntax on

" Sane Defaults
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" Plug Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/NERDTree'
Plug 'ycm-core/YouCompleteMe'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'hugolgst/vimsence'

call plug#end()

colorscheme gruvbox
set background=dark

" Open NERDTree when just vim is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Add Typescript Syntastic Checking
let g:syntastic_typescript_checkers = [ 'eslint' ]
