set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','

if filereadable("~/.config/nvim/autoload/plug.vim")
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

source ~/.config/nvim/autoload/plug.vim
call plug#begin('~/.config/nvim/plugged')

"Plug 'Valloric/YouCompleteMe'
Plug 'Align'
Plug 'altercation/vim-colors-solarized'
Plug 'elmcast/elm-vim'
Plug 'jwhitley/vim-matchit'             " use '%' to move to opposite match
Plug 'kana/vim-textobj-user'            " dependency for vim-textobj-rubyblock
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'nelstrom/vim-textobj-rubyblock'   " use 'var' to mark ruby block
Plug 'ngmy/vim-rubocop'
Plug 'slim-template/vim-slim'
Plug 'tomtom/tcomment_vim'              " use 'gc' to comment out code
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'                " inserts 'end' in ruby
Plug 'tpope/vim-fugitive'               " git
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wavded/vim-stylus'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

Plug 'Tabular'
" Helper for aligning table-like array as I use in Sequel-based tests.
function! AlignTable()
  '<,'>Tabularize /,
  '<,'>Tabularize /[
  '<,'>Tabularize /]
endfunction
vnoremap <leader>a :call AlignTable()<cr>
nnoremap <leader>A Vi(:call AlignTable()<cr>

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
map <C-F> :Ack!<space>
vnoremap <C-F> y:Ack! <C-r>=fnameescape(@")<CR>

Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plug 'rizzatti/dash.vim'
let g:dash_map = { 'ruby': 'rails' }
:nmap <silent> <leader>d <Plug>DashSearch

Plug 'janko-m/vim-test'
let g:neoterm_size=10
let test#strategy = "neoterm"
let test#ruby#minitest#executable = 'rake test'
let test#ruby#rspec#executable = 'bundle exec rspec'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake
let g:vimrubocop_extra_args='-D'

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

call plug#end()

set number
set ruler
syntax on

" use MacOS clipboard
set clipboard=unnamed

nmap <Leader>f :NERDTreeFind<CR>
nmap <leader>ep :e ~/.profile<CR>
nmap <leader>et :e ~/Dropbox/todo.txt<CR>
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>n :nohlsearch<CR>
nmap <leader>cn :cn<CR>

" Use ENTER to save files
nmap <CR> :write<CR>

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=nbsp:•,tab:\ \ ,extends:»,precedes:«,trail:·

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
  autocmd filetype crontab setlocal nobackup nowritebackup
endif

if has('autocmd') && exists('+omnifunc') 
  autocmd Filetype * 
        \	if &omnifunc == '' | 
        \	 setlocal omnifunc=syntaxcomplete#Complete | 
        \	endif 
endif 

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,Capfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{thor,sinew,jbuilder} set ft=ruby
au BufRead,BufNewFile *.slim set ft=slim
au BufRead,BufNewFile *.es6 set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use solarized, fall back on desert
colo desert
colo solarized
set bg=light

" Show (partial) command in the status line
set showcmd

" disables automatic wrapping in text files
set textwidth=0

" faster colon
nnoremap <Space> :

" ignore for ctrlp
set wildignore+=.*/**
set wildignore+=_*/**
set wildignore+=.Plug
set wildignore+=autotest
set wildignore+=bundeled/**
set wildignore+=Plug
set wildignore+=coverage/**
set wildignore+=js-build/**
set wildignore+=log
set wildignore+=node_modules
set wildignore+=tmp
let g:ctrlp_user_command = ['.git', 'cd %s; and git ls-files -co --exclude-standard']

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

" Jump to next keyword with K
autocmd FileType vim setlocal keywordprg=:help nojoinspaces
autocmd FileType help setlocal keywordprg=:help nojoinspaces

set undofile            " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000     " How many undos
set undoreload=10000    " number of lines to save for undo

" Terminal
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
