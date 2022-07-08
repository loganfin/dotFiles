call plug#begin()

" required by some plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'rmehri01/onenord.nvim'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'akinsho/toggleterm.nvim', tag = 'v1.0'
Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'}

call plug#end()

lua require "user"

nnoremap <space> <Nop>
let mapleader = " "

let g:qwert = 1

nnoremap <silent><leader>co :lua require('cmp').setup.buffer {enabled = true}<CR>:echom "completion on"<CR>
nnoremap <silent><leader>cf :lua require('cmp').setup.buffer {enabled = false}<CR>:echom "completion off"<CR>
nnoremap <silent><leader>qm :call ChangeLayout()<CR>
nnoremap <silent><leader>e :30Lex<CR>
"nnoremap <silent>qq :vs $MYVIMRC<CR>/let g:qwert = <CR>wwr1:wq<CR>:so ~/.config/nvim/qwertoggle.vim<CR>:echom "qwerty toggled"<CR>:echom "qwerty toggled"<CR>
"nnoremap <silent>qc :vs $MYVIMRC<CR>/qwert<CR>wwr0:wq<CR>:so ~/.config/nvim/qwertoggle.vim<CR>:echom "colemak toggled"<CR>:echom "colemak toggled"<CR>

nnoremap <A-=> <C-W>=
nnoremap <A-z> <C-W><bar><C-W>_

nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l

if !qwert
"nnoremap <A-M> <C-W>h
"nnoremap <A-N> <C-W><C-J>
"nnoremap <A-E> <C-W><C-K>
"nnoremap <A-I> <C-W><C-L>

unmap <A-h>
unmap <A-j>
    unmap <A-k>
    unmap <A-l>
    nnoremap <A-m> <C-W>h
    nnoremap <A-n> <C-W>j
    nnoremap <A-e> <C-W>k
    nnoremap <A-i> <C-W>l

    noremap m h
    noremap n j
    noremap e k
    noremap i l

    noremap s i
    noremap S I

    noremap k n
    noremap K N

    noremap l ^
    noremap L $
    " retains di) functionality; becomes dr)
    onoremap r i

    noremap j e
    noremap J E

    noremap h m
    noremap H M

endif

if exists('g:vscode')
    set noshowmode!
    set shiftwidth = 8
else
    set noshowmode
endif

function! ChangeLayout() abort
    let g:qwert = !g:qwert
    if !g:qwert
        if !empty(maparg("<A-h>", 'n'))
            unmap <A-h>
            unmap <A-j>
            unmap <A-k>
            unmap <A-l>
        endif

        noremap m h
        noremap n j
        noremap e k
        noremap i l

        noremap s i
        noremap S I

        noremap k n
        noremap K N

        noremap l ^
        noremap L $

        onoremap r i

        noremap j e
        noremap J E

        noremap h m
        noremap H M

        nnoremap <A-m> <C-W>h
        nnoremap <A-n> <C-W>j
        nnoremap <A-e> <C-W>k
        nnoremap <A-i> <C-W>l

        echom "colemake maps enabled"
    else
        if !empty(maparg("<A-m>", 'n'))
            unmap <A-m>
            unmap <A-n>
            unmap <A-e>
            unmap <A-i>

            unmap m
            unmap n
            unmap e
            unmap i

            unmap s
            unmap S

            unmap k
            unmap K

            unmap l
            unmap L

            unmap r

            unmap j
            unmap J

            unmap h
            unmap H
        endif
        nnoremap <A-h> <C-W>h
        nnoremap <A-j> <C-W>j
        nnoremap <A-k> <C-W>k
        nnoremap <A-l> <C-W>l

        echom "qwerty maps enabled"
    endif
endfunction

" include ~/.vimrc configuration
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
