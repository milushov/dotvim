source ~/.vim/bundles.vim " list of all plugins
source ~/.vim/global.vim " global stuff as nocompatible, syntax on
source ~/.vim/plugins.vim " settings for plugins
source ~/.vim/macros.vim

if has('gui_running')
  source ~/.vim/gvimrc
end

" vimrc is loaded BEFORE the plugins
source ~/.vim/before.vim

:let $cur_project = '~/work/inmyroom/'   "current working derectory

let g:enable_numbers = 0
Bundle "myusuf3/numbers.vim"

Bundle "mattn/pastebin-vim"
Bundle 'mattn/gist-vim'
"Bundle 'mikewest/vimroom'
Bundle "pangloss/vim-javascript"
"Bundle 'majutsushi/tagbar'


"Bundle "kien/tabman.vim"
"Bundle "vim-scripts/loremipsum"
"Bundle "gorkunov/smartgf.vim"
Bundle "gorkunov/smartpairs.vim"
"Bundle "kien/rainbow_parentheses.vim"
"Bundle "skammer/vim-css-color"
Bundle "noahfrederick/Hemisu"
Bundle "maksimr/vim-translator"
Bundle 'flazz/vim-colorschemes'
Bundle 'noahfrederick/Hemisu'
"Bundle 'powerman/vim-plugin-ruscmd'
Bundle 'flazz/vim-colorschemes'

colorscheme molokai
":set background=light
"let molokai_original = 1
"let g:rehash256 = 1

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
set clipboard=unnamed " Работать с буфером обмена сиситемы
" Убрать тулбары
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove right-hand scroll bar

filetype on
filetype plugin on
filetype indent on

set guifont=Menlo\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy' " Powerline (makes neat status bar)

" hide bold vertical line (line, which is part of dotvim from astrails) https://github.com/astrails/dotvim/issues/14
let g:indent_guides_enable_on_vim_startup = 1
set ts=2 sw=2 et

nmap <leader>v :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

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
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" http://vim.wikia.com/wiki/Drag_words_with_Ctrl-left/right
:vmap <C-l> xpgvlolo
:vmap <C-h> xhPgvhoho

" enable unselecting of searchig results by press space key two times or escape key
"map <SPACE> <SPACE>:noh<CR>
nnoremap <esc> :noh<return><esc>

map <C-s> :w

" saving by press Ctrl+S
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>


fu! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'source ' . getcwd() . '/.session.vim'
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
    "autocmd VimLeave * call SaveSess()
    "autocmd VimEnter * call RestoreSess()
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
map <silent> <M-s> :split<CR>
map <silent> <M-v> :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

" half-page smooth-scrolling
:map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

nnoremap <F3> :NumbersToggle<CR>

let g:pastebin_api_dev_key = '8433a2d6cfbfb3977ee3339fcd481903'
let g:pastebin_private = '1'

nnoremap <leader>vr :VimroomToggle<cr>

let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 50

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


" select all
noremap <c-a> ggVG

" http://vim.wikia.com/wiki/Open_PDF_files
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

set grepprg=ack
hi level13c ctermfg=darkgreen guifg=darkgreen

" from http://vimcasts.org/episodes/working-with-tabs/
" For mac users (using the 'apple' key)
"map <D-S-]> gt
"map <D-S-[> gT
"map <D-1> 1gt
"map <D-2> 2gt
"map <D-3> 3gt
"map <D-4> 4gt
"map <D-5> 5gt
"map <D-6> 6gt
"map <D-7> 7gt
"map <D-8> 8gt
"map <D-9> 9gt
"map <D-0> :tablast<CR>


" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
nnoremap <leader>w <C-w>v<C-w>l

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

:au FocusLost,BufLeave * silent! :update

nnoremap ; :
vnoremap ; :
cnoremap ; :

inoremap kk <Esc>

" I can type :help on my own, thanks.
noremap <F1> <Esc>

" ****************** SCROLLING *********************  
set scrolloff=20        " Number of lines from vertical edge to start scrolling
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

let g:NERDTreeQuitOnOpen = 1

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

" for ctrl-vk
au BufWritePre *.coffee checktime

" Move tabs with alt + left|right
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

Bundle 'nelstrom/vim-visual-star-search'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>e'


" next few lines taken from here https://github.com/freshtonic/dotfiles/blob/master/vimrc

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

Bundle 'airblade/vim-gitgutter'
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
vmap <silent> u <esc>:Gdiff<cr>gv:diffget<cr><c-w><c-w>ZZ


Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1


Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-expand-region'

set wildignore+=*/tmp/*,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '.+\v\.(png|jpg|jpeg|gif)$',
  \ }

let g:ctrlp_mruf_exclude = '/tmp/.*'
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 40

Bundle 'tacahiroy/ctrlp-funky'
nnoremap <leader>f :CtrlPFunky<Cr> 
"nnoremap <Space>fU :execute 'CtrlPFunky '.expand('<cword>')<Cr>

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc


" https://gist.github.com/andyfowler/1195581#comment-816251
"Bundle 'sjl/vitality.vim'

Bundle 'milkypostman/vim-togglelist'

filetype on
filetype plugin on
filetype indent on
syntax on

let g:gist_clip_command = 'pbcopy'

":set &t_Co=256
"Bundle 'rking/vim-detailed'
"colo detailed
autocmd BufReadPost * call SetCursorPosition()

function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

set foldcolumn=4

" Folding - http://vim.wikia.com/wiki/Folding {{{1
" Customized version of folded text, idea by
" http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines ')
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (lines_count*1.0)/lineCount*100) . "%] "
  let foldtextend = lines_count_text . foldPercentage . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
"}}}
set foldtext=NeatFoldText()

function! MarkdownFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^##') >= 0
    return ">2"
  elseif match(thisline, '^#') >= 0
    return ">1"
  else
    return "="
  endif
endfunction

" markdown folding {{{3
function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownFolds()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.md setlocal foldtext=MarkdownFoldText()
au BufEnter *.md setlocal syntax=markdown
" }}}

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Marker only vim files
:autocmd FileType vim setlocal fdm=marker
:autocmd FileType coffee setlocal fdm=indent
:autocmd FileType haml setlocal fdm=indent

nnoremap <Space> za
"}}}
Bundle 'rking/ag.vim'
Bundle 'Floobits/floobits-vim'
"Bundle 'rorymckinley/vim-rubyhash'  не работает на максини 
noremap <silent> <F4> :let @+ = expand("%")<CR> "http://goo.gl/W5wFy
Bundle 'moll/vim-bbye'

" 'quote' a word
"nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
"nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
"nnoremap wq :silent! normal mpeld bhd `ph<CR>
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
:nmap <silent> <leader>d <Plug>DashSearch

let g:ruby_path=$RUBY_BIN

" GREAT! make shorcuts   sj ,  sk
Bundle 'AndrewRadev/splitjoin.vim'
highlight NonText guifg=bg

" http://stackoverflow.com/questions/11993851/how-to-delete-not-cut
"nnoremap d "_d
"vnoremap d "_d

"set wrap

"Bundle 'onemanstartup/vim-flog'
"silent exe 'g:flog_enable'
"Bundle 'rainerborene/vim-reek'

"let coffee_lint_options = '-f ~/.coffeelint_config.json'

set cursorline

" Great! - to toggle some definitions
Bundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

set relativenumber
set number
"}}}
" 21 executing external commands{{{
" TODO: Check for usefullness of zsh in vim
" set sh=/usr/local/bin/zsh
"}}}
" 22 running make and jumping to errors
" 23 language specific{{{
" Russian is specific
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"}}}
