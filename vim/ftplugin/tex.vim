" LaTex setup

" The guide will be <++> or <+++>

" Gets relative path
function! RelPath()
    return expand('%')
endfunction

" Gets head of filename
function! Head()
    return expand('%:.:h')
endfunction

" Creates bin directory
    function! Bin()
        let s:bin_path = Head() . '/bin'
        if !isdirectory(s:bin_path)
            call mkdir(s:bin_path)
        endif
    endfunction

" Automatically creates bin directory at startup
" autocmd VimEnter *.tex call Bin()

" Shortcuts for compiling and previewing Latex code
    nnoremap <leader>c :<C-u> w <bar> call Bin() <bar> ! pdflatex -output-directory="bin" -synctex=1 -interaction=nonstopmode %:p <cr><cr>
" Compiling with xelatex instead of pdflatex
"    nnoremap <leader>x :<C-u> w <bar> ! xelatex -output-directory="bin" %:p <cr><cr>
" nnoremap <leader>p :<C-u>! zathura bin/%:p:r.pdf & disown<cr><cr>
    nnoremap <leader>p :<C-u>! zathura bin/%:.:r.pdf & disown<cr><cr>
" Compiling bibliography
    nnoremap <leader>b :<C-u>! biber --output-directory=bin %:.:r<cr><cr>

" Global variables {{{

    let g:tex_flavor='latex'

" }}}

