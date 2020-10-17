set nocompatible

" --- Helps force plugins to load correctly when it is turned back on below ---
filetype off

" --- Load plugins ---
call functions#PlugLoad()

" --- Plugins configuration ---
call plug#begin('$XDG_DATA_HOME/nvim/plugged')

Plug 'ayu-theme/ayu-vim' 

call plug#end()

" --- Set colorscheme ---
colorscheme ayu
let ayucolor="dark"

" --- Enable true colors support ---
set termguicolors     

" --- Turn on syntax highlighting ---
syntax on

" --- For plugins to load correctly ---
filetype plugin indent on

" --- Security ---
set modelines=0

" --- Show line numbers ---
set number
set relativenumber

" --- Show file stats ---
set ruler

" --- Encoding ---
set encoding=utf-8

" --- Whitespace ---
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" --- Cursor motion ---
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" --- Move up/down editor lines ---
nnoremap j gj
nnoremap k gk

" --- Allow hidden buffers ---
set hidden

" --- Rendering ---
set ttyfast

" --- Status bar ---
set laststatus=2

" --- Last line ---
set showmode
set showcmd

" --- Searching ---
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" --- Remap help key ---
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" --- Textmate holdouts ---

" --- Formatting ---
map <leader>q gqip

" --- Visualize tabs and newlines ---
set listchars=tab:▸\ ,eol:¬

" --- Toggle tabs and EOL ---
map <leader>l :set list!<CR>
