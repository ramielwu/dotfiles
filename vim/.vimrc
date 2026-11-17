" =================================
" Basic Neovim / Vim Configuration
" =================================
" 1. Core Visuals & Syntax
syntax on             " Enable syntax highlighting
filetype plugin indent on " Enable filetype-based indentation
set termguicolors     " Enable 24-bit RGB colors (if your terminal supports it)
colorscheme slate  " options -- peachpuff, slate, elflorf, industry, desert

" 2. Corner Spacing & UI Padding
" Note: Neovim handles window padding natively via these settings
set signcolumn=yes    " Always show the sign column to prevent text shifting
set cmdheight=1       " Height of the command line
set laststatus=2      " Always show the status line

" 3. Numbers & Lines
set number            " Show line numbers
"set relativenumber    " Show relative line numbers (helpful for jumping)
set scrolloff=8       " Keep 8 lines visible above/below the cursor when scrolling
set sidescrolloff=8   " Keep 8 columns visible to the left/right

" 4. Indentation & Tabs
set tabstop=4         " Number of visual spaces per TAB
set softtabstop=4     " Number of spaces in tab when editing
set shiftwidth=4      " Number of spaces to use for autoindent
set expandtab         " Convert tabs to spaces
set smartindent       " Enable smart indentation

" 5. Searching & Behavior
set incsearch         " Show search matches as you type
set hlsearch          " Highlight search matches
set ignorecase        " Case-insensitive searching...
set smartcase         " ...unless uppercase letters are used
set clipboard=unnamedplus " Sync with system clipboard
" set mouse=a           " Enable mouse support

" Color of MatchParen
highlight MatchParen cterm=bold,underline ctermfg=yellow ctermbg=none 

