set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=','

if filereadable("~/.config/nvim/autoload/plug.vim")
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

source ~/.config/nvim/autoload/plug.vim
call plug#begin('~/.config/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'henrik/vim-yaml-helper'
Plug 'junegunn/vim-easy-align'
Plug 'jwhitley/vim-matchit'             " use '%' to move to opposite match
Plug 'kana/vim-textobj-user'            " dependency for vim-textobj-rubyblock
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'   " use 'var' to mark ruby block
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'slim-template/vim-slim'
Plug 'tomtom/tcomment_vim'              " use 'gc' to comment out code
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'                " inserts 'end' in ruby
Plug 'tpope/vim-fugitive'               " git
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'wavded/vim-stylus'

" Exchange bits with cx{motion}
" https://github.com/tommcdo/vim-exchange
Plug 'tommcdo/vim-exchange'

Plug 'tpope/vim-ragtag'                 " close tags with CTRL+X /
let g:ragtag_global_maps = 1

Plug 'kdheepak/lazygit.nvim'
nnoremap <silent> <leader>gg :LazyGit<CR>

Plug 'stefanoverna/vim-i18n'
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>it :call I18nDisplayTranslation()<CR>

" Plug 'AndrewRadev/sideways.vim'
" nnoremap <c-h> :SidewaysLeft<cr>
" nnoremap <c-l> :SidewaysRight<cr>

Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <c-b> :Buffers<CR>
nnoremap <c-h> :History:<CR>
nnoremap <c-p> :Files<CR>

Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --no-heading --column'
map <C-F> :Ack!<space>
vnoremap <C-F> y:Ack! "<C-r>=fnameescape(@")<CR>"

Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plug 'dense-analysis/ale'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['standard'],
\   'json': ['jq'],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'html': ['prettier'],
\   'javascript': ['standard'],
\   'json': ['jq'],
\   'ruby': ['rufo'],
\   'yaml': ['yamlfix'],
\}
" Plug 'sbdchd/neoformat'
" let g:neoformat_try_node_exe = 1
" let g:neoformat_enabled_javascript = ['standard']
" let g:neoformat_enabled_ruby = ['rufo']
" let g:neoformat_enabled_vue = ['prettier', 'prettier-eslint']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END

Plug 'rizzatti/dash.vim'
let g:dash_map = { 'ruby': 'rails' }
:nmap <silent> <leader>d <Plug>DashSearch

Plug 'vim-test/vim-test'
let g:neoterm_default_mod="botright"
let g:neoterm_size=22
let g:test#javascript#runner='jest'
let g:test#ruby#rails#options='--fail-fast'
let g:test#strategy="neoterm" " neoterm/dispatch
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

Plug 'ngmy/vim-rubocop'
let g:vimrubocop_extra_args='--display-cop-names'
nmap <Leader>c :RuboCop --autocorrect --display-style-guide<CR>

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

call plug#end()

" Neomake config. Must be after plug#end
let g:neomake_html_enabled_makers = []
call neomake#configure#automake('nrwi', 500)

set number " show absolute line number for current line

" use MacOS clipboard
" set clipboard=unnamed

nnoremap <silent> <esc><esc> :nohlsearch<CR><C-l>
nmap <Leader>f :NERDTreeFind<CR>
nmap <leader>cn :cn<CR>
nmap <leader>ep :e ~/.profile<CR>
nmap <leader>et :e ~/Dropbox/todo.txt<CR>
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>r :source $MYVIMRC<CR>
nmap <leader>y :!yml-sorter -i % -o %<CR>
vnoremap <leader>s d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>
imap <leader>cl console.log("ASDF", );<Left><Left>

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set ignorecase
set smartcase

" incrementally preview substitutions
set icm=split

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.png,*.jpg,*.gif,build,*.min.js

" Remember last location in file
if has('autocmd')
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown,vue setlocal omnifunc=htmlcomplete#CompleteTags
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

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,Capfile,Fastfile,Matchfile,Clockfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{axlsx,thor,sinew,jbuilder} set ft=ruby
au BufRead,BufNewFile *.slim set ft=slim
au BufRead,BufNewFile *.{es6,jsx} set ft=javascript

colorscheme vim " neovims new 'default' scheme breaks solarized
set notermguicolors
" highlight Search ctermfg=0

let &t_ut=''

source ~/.config/nvim/colo.vim
highlight Search ctermbg=221

" Show (partial) command in the status line
set showcmd

" disables automatic wrapping in text files
set textwidth=0

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
set wildignore+=.keep
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

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

" a little less right hand acrobatics to help with RSI
:nnoremap <space> :

" repeat last macro quicker
nnoremap Q @@

set lazyredraw " do not redraw in between macro steps

nnoremap <leader>x :!%:p<Enter>
vnoremap <leader>o c<C-R>=system('ruby -ractive_support/inflector -e "print STDIN.read.camelize"', getreg('"'))<CR><esc>
vnoremap <leader>i c<C-R>=system('ruby -ractive_support/inflector -e "print STDIN.read.underscore"', getreg('"'))<CR><esc>
