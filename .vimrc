syntax enable
set nocompatible  " We don't want vi compatibility.
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'taglist.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'will133/vim-dirdiff'
Plugin 'craigemery/vim-autotag'
Plugin 'bogado/file-line'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'alessandroyorba/alduin'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end() "required

filetype plugin indent on
set term=xterm-256color
set t_Co=256
"let g:solarized_termcolors=256
"set t_Co=16
"let g:solarized_termcolors=16
set background=dark
"silent! colorscheme solarized
"silent! colorscheme alduin
silent! colorscheme gruvbox

let mapleader=","

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=400  " Time to wait after ESC (default causes an annoying delay)
" Formatting (some of these are for coding in C and C++)
set expandtab
set ts=2  " Tabs are 4 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set mouse=a
set cursorline
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

setlocal spell spelllang=en_gb
set spell

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set noshowmode
set encoding=utf-8 " Necessary to show unicode glyphs

" Tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/local/bin/ctags -R .<cr>
nmap <leader>n :NERDTreeToggle<cr>

"map <D-T> :CommandT<cr>
let g:Powerline_symbols = 'fancy'

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

set runtimepath^=~/.vim/bundle/ctrlp.vim
"map <leader>t :CtrlP<cr>
"map <leader>b :CtrlPBuffer<cr>
"map <leader>m :CtrlPMRUFies<cr>

"Move between windows with ctrl+vim direction keys
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"let g:rspec_command = "Dispatch zeus rspec {spec}"
"let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:rspec_command = "Dispatch bin/rspec {spec}"

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
						\ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp|app\/assets\/images|coverage|private\/documents|doc\',
						\ 'file': '\.exe$\|\.so$\|\.dat|\.dump\.sql$'
						\ }

