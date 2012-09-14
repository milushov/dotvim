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

" next 60 lines is part of nicklassos's config

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
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
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

" hide bold vertical line (line, which is part of dotvim from astrails) https://github.com/astrails/dotvim/issues/14
let g:indent_guides_enable_on_vim_startup = 0

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" enabling indicate switching to insert mode
" http://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode/6489348#6489348
:autocmd InsertEnter,InsertLeave * set cul!

" enabling moving line up or down
nnoremap <C-k> mz:m-2<CR>`z==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
nnoremap <C-j> mz:m+<CR>`z==
vnoremap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" http://vim.wikia.com/wiki/Drag_words_with_Ctrl-left/right
:vmap <C-l> xpgvlolo
:vmap <C-h> xhPgvhoho

" enable unselecting of searchig results by press space key two times or escape key
map <SPACE> <SPACE>:noh<CR>
nnoremap <esc> :noh<return><esc>

map <C-s> :w

" saving by press Ctrl+S
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Global session
" Quick write session with F2
map <F2> :mksession! ~/vim_session <cr>
" And load session with F3
map <F3> :source ~/vim_session <cr>

set sessionoptions+=resize,winpos

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=42 columns=123
else
  " This is console Vim.
  if exists("+lines")
    set lines=42
  endif
  if exists("+columns")
    set columns=123
  endif
endif


:cd ~/Dropbox/r/playlists/                        "current working derectory

fu! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
  execute 'so ' . getcwd() . '/.session.vim'
  if bufexists(1)
    for l in range(1, bufnr('$'))
      if bufwinnr(l) == -1
        exec 'sbuffer ' . l
      endif
    endfor
  endif
endif
syntax on
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()

" Mappings for working with splits

" mapings from very very lazy man from there: http://vim.wikia.com/wiki/VimTip427 with my modifications

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> :exe "vertical resize " . (winwidth(0) - 3)<CR>
map <silent> <A-j> :exe "resize " . (winheight(0) - 3)<CR>
map <silent> <A-k> :exe "resize " . (winheight(0) + 3)<CR>
map <silent> <A-l> :exe "vertical resize " . (winwidth(0) + 3)<CR>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

" tab navigation
nnoremap <S-h> gT
nnoremap <S-l> gt