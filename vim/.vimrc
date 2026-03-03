" Disable vi compatibility
set nocompatible
" Enable file type detection
filetype plugin indent on
syntax on
" Dark theme
set background=dark
colorscheme desert  " Built-in dark theme, or use 'gruvbox' if installed

" Make background transparent to match terminal
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" Basic settings
set number              " Line numbers
set relativenumber      " Relative line numbers
set ruler               " Show cursor position
set showcmd             " Show incomplete commands
set wildmenu            " Visual autocomplete for command menu
set showmatch           " Highlight matching brackets
" Search settings
set incsearch           " Search as characters are entered
set hlsearch            " Highlight search matches
set ignorecase          " Case insensitive search
set smartcase           " Case sensitive if uppercase used
" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab           " Use spaces instead of tabs
" Performance
set lazyredraw          " Don't redraw during macros
" UI improvements
set cursorline          " Highlight current line
set scrolloff=8         " Keep 8 lines visible when scrolling
set sidescrolloff=8
set termguicolors       " Enable true colors
" Persistent undo
set undofile
set undodir=~/.vim/undo
" Swap and backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
" Status line
set laststatus=2
set statusline=%F%m%r%h%w\ [%l,%c]\ [%L\ lines]
" Leader key
let mapleader = ","
" Key mappings
nnoremap <leader><space> :nohlsearch<CR>  " Clear search highlight
nnoremap <C-h> <C-w>h                      " Navigate splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Create required directories
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "p")
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p")
endif
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p")
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p")
endif
if has('gui_running')
  set guifont=JetBrainsMono\ Nerd\ Font:h12
endif
