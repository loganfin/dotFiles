let g:qwert = !g:qwert

if !qwert
    unmap <A-h>
    unmap <A-j>
    unmap <A-k>
    unmap <A-l>

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
else
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

    nnoremap <A-h> <C-W>h
    nnoremap <A-j> <C-W>j
    nnoremap <A-k> <C-W>k
    nnoremap <A-l> <C-W>l
endif
