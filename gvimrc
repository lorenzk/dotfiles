if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Disables CMD-S for saving
  macmenu File.Save key=<C-D-S>
  map <D-s> <Nop>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h
else

  " Ctrl-Shift-F for Ack
  map <C-F> :Ack<space>

  " Ctrl-e for ConqueTerm
  map <C-e> :call StartTerm()<CR>

  " Alt-][ to increase/decrease indentation
  vmap <A-]> >gv
  vmap <A-[> <gv

  " Ctrl-Option-ArrowKey to switch viewports
  map <C-S-Up> <C-w>k
  imap <C-S-Up> <Esc> <C-w>k
  map <C-S-Down> <C-w>j
  imap <C-S-Down> <Esc> <C-w>j
  map <C-S-Right> <C-w>l
  imap <C-S-Right> <Esc> <C-w>l
  map <C-S-Left> <C-w>h
  imap <C-S-Left> <C-w>h
endif

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

" disable mouse-over pop-ups
set noballooneval

colo solarized
set columns=170
set guifont=Monaco:h13.00

" remove left-hand scrollbar
set guioptions-=L

" remove right-hand scrollbar
set guioptions-=r

" never start select mode
set selectmode=
