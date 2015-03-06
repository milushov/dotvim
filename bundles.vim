set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tommcdo/vim-exchange'
Bundle 'tpope/vim-unimpaired'
"Bundle 'AutoComplPop' make vim sooo slow
"Bundle 'taglist.vim'
"Bundle 'YankRing.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-align'
Bundle 'mileszs/ack.vim'
Bundle 'austintaylor/vim-indentobject'
Bundle 'greplace.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'sjl/splice.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
Bundle 'tpope/vim-endwise'
Bundle 'Raimondi/delimitMate'
Bundle 'calendar.vim--Matsumoto'
Bundle 'chrisbra/NrrwRgn'
Bundle 'utl.vim'
Bundle 'hsitz/VimOrganizer'
Bundle 'sjl/gundo.vim'
Bundle 'AndrewRadev/switch.vim'

" Ruby/Rails
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'apidock.vim'

" color themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'

" syntax support
Bundle 'vim-ruby/vim-ruby'
Bundle 'tsaleh/vim-tmux'
Bundle 'Puppet-Syntax-Highlighting'
"Bundle 'JSON.vim'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vitaly/vim-syntastic-coffee'
Bundle 'vim-scripts/jade.vim'
Bundle 'wavded/vim-stylus'
Bundle 'VimClojure'
"Bundle 'slim-template/vim-slim'
Bundle 'groenewege/vim-less'

" Support and minor
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-repeat'
"add to existing wildignore instead of overwriting it
"Bundle 'taasaa/vim-gitignore'
Bundle 'scrooloose/vim-space'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'

"Bundle 'ShowMarks'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'reinh/vim-makegreen'

"Bundle 'skammer/vim-css-color'
"Bundle 'hail2u/vim-css3-syntax'