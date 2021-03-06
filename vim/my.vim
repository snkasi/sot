" http://github.com/jferris/config_files/blob/master/vimrc
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://coolshell.cn/articles/5426.html
" http://statico.github.io/vim2.html
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" http://pchm.co/from-textmate-to-vim/
" https://raw.githubusercontent.com/nvie/vimrc/master/vimrc
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

source ~/.vim/sensible.vim
source ~/.vim/basic.vim

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin() "{{{

  " ===================
  " Editor
  " -------------------
  Plug 'wikitopian/hardmode'

  " Plug 'Yggdroot/indentLine'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'terryma/vim-expand-region'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-eunuch'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'dkprice/vim-easygrep'
  Plug 'wesQ3/vim-windowswap'

  Plug 'tpope/vim-rsi'
  Plug 'rking/ag.vim'
  Plug 'dhruvasagar/vim-table-mode'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim'
  else
    Plug 'Shougo/neocomplete.vim'
  endif
  Plug 'kien/ctrlp.vim'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " ===================
  " Appearance
  " -------------------
  Plug 'tomasr/molokai'
  Plug 'chriskempson/base16-vim'
  Plug 'baskerville/bubblegum'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'jistr/vim-nerdtree-tabs'

  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  " ===================
  " Languages
  " -------------------
  Plug 'tpope/vim-sleuth'

  Plug 'mattn/emmet-vim'
  Plug 'chrisbra/Colorizer'

  Plug 'dag/vim-fish'

  " ruby
  Plug 'tpope/vim-endwise'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'rking/pry-de', { 'rtp': 'vim' }
  Plug 'skalnik/vim-vroom'

  Plug 'kchmck/vim-coffee-script'
  Plug 'isRuslan/vim-es6'


  " Plug 'mhinz/vim-startify'
  " Plug 'kshenoy/vim-signature'
  " Plug 'scrooloose/syntastic'

  " Plug 'vim-scripts/localrc.vim'

  " Plug 'svermeulen/vim-easyclip'
  " Plug 'easymotion/vim-easymotion'

  " neobundle 'tommcdo/vim-exchange'
  " neobundle 'bronson/vim-visual-star-search'
  " neobundle 'godlygeek/tabular'
call plug#end()

" }}}


" ===================
" Editor {{{
" -------------------

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set foldlevel=10

" vim-table-mode
let g:table_mode_corner="|"

if has('nvim')
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
else
  " neocomplete
  let g:neocomplete#enable_at_startup = 1
endif

" }}}


" ===================
" Appearance
" -------------------

if has("gui_running") && !empty(globpath(&rtp, "colors/base16-monokai.vim"))
  set background=dark
  colorscheme base16-monokai

  set guicursor+=a:blinkon0

  set cursorline
  highlight LineNr guibg=NONE
  highlight Folded guibg=#0A0A0A guifg=#9090D0
  highlight NonText guifg=#4a4a59
  highlight SpecialKey guifg=#4a4a59

  highlight SignColumn guifg=NONE
  highlight GitGutterAdd guibg=NONE
  highlight GitGutterChange guibg=NONE
  highlight GitGutterDelete guibg=NONE
  highlight GitGutterChangeDelete guibg=NONE

  let g:airline_theme='base16'
endif

if (&t_Co >= 256)
  " let g:airline_theme='powerlineish'
  let g:airline_theme='wombat'
  " set background=dark
  " colorscheme base16-monokai

  set cursorline
  highlight CursorLine cterm=none

  highlight CursorLine ctermbg=233 cterm=none
  highlight CursorLineNr ctermbg=233

  highlight NonText ctermfg=236
  highlight SpecialKey ctermfg=236

  highlight Visual ctermbg=238
endif


let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z = airline#section#create(['%{&tabstop}:%{&shiftwidth}',' %3p%% ',g:airline_symbols.linenr,'%3l:%c'])
let g:airline#extensions#tabline#enabled = 1


let NERDTreeMinimalUI=1


" ===================
" Languages
" -------------------

" vim-textobj-rubyblock required
" runtime macros/matchit.vim

let g:colorizer_auto_filetype='css,html,scss'



" ===================
" Keymap
" -------------------
if has("gui_running")
  set macmeta
endif

" https://www.progclub.org/blog/2014/12/06/fixing-meta-keys-in-vim-via-mac-os-x-terminal-app/
" http://stackoverflow.com/questions/26310077/use-cmd-mappings-in-console-vim
" Fix meta-keys on iTerm2
let c='a'
while c <= 'z'
  exec "set <M-".c.">=\<Esc>".c
  let c = nr2char(1+char2nr(c))
endw

" Write with sudo
cmap w!! w !sudo tee % >/dev/null

nmap <Leader><Leader>q :q<CR>
nmap <Leader>w :w<CR>

nmap <Leader>cn :w<CR>:cn<CR>

" Quickly edit your macros
nnoremap <leader>m  :<c-u><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Copy & paste to system clipboard
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P

map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Left> <C-w>h
map <C-Right> <C-w>l

" Highlight last inserted text
nnoremap gV `[v`]

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
" cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Press ^F from insert mode to insert the current file name
" imap <C-F> <C-R>=expand("%")<CR>

nmap <Leader><Leader> V

" CMD only works in MacVim
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Toggle NERDTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" let g:HardMode_level = 'wannabe'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" ===================
"  FileTypes {{{
" -------------------
" autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType vim setlocal foldmethod=marker
autocmd BufRead,BufNewFile .eslintrc setfiletype yaml
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
" }}}


" ===================
"  Miscellaneous
" -------------------
" Local config
if filereadable(glob(".vimrc.local"))
  source ~/.vimrc.local
endif
