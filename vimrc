set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"

Bundle "Align"
Bundle "Valloric/YouCompleteMe"
Bundle "altercation/vim-colors-solarized"
Bundle "ecomba/vim-ruby-refactoring"
Bundle "jwhitley/vim-matchit"
Bundle "kana/vim-textobj-user"
Bundle "kchmck/vim-coffee-script"
Bundle "mileszs/ack.vim"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "scrooloose/syntastic"
Bundle "slim-template/vim-slim"
Bundle "tComment"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-surround"

Bundle 'Command-T'
let g:CommandTMaxHeight=20
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
nmap <Leader>ctf :CommandTFlush<CR>

set number
set ruler
syntax on

" use MacOS clipboard
set clipboard=unnamed

let mapleader=","

nmap <Leader>f :Ack<space>
nmap <leader>eg :tab drop $MYGVIMRC<CR>
nmap <leader>ep :tab drop ~/.profile<CR>
nmap <leader>ev :tab drop $MYVIMRC<CR>
nmap <leader>n :nohlsearch<CR>
nmap <leader>rn :exec &number==&relativenumber? "set number!" : "set relativenumber!"<CR>

" Use ENTER to save files and remind me, too
nmap <CR> :write<CR>
cabbrev w nope

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set nolist " do not show me white space at EOL

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,Procfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use solarized, fall back on desert
colo desert
colo solarized

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Show (partial) command in the status line
set showcmd

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

" disables automatic wrapping in text files
set textwidth=0

" faster colon
nnoremap <Space> :

" ignore for CMD-T plugin
set wildignore+=.*/**
set wildignore+=_*/**
set wildignore+=autotest
set wildignore+=bundeled/**
set wildignore+=coverage/**
set wildignore+=log
set wildignore+=solr
set wildignore+=tmp
set wildignore+=vendor

" Write with sudo (because I always forget using visudo)
command! Wsudo w !sudo tee % > /dev/null

" Allow saving with :W (typo)
command! W w
