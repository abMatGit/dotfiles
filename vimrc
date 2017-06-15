"==================================== VIM SETTINGS ===================================
syntax on
syntax enable
autocmd VimEnter * NERDTree
setf dosini

set paste
set autoindent
set noswapfile
set expandtab
set shiftwidth=2
set softtabstop=2
set incsearch
set hlsearch
set modifiable

set number
set smartcase
set ignorecase
" set cc=120

" This will automatically remove trailing white space on every :w
autocmd BufWritePre * :%s/\s\+$//e

" ==================================== VIM FUNCTIONS =======================================
"
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
" ==========================================================================================
let g:CommandTMaxHeight = 10

" ============ COMMANDS ===========
"
:command W w
:command Q q
:let mapleader = ","
:let g:ackprg = "ag --nogroup --nocolor --column --ignore '*.log'"
:map <Leader>t :CtrlP<CR>
:map <Leader>r :NERDTreeToggle<CR>
:map <Leader>f :NERDTreeFind<CR>
:map <Leader>i :call NumberToggle()<CR>
:map <Leader>h :noh<CR>
vnoremap // y/<C-R>"<CR>
xnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>
xnoremap <Leader>c :w !pbcopy<CR><CR>
"=================================

" =================== GIT GUTTER ==============
let g:gitgutter_sign_removed = '<<'
let g:gitgutter_sign_added = '>>'
let g:gitgutter_sign_modified = '<>'
let g:gitgutter_sign_modified_removed = '><'
"==============================================

" ==================================== VUNDLE SETTINGS ===============================
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ========================= PLUGINS ===================
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'itspriddle/vim-jquery'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rails.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomlion/vim-solidity'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elmcast/elm-vim'
Plugin 'hiukkanen/vim-hamlc'

" ================ CTRL P SETTINGS ===============

let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'max:15,results:15'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|\public$\|\bundle$\|\tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:ctrlp_user_command = 'ag %s --nocolor --smart-case --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .DS_Store
      \ --ignore "**/*.swf"
      \ --ignore "**/*.png"
      \ --ignore "**/*.log"
      \ --ignore bundle
      \ -g ""'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ===========================================================================================

" ====================== COLORSCHEMES  =========================
colorscheme molokai
