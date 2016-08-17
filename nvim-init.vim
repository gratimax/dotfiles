call plug#begin('~/.vim/plugged')

" pretty colors
Plug 'chriskempson/base16-vim'
" Plug 'altercation/vim-colors-solarized'
Plug 'noah/vim256-color'

" pretty status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" pretty map
Plug 'severin-lemaignan/vim-minimap'

" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" show open buffers in command bar
Plug 'bling/vim-bufferline'

" ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" distraction-free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" clojure
Plug 'guns/vim-clojure-static'

call plug#end()

syntax on
filetype plugin indent on
set background=dark

" configure airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

set nowrap

let g:solarized_termcolors=256
colorscheme tomorrow-night
" colorscheme enhancements
hi clojureKeyword ctermfg=139
hi clojureSpecial ctermfg=139
" fix theme turning to light after entering distraction-free mode

function! s:goyo_enter()
    silent !tmux set status off
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    set background=dark
    colorscheme solarized
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" configure minimap
let g:minimap_highlight = 'visual'
