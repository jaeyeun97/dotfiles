filetype off
syntax enable
set number
set background=dark
set clipboard+=unnamedplus
set hidden

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

"Lang Client
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'} 

"FZF
Plug 'junegunn/fzf.vim' 

"ALE
" Plug 'w0rp/ale'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'jez/vim-better-sml'

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'

"TypeScript
Plug 'HerringtonDarkholme/yats.vim'


" Plug 'OmniSharp/omnisharp-vim'

call plug#end()


set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set hidden

let g:python_host_prog = '/home/jaeyeun/.virtualenvs/neovim2/bin/python2' 
let g:python3_host_prog = '/home/jaeyeun/.virtualenvs/neovim/bin/python3' 

let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option('auto_complete_delay', 0)

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
	\ 'javascript': ['~/.yarn/bin/javascript-typescript-stdio', '-t',
	\				 '-l', '~/.config/nvim/log/javascript-langserver.log'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
	\ 'python': ['~/.local/bin/pyls'],
    \ 'ocaml': ['~/.yarn/bin/ocaml-language-server', '--stdio'],
	\ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
	\ 'java': ['java', 
			\ '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044',
			\ '-Declipse.application=org.eclipse.jdt.ls.core.id1',
			\ '-Dosgi.bundles.defaultStartLevel=4',
			\ '-Declipse.product=org.eclipse.jdt.ls.core.product',
			\ '-Dlog.level=ALL',
			\ '-noverify',
			\ '-Xmx1G',
			\ '-jar', '/home/jaeyeun/Resources/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.5.100.v20180611-1436.jar',
			\ '-configuration', '/home/jaeyeun/Resources/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/config_linux',
			\ '-data', '/home/jaeyeun/Projects',
			\ '--add-modules=ALL-SYSTEM',
			\ '--add-opens', 'java.base/java.util=ALL-UNNAMED',
			\ '--add-opens', 'java.base/java.lang=ALL-UNNAMED']
    \ }

" 'typescript': ['~/.yarn/bin/javascript-typescript-stdio',
"'-l', '~/.config/nvim/log/javascript-langserver.log'],
" 'javascript.jsx': ['~/.yarn/bin/javascript-typescript-stdio',
" '-l', '~/.config/nvim/log/javascript-langserver.log'],
" 'javascript': ['flow-language-server', '--stdio'],


call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/snippets'
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ALE
" Error and warning signs.
" let g:LanguageClient_diagnosticsEnable = 0
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠'
" 
" let g:ale_linters = {
" 			\   'javascript': ['eslint'],
" 			\   'python': ['flake8'],
" 			\   'rust': ['cargo'],
" 			\ }
" 
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_fixers['json'] = ['prettier']
" let g:ale_fixers['css'] = ['prettier']
" let g:ale_fixers['python'] = ['isort', 'yapf']
" let g:ale_fixers['rust'] = ['rustfmt']
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es6'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#ale#enabled = 1

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

let g:fzf_layout = { 'down': '~40%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" OmniSharp
" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_path = '/home/jaeyeun/.omnisharp/OmniSharp.exe'
" let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_loglevel = 'debug'
