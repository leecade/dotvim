" .vimrc

" !silent is used to suppress error messages if the config line
" Disable Vi compatibility
set nocompatible
set autoindent
set autoread
set backupcopy=yes
set clipboard=unnamed
set ignorecase

set mouse=v



" Pset mouse=aoint to location of pathogen submodule (since it's not in .vim/autoload)
silent! runtime bundle/vim-pathogen/autoload/pathogen.vim
" Call pathogen plugin management
silent! call pathogen#infect()


if has("autocmd")
    " Load files for specific filetypes
    filetype on
    filetype indent on
    filetype plugin on

    " Languages with specific tabs/space requirements
    autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    " Automatically strip trailing whitespace on file save
    autocmd BufWritePre *.css,*.html,*.js,*.json,*.md,*.php,*.py,*.rb,*.scss,*.sh,*.txt :call StripTrailingWhitespace()
endif

if has("syntax")
    " Enable syntax highlighting
    syntax enable
    " Set 256 color terminal support
    set t_Co=256
    " Set dark background
    set background=dark
    " Set colorscheme
    colorscheme devbox-dark-256
endif

if has("cmdline_info")
    " Show the cursor line and column number
    set ruler
    " Show partial commands in status line
    set showcmd
    " Show whether in insert or replace mode
    set showmode
endif

if has('statusline')
    " Always show status line
    set laststatus=2
    " Broken down into easily includeable segments
    " Filename
    set statusline=%<%f\
    " Options
    set statusline+=%w%h%m%r
    " Current dir
    set statusline+=\ [%{getcwd()}]
    " Right aligned file nav info
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

if has("wildmenu")
    " Show a list of possible completions
    set wildmenu
    " Tab autocomplete longest possible part of a string, then list
    set wildmode=longest,list
    if has ("wildignore")
        set wildignore+=*.a,*.pyc,*.o,*.orig
        set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
        set wildignore+=.DS_Store,.git,.hg,.svn
        set wildignore+=*~,*.sw?,*.tmp
    endif
endif

if has("extra_search")
    " Highlight searches [use :noh to clear]
    set hlsearch
    " Highlight dynamically as pattern is typed
    set incsearch
    " Ignore case of searches...
    set ignorecase
    " ...unless has mixed case
    set smartcase
endif

" Change mapleader
let mapleader=","

" Backspace through everything in INSERT mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Use line wrapping
set wrap
" Use 4 spaces for indentation
set shiftwidth=2
" Use 4 spaces for soft tab
set softtabstop=2
" Use 4 spaces for tab
set tabstop=8
" Expand tab to spaces
set expandtab
" Enable line numbers
set number
" Highlight current line
set cursorline
" Increase default number of lines
" set lines=40
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show 'invisible' characters
" set list

" Set characters used to indicate 'invisible' characters
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=nbsp:_
"set listchars+=eol:¬

" Centralize backups, swapfiles and undo history

" disable backup
set nobackup
"set nowritebackup
set noswapfile

set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
if exists("&undodir")
    set undodir=$HOME/.vim/undo
endif
set viminfo+=n$HOME/.vim/.viminfo

" Load local machine settings if they exist
if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

" Strip trailing whitespace (,$)
noremap <leader>$ :call StripTrailingWhitespace()<CR>

" Faster viewport scrolling (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack 
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo
" 'vimrc reloaded'"<CR>

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

if executable('ag')
      let g:ackprg = 'ag --nogroup --column'
    "  Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Make `Y` work from the cursor to the end of line (which is more logical)
nnoremap Y y$


if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
