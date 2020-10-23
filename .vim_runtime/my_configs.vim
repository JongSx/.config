" Show line number
set number
" Show hidden file when open NERDTree
let NERDTreeShowHidden=1

set nocompatible
filetype off

set runtimepath+=~/.vim_runtime/my_plugins/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'vundlevim/vundle.vim'
" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
