source ~/.vim/bundles.vim
source ~/.vim/global.vim
source ~/.vim/plugins.vim
source ~/.vim/macros.vim
if has('gui_running')
  source ~/.vim/gvimrc
end

" vimrc is loaded BEFORE the plugins
source ~/.vim/before.vim

" after.vim is loaded from ./after/plugin/after.vim
" which should place it AFTER all the other plugins in the loading order
" bindings.vim and local.vim are loaded from after.vim

" set runtimepath=~/.vim,$VIMRUNTIME

" make vim settings nocompatible with vi
set nocompatible

" color
let molokai_original = 1
colorscheme molokai

set t_Co=256

set autoindent
set smartindent
set smarttab

""" Размер табулации по умолчанию """

set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

filetype on
filetype plugin on
filetype indent on
set encoding=utf-8

filetype on
filetype plugin on

set wrap " перенос длинных строк
set lbr " переносить целые слова
set mousehide " скрывать мышь в режиме ввода текста"

" Powerline (makes neat status bar)
set laststatus=2
let g:Powerline_symbols = 'fancy'
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
":set guifont=Terminus\ 12

" Overriding dividers
" let g:Powerline_dividers_override = [[0x2b81], [0x2b81], '', [0x2b83]]


" Игнорировать регистр букв при поиске
set ignorecase

" tab name
set guitablabel=%t 

" Отключаеd создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile

" Работать с буфером обмена сиситемы
set clipboard=unnamedplus

" Убрать тулбары
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove right-hand scroll bar

" Номерация строк
set nu

set visualbell "No sounds

filetype on
filetype plugin on
filetype indent on

map <SPACE> <SPACE>:noh<CR>

" убираем вертикальную толстую линию https://github.com/astrails/dotvim/issues/14
let g:indent_guides_enable_on_vim_startup = 0

" trying to install vim-snipmate plugin (full)
"Install dependencies:
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "honza/snipmate-snippets"

"Install:
"Bundle "garbas/vim-snipmate"

"And :BundleInstall

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>