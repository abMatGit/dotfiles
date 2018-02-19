" ---------------------------------- SETTINGS -----------------------------
" This will automatically remove trailing white space on every :w
autocmd BufWritePre * :%s/\s\+$//e
autocmd VimEnter * NERDTree

set autoindent
set noswapfile
set ruler
set expandtab
set shiftwidth=2
set softtabstop=2
set modifiable
set incsearch
set hlsearch
set ignorecase
set smartcase
set number
set guicursor=
set foldenable
set foldmethod=syntax
set foldlevelstart=20
"--------------------------------------------------------------------------

" ---------------------------------- PLUGINS ------------------------------
if has("nvim")
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
  if has("nvim")
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'neovim/node-host'
    Plug 'neomake/neomake'
  endif
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }
  Plug 'rking/ag.vim', { 'on': 'Ack' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'flazz/vim-colorschemes'
  Plug 'hiukkanen/vim-hamlc', { 'for': 'hamlc' }
  Plug 'sheerun/vim-polyglot'
  Plug 'jparise/vim-graphql'
call plug#end()
"--------------------------------------------------------------------------
"
"--------------------------- NEO MAKE SETTINGS ----------------------------
if has("nvim")
  " When reading a buffer (after 1s), and when writing.
  call neomake#configure#automake('rw', 1000)
end
"--------------------------------------------------------------------------

" --------------------------------- FUNCTIONS -----------------------------
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
"--------------------------------------------------------------------------

"--------------------------- PLUGIN VARIABLES -----------------------------
" Git Gutter variables
let g:gitgutter_sign_removed = '<<'
let g:gitgutter_sign_added = '>>'
let g:gitgutter_sign_modified = '<>'
let g:gitgutter_sign_modified_removed = '><'
let g:fzf_layout = { 'down': '~20%' }
let g:deoplete#enable_at_startup = 1

let g:js_context_colors_enabled = 0
let g:js_context_colors_highlight_function_names = 1
let g:js_context_colors_show_error_message = 1
"------------------------------------------------------------------------- CUSTOM COMMANDS ----------------------------
:command W w
:command Q q
:let mapleader = ","
:let g:ackprg = "ag --nogroup --nocolor --column --ignore '*.log'"
:map <Leader>t :FZF<CR>
:map <Leader>r :NERDTreeToggle<CR>
:map <Leader>f :NERDTreeFind<CR>
:map <Leader>i :call NumberToggle()<CR>
:map <Leader>h :noh<CR>
vnoremap // y/<C-R>"<CR>
xnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>
nnoremap <Leader>n :so ~/.config/nvim/init.vim<CR>
"--------------------------------------------------------------------------
colorscheme molokai
