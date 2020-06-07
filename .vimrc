" ###################################################################
" #############################VIMRC FILE############################
" ###################################################################

""""""""""""""""""""""""""""""VIM PLUGINS""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'				"Gruvbox colorscheme plugin

"python-mode plugin
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'scrooloose/nerdtree'			"Nerdtree plugin
Plug 'ctrlpvim/ctrlp.vim'			"Ctrl P plugin
Plug 'tpope/vim-surround'			"surround plugin
call plug#end()

"""""""""""""""""""""""Plugins based settings""""""""""""""""""""""

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
"let g:pymode_lint_on_fly=0			"check code when editing
let g:pymode_lint_messages=1		"show error message if cursor placed on error line

"Setup pymode quickfix window
"let g:pymode_quickfix_minheight=3
"let g:pymode_quickfix_maxheight=5
"set pymode preview window height
"preview window is used to show documentation and output from pymode-run
let g:pymode_preview_height=&previewheight
let g:pymode_indent=1				"enable PEP8 compatible python indent
"pymode can show documentation for current word by pydoc
"Turn on documentation script
let g:pymode_doc=1
let g:pymode_doc_bind='K'			"bind key to show docs for current word

"ctrl p searches in the directory in which vim was opened
let g:ctrlp_working_path_mode = 0

"""""""""""""""""""""""""END OF VIM PLUGINS"""""""""""""""""""""""""


"""""""""""""""""""""""""BASIC VIMRC SETTINGS"""""""""""""""""""""""

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
set path+=**			"find any files by :find file_name

" Display all matching files when we tab complete
set wildmenu
" Now we can hit tab to :find by partial match and use * to make it fuzzy
" we can also :b to autocomplete any open buffer
"
"
" =====> ### Tag Jumping ###
"
"
" ### Autocomplete ###
" Autocomplete is already enabled in VIM and can be used by following commands
" and items can be navigated using ^n and ^p to go to next and previous values
"
inoremap <leader>n <C-n>
"
" ### File Browsing ###
" Tweaks for browsing
let g:netrw_banner=0			"diable annoying banner
let g:netrw_browse_split=4		"open in prior windows
let g:netrw_altv=1				"open splits to the right
let g:netrw_liststyle=3			"tree views
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Now We Can:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mapping
"
" #### Snippets ####
"
"
" ### Build Integration ###
"
"
" ### Plugins to use ###
