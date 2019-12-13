filetype off
syntax enable
set number
set background=dark
set clipboard+=unnamedplus
set hidden
set shell=/usr/bin/zsh

call plug#begin('~/.vim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/echodoc.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'


Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'

call plug#end()

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set hidden

let g:python_host_prog = '/home/jaeyeun/.virtualenvs/neovim2/bin/python' 
let g:python3_host_prog = '/home/jaeyeun/.virtualenvs/neovim/bin/python' 


let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

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

if(executable('i3_nvim_focus_client.py'))
	call RegisterNvimI3Connection()
	autocmd VimLeave * call UnregisterNvimI3Connection()
endif
 
nmap <F8> :TagbarToggle<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
