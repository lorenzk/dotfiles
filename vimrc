set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','

if !isdirectory(expand('~/.vim/bundle/vundle'))
  !mkdir -p ~/.vim/bundle
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  let s:bootstrap=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Align'
Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ctrlp.vim'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'jwhitley/vim-matchit'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'lparry/vim-iterm-rspec'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'rizzatti/funcoo.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tComment'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

Bundle 'The-NERD-tree'
map <F2> :NERDTreeToggle<CR>

Bundle 'rizzatti/dash.vim'
let g:dash_map = { 'ruby': 'rails' }
:nmap <silent> <leader>d <Plug>DashSearch

Bundle 'tpope/vim-dispatch'
nnoremap <F9> :Dispatch<CR>
autocmd FileType ruby let b:dispatch = "ssh epic@epic-localvm 'cd source && SPRING_TMP_PATH=/tmp spring rspec %'"

if exists('s:bootstrap') && s:bootstrap
  unlet s:bootstrap
  BundleInstall
endif

set number
set ruler
syntax on

" use MacOS clipboard
set clipboard=unnamed

nmap <Leader>f :Ack<space>
nmap <leader>eg :e $MYGVIMRC<CR>
nmap <leader>ep :e ~/.profile<CR>
nmap <leader>et :e ~/Dropbox/todo.txt<CR>
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>n :nohlsearch<CR>
nmap <leader>rn :exec &number==&relativenumber? 'set number!' : 'set relativenumber!'<CR>

" use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use ENTER to save files
nmap <CR> :write<CR>

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.png,*.jpg,*.gif,build,*.min.js

" Status bar
set laststatus=2

" Remember last location in file
if has('autocmd')
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
endif

if has('autocmd') && exists('+omnifunc') 
  autocmd Filetype * 
        \	if &omnifunc == '' | 
        \	 setlocal omnifunc=syntaxcomplete#Complete | 
        \	endif 
endif 

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,Procfile,Capfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{thor,sinew} set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use solarized, fall back on desert
colo desert
colo solarized

" Directories for swp files
if !isdirectory(expand('~/.vim/backup'))
  !mkdir -p ~/.vim/backup
endif
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Show (partial) command in the status line
set showcmd

if has('gui_running')
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
set wildignore+=tmp

" Write with sudo (because I always forget using visudo)
command! Wsudo w !sudo tee % > /dev/null

" Allow saving with :W (typo)
command! W w

" new splits should be on the right
set splitright

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
