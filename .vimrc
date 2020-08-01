" ###################################################################
" #############################VIMRC FILE############################
" ###################################################################

""""""""""""""""""""""""""""""VIM PLUGINS""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'				"Gruvbox colorscheme plugin
"python-mode plugin
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'valloric/youcompleteme'		"youcompleteme
Plug 'tpope/vim-fugitive'			"fugitive
Plug 'scrooloose/nerdtree'			"Nerdtree plugin
Plug 'ctrlpvim/ctrlp.vim'			"Ctrl P plugin
Plug 'tpope/vim-surround'			"surround plugin
Plug 'jamshedvesuna/vim-markdown-preview'	"vim markdown preview
call plug#end()

"""""""""""""""""""""""Plugins based settings""""""""""""""""""""""
"you complete me settings

"To use youcompleteme, it need to be compiled with these 3 steps
"1. sudo apt install build-essential cmake vim python3-dev
"2. cd ~/.vim/plugged/youcompleteme
"3. python3 install.py --all

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

"Changing built-in colorscheme with gruvbox
colorscheme gruvbox
set background=dark

"NERDTree settings
map <C-n> :NERDTreeToggle<CR> 		"map ctrl+n to toggle nerdtree

"Python-mode settings
let g:pymode=1						"turn on the whole plugin
let g:pymode_run=1					"turn on the run code script
let g:pymode_run_bind='<leader>r' 	"bind key to run python code
let g:pymode_lint=1					"turn on code checking
let g:pymode_lint_on_write=1		"check code on every save
let g:pymode_lint_messages=1		"show error message if cursor placed on error line

"preview window is used to show documentation and output from pymode-run
let g:pymode_preview_height=&previewheight
let g:pymode_indent=1				"enable PEP8 compatible python indent
"pymode can show documentation for current word by pydoc
"Turn on documentation script
let g:pymode_doc=1
let g:pymode_doc_bind='K'			"bind key to show docs for current word

"ctrl p searches in the directory in which vim was opened
let g:ctrlp_working_path_mode = 0

"Jamshed Vesuna Vim markdown preview settings
let vim_markdown_preview_browse='Google Chrome'
let vim_markdown_preview_hotkey='<leader>p'
" let vim_markdown_preview_toggle=0

"""""""""""""""""""""""""END OF VIM PLUGINS"""""""""""""""""""""""""


""""""""""""""""""""BASIC VIMRC SETTINGS - START""""""""""""""""""""

"remove yellow highlights in blank area
autocmd VimEnter * set t_ut=

" set warp as default for quickfix
augroup quickfix
	autocmd!
	autocmd FileType qf setlocal wrap
augroup END

syntax on					"Syntax highlight enabled
set number					"Show line number
set clipboard=unnamed   	"normal OS clipboard interaction
inoremap jj <Esc>			"map escape key to jj
filetype plugin on			"filetype detection on
filetype plugin indent on 	"essential for syntastic
"this will change the layout of line numbers in a way that you can use
"10j or 5k to go up or down the list
set number relativenumber
set nocompatible			"discard old vi version setting
set showmode				"Show current mode in status line

" Enable autocompletion
set wildmode=longest,list,full

"With a map leader it is possible to do extra key combinations like <leader>w
"saves the current file
let mapleader = ","

"Splits open at the bottom and right, which is non-retarded, unlike vim
set splitbelow splitright

" Fast Saving
nmap <leader>w :w!<cr>

"Fast Exit
nmap <leader>q :q!<cr>

" Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set belloff=all

" automatically deletes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Turn backup off, since most stuff is in git anyway
set nobackup
set nowb
set noswapfile

" Better way to move between split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable search highlight when <leader><cr> is pressed
map  <silent> <leader><cr> :noh<cr>

"  Status Line
set laststatus=2
set cmdheight=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Indenting
set ai
set si
set nowrap

" Search cofiguration
set ignorecase			"Ignore case when searching
set smartcase

"Type :noh to turn off temporarily
set hlsearch			"Highlight search results
set incsearch			"Make search act like search in browsers

" Helper functions
" Returns true if paste mode is enabled

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" lines to save text folding:
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Script to close all active windows except active window for quickfix
function! CloseAllWindowsButCurrent()
	let tabnr= tabpagenr()
	let tabinfo=gettabinfo(tabnr)
	let windows=tabinfo[0]['windows']

	for winid in windows
		let curwin=winnr() "could change
		let winnr=win_id2win(winid)
		if winnr!=curwin
			execute ':'.winnr.'q!'
		endif
	endfor
endfunction

" Shortcut for closing all inactive windows in the current tab
nmap <leader>c :call CloseAllWindowsButCurrent()<CR>

" toggle set paste in vim to ensure that pasted content are not
" improperly indented

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" copy paste in vim in wsl
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>

" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>


" ################################################################
" ####### How to do 90% of what plugins do (with just VIM) #######
" ################################################################
"
" =====>  ### File Finding ###
" Search down into subfolders and provide tab-completion for all file-related
" tasks
"
" set is a command that changes a built-in configuration variables such as
" path, += means appending & ** means seach recursively in directories
" set path+=**			"find any files by :find file_name

" Display all matching files when we tab complete
" set wildmenu
" Now we can hit tab to :find by partial match and use * to make it fuzzy
" we can also :b to autocomplete any open buffer
