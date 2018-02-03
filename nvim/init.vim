filetype off
syntax enable
set number
set background=dark
set clipboard+=unnamedplus

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Shougo/denite.nvim'
Plug 'jez/vim-better-sml'
Plug 'zhaocai/GoldenView.Vim'
Plug 'majutsushi/tagbar'
call plug#end()


set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

let g:python_host_prog = '/home/jaeyeun/.virtualenvs/neovim2/bin/python2' 
let g:python3_host_prog = '/home/jaeyeun/.virtualenvs/neovim/bin/python3' 
let g:deoplete#enable_at_startup = 1
let deoplete#sources#jedi#show_docstring = 1

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

filetype plugin on

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

function! RegisterNvimI3Connection()
    if strlen($WINDOWID) != 0
        silent exec '!i3_nvim_focus_client.py register '. $WINDOWID . ' ' . shellescape($NVIM_LISTEN_ADDRESS)
        let g:i3_nvim_connection = 1
    else
        let g:i3_nvim_connection = 0
    endif
endfunction

function! UnregisterNvimI3Connection()
    if g:i3_nvim_connection
        silent exec '!i3_nvim_focus_client.py unregister '. $WINDOWID
    endif
endfunction

call RegisterNvimI3Connection()
autocmd VimLeave * call UnregisterNvimI3Connection()

nmap <F8> :TagbarToggle<CR>

