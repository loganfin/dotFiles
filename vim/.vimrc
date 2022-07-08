set nocompatible
filetype off

if !has('nvim')
    call plug#begin()
    Plug 'https://github.com/gruvbox-community/gruvbox'

    "Plug 'sonph/onehalf'

    Plug 'https://github.com/sainnhe/gruvbox-material'

    Plug 'https://github.com/sheerun/vim-polyglot'

    Plug 'https://github.com/vim-airline/vim-airline'

    Plug 'https://github.com/vim-airline/vim-airline-themes'

    call plug#end()
endif

filetype plugin indent on
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4

"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
set wmh=0
set splitbelow
set splitright

set nohlsearch
set signcolumn=yes
syntax on
set nu
set relativenumber
set nowrap
set incsearch
set noswapfile
set visualbell
set t_vb=
set scrolloff=1
set sidescroll=1
set sidescrolloff=8
" set signcolumn=yes
set showcmd
set mouse=a " enables mouse scrolling

set guicursor=i:block " for neovim insert mode block cursor
set background=dark
set t_Co=256
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi SignColumn ctermbg=none
" hi Comment gui=NONE cterm=NONE
" hi Normal guibg=NONE ctermbg=NONE

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
" let g:airline_powerline_fonts = 1

" switch to your current theme
let g:airline_theme = 'gruvbox'

set showtabline=2

" we don't need to see things like -- INSERT -- anymore
set noshowmode

"highlight OverLength ctermbg=red ctermfg=white guibg=#FFD9D9
"2match OverLength /\%81v.\+/

highlight ExtraWhitespace ctermbg=240 guibg=#FFD9D9
match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
