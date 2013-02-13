" TODO
" http://vimcasts.org/episodes/tidying-whitespace/

source ~/.vim/bundles.vim " all plugins
source ~/.vim/global.vim
source ~/.vim/plugins.vim
source ~/.vim/macros.vim

if has('gui_running')
  source ~/.vim/gvimrc
end

" vimrc is loaded BEFORE the plugins
source ~/.vim/before.vim

:let $cur_project = '~/Dropbox/r/miel'   "current working derectory

Bundle "myusuf3/numbers.vim"
Bundle "mattn/pastebin-vim"
Bundle 'mattn/gist-vim'
"Bundle 'mikewest/vimroom'
Bundle "pangloss/vim-javascript"
Bundle "majutsushi/tagbar"
Bundle "kien/tabman.vim"
Bundle "vim-scripts/loremipsum"
Bundle "gorkunov/smartgf.vim"
Bundle "gorkunov/smartpairs.vim"
Bundle "kien/rainbow_parentheses.vim"
Bundle "skammer/vim-css-color"
Bundle "maksimr/vim-translator"
"Bundle 'Valloric/YouCompleteMe'

" after.vim is loaded from ./after/plugin/after.vim
" which should place it AFTER all the other plugins in the loading order
" bindings.vim and local.vim are loaded from after.vim

" set runtimepath=~/.vim,$VIMRUNTIME

" next 60 lines is part of nicklassos's config

set nocompatible " make vim settings nocompatible with vi
let molokai_original = 1
colorscheme molokai
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night
set t_Co=256
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoread
set smartcase " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch
set shiftround " drop unused spaces
"set wrap " перенос длинных строк
set lbr " переносить целые слова
set mousehide " скрывать мышь в режиме ввода текста
set encoding=utf-8
set nu " Номерация строк
"set visualbell "No sounds
set laststatus=2
set ignorecase " Игнорировать регистр букв при поиске
set guitablabel=%t " tab name
set nobackup " Отключаеd создание бэкапов
set noswapfile " Отключаем создание swap файлов
set clipboard=unnamedplus " Работать с буфером обмена сиситемы
" Убрать тулбары
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove right-hand scroll bar

filetype on
filetype plugin on
filetype indent on

let g:Powerline_symbols = 'fancy' " Powerline (makes neat status bar)
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
let g:Powerline_dividers_override = [[0x2b81], [0x2b81], '', [0x2b83]] " Overriding dividers
":set guifont=Terminus\ 12

" hide bold vertical line (line, which is part of dotvim from astrails) https://github.com/astrails/dotvim/issues/14
let g:indent_guides_enable_on_vim_startup = 0

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

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
"map <F2> :mksession! ~/vim_session <cr>
" And load session with F3
"map <F3> :source ~/vim_session <cr>

set sessionoptions+=resize,winpos,blank,buffers,curdir,folds,tabpages,winsize

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=55 columns=167
else
  " This is console Vim.
  if exists("+lines")
    set lines=55
  endif
  if exists("+columns")
    set columns=165
  endif
endif

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

if has('gui_running')
  if 0 == argc()
    :cd $cur_project
    autocmd VimLeave * call SaveSess()
    autocmd VimEnter * call RestoreSess()
  end
end
" Mappings for working with splits

" mapings from very very lazy man from there: http://vim.wikia.com/wiki/VimTip427 with my modifications

" Maps Alt-[h,j,k,l] to resizing a window split
:let resize_w = 20
:let resize_h = 5
map <silent> <A-h> :exe "vertical resize " . (winwidth(0) - resize_w)<CR>
map <silent> <A-j> :exe "resize " . (winheight(0) - resize_h)<CR>
map <silent> <A-k> :exe "resize " . (winheight(0) + resize_h)<CR>
map <silent> <A-l> :exe "vertical resize " . (winwidth(0) + resize_w)<CR>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

" tab navigation
nnoremap <C-T> :tabe<CR>
"nnoremap <S-h> gT
"nnoremap <S-l> gt

" half-page smooth-scrolling
:map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

nnoremap <F3> :NumbersToggle<CR>

let g:pastebin_api_dev_key = '8433a2d6cfbfb3977ee3339fcd481903'
let g:pastebin_private = '1'

nnoremap <leader>vr :VimroomToggle<cr>

let g:NERDTreeWinPos = 'right'

ino <silent> <c-r><tab> <c-r>=ShowAvailableSnips()<cr>

set wildignore+=*/tmp/*,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '.+\v\.(png|jpg|jpeg|gif)$',
  \ }

" ruler http://stackoverflow.com/a/3765575/1171144
if exists('+colorcolumn')
  set colorcolumn=81
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

if has('gui_running')
  " fuck that, because on start with saved session
  " it add yet anoter NERDTree window

  " autocmd VimEnter * call StartUp()
end

" http://vim.wikia.com/wiki/Search_all_files_in_project_quickly
map _u :call ID_search()<Bar>execute "/\\<" . g:word . "\\>"<CR>
map _n :n<Bar>execute "/\\<" . g:word . "\\>"<CR>

function! ID_search()
  let g:word = expand("<cword>")
  let x = system("lid --key=none ". g:word)
  let x = substitute(x, "\n", " ", "g")
  execute "next " . x
endfun

":nmap <C-a> ggVG"*yG<CR>
":nmap <C-a> ggVG<CR>
":nmap <C-a> :%y<CR>

" select all
noremap <c-a> ggVG

" http://vim.wikia.com/wiki/Open_PDF_files
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

set grepprg=ack
hi level13c ctermfg=darkgreen guifg=darkgreen

" from http://vimcasts.org/episodes/working-with-tabs/
" for linux and windows users (using the control key)
nnoremap <C-S-]> gt
nnoremap <C-S-[> gT
nnoremap <C-1> 1gt
nnoremap <C-2> 2gt
nnoremap <C-3> 3gt
nnoremap <C-4> 4gt
nnoremap <C-5> 5gt
nnoremap <C-6> 6gt
nnoremap <C-7> 7gt
nnoremap <C-8> 8gt
nnoremap <C-9> 9gt
nnoremap <C-0> :tablast<CR>

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
nnoremap <leader>w <C-w>v<C-w>l

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

:au FocusLost,BufLeave * silent! :update

nnoremap ; :
vnoremap ; :

inoremap kk <Esc>

" I can type :help on my own, thanks.
noremap <F1> <Esc>

" ****************** SCROLLING *********************  
set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=1       " Number of cols to scroll at a time

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

""maximize vim window
"com! MAX :let &lines=500<bar>let &columns=500
"map <leader>m :MAX<CR> move the cursor in insert mode

" move the cursor in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" Jump to start and end of line using the home row keys
nnoremap <c-h> ^
nnoremap <c-l> $

" Remove All the Trailing Whitespacesa (http://vimbits.com/bits/47)
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Only have cursorline in current window
"autocmd WinLeave * set nocursorline
"autocmd WinEnter * set cursorline

"augroup CursorLine
  "au!
  "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
   "this cause bug
  "au WinLeave * setlocal nocursorline
"augroup END


" Highlight word at cursor without changing position (http://vimbits.com/bits/19)
nnoremap <leader>h *<C-O>
" Highlight word at cursor and then Ack it.
nnoremap <leader>H *<C-O>:AckFromSearch!<CR>

" Avoiding trailing white-space in Ruby files
autocmd BufWritePre {*.rb,*.js,*.coffee,*.scss,*.haml} :%s/\s\+$//e

" Open help to the right or in new tab
cnoremap <expr> hr getcmdtype() == ':' && empty(getcmdline()) ? 'bo vert h ' : 'hr'
cnoremap <expr> ht getcmdtype() == ':' && empty(getcmdline()) ? 'tab h '     : 'ht'

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

" start gVim maximized? [not working]
"au GUIEnter * simalt ~x

nnoremap <leader>vs :source $MYVIMRC<CR>

" Plugins {
  " Taglist {
    nmap <F8> :TagbarToggle<CR>
    let g:tagbar_autoclose = 1
  " }

  " Session List {
    " does not working :-(
    nmap <leader>sl :SessionList<CR> 
    nmap <leader>ss :SessionSave<CR>
  " }

  " Rainbow parentheses {
    nnoremap <leader>r :RainbowParenthesesToggle<CR>
  " }

  " nerd tree {
    let g:NERDTreeQuitOnOpen = 1
  " }
" }

cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Make Y behave like other capitals
nnoremap Y y$

" split right or below
set splitright
set splitbelow

" http://goo.gl/Upx7U
noremap <silent> <F4> :let @+=expand("%:p")<CR>

"function! ToggleFullScreen()
  "call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
  "redraw
"endfunction

"map <M-F> :call ToggleFullScreen()<CR>
"imap <M-F> <C-O> :call ToggleFullScreen()<CR>
"map <M-F3> :call ToggleFullScreen()<CR>
"imap <M-F3> <C-O> :call ToggleFullScreen()<CR>

au BufWritePre *.coffee checktime
