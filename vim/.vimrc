" To toggle folds, enter za in normal mode

let mapleader=" "

" Plugins (using 'plugged') {{{
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'sirver/ultisnips'
Plug 'vim-scripts/delimitMate.vim'
call plug#end()
" }}}

" Some basics
    set mouse=a " use mouse everywhere
    set nocompatible " drop Vi compatibility
    set laststatus=2 " always show status line
    set encoding=utf-8 " set encoding
    set wrap " lines continue on the next line
    set showmatch " shows matching brackets
    filetype on " detect filetype
    filetype plugin on " load filetype specific plugins
    syntax on " syntax highlighting on
    colorscheme pablo

" Set tab length
    set tabstop=4 " tab length
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set smarttab
    set shiftround

" Splits open at the the bottom and on the right
    set splitright splitbelow

" All folds are closed upon entering a file
    set foldlevelstart=0

" Disables automatic commenting on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespaces on save
    autocmd BufWritePre * :%s/\s\+$//e

" Indentation
    set autoindent
    " set smartindent
    " set cindent
    filetype indent on " load filetype indentation

" {{{ Jumping over closed brackets and the like
" Determines whether it should jump delimiters or just enter a tab and does it
    function! JumpAny()
        if delimitMate#ShouldJump() ==? 0
            return "\<Tab>\<Tab>"
        else
            return delimitMate#JumpAny()
        endif
    endfunction

" Jumps over closed brackets and the like
    inoremap <expr> <c-j> JumpAny()

" Filetype specific settings
    au FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
" }}}

" Vimscript file settings {{{
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
" }}}

" NERDTree {{{
" NERDTree Toggle shortcut remap
    nnoremap <F5> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('py', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" }}}

" remapping keys for general use
    :nnoremap j <Left>
    :nnoremap m <Down>
    :nnoremap h <Nop>
    :vnoremap j <Left>
    :vnoremap m <Down>
    :vnoremap h <Nop>
    :noremap <Left> <Nop>
    :noremap <Right> <Nop>
    :noremap <Up> <Nop>
    :noremap <Down> <Nop>
    :inoremap <Left> <Nop>
    :inoremap <Right> <Nop>
    :inoremap <Up> <Nop>
    :inoremap <Down> <Nop>

" shortcut for opening ~/.vimrc file
    :nnoremap <leader>ev :<C-u>split $MYVIMRC<cr>

" {{{UltiSnips trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

" Where to look for snippets
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" }}}
