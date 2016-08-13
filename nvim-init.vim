call plug#begin('~/.vim/plugged')

" pretty colors
Plug 'chriskempson/base16-vim'

" pretty status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git support
Plug 'tpope/vim-fugitive'

" show open buffers in command bar
Plug 'bling/vim-bufferline'

call plug#end()

if filereadable(expand('~/.vimrc_background'))
  " configure base16
  let base16colorspace=256 " Access colors present in 256 colorspace
  source ~/.vimrc_background
endif

set background=dark
" set encoding=utf-8



" configure airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'

