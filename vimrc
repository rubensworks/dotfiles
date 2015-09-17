set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/taglist.vim.git'
Plugin 'vim-scripts/c.vim.git'
Plugin 'vim-scripts/AutoClose'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/vim-easy-align'
Plugin 'Raimondi/delimitMate'

Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'elzr/vim-json'
Plugin 'niklasl/vim-rdf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required


" Own settings
" ==================================
syntax enable
set background=dark
colorscheme peachpuff
silent! colorscheme base16-3024 " conditional colorscheme"

filetype plugin indent on
set smartindent

" Partially based on https://github.com/ZeusWPI/ansible-client/blob/master/roles/vim/files/vimrc

set number          " line numbers on the right side
set showcmd         " show the commands while typing
set splitright      " open new splits on the right
set splitbelow      " open new splits below
set autoread        " autoreload file on change
set scrolloff=8     " keep the cursor 8 lines away from the top/bottom
set ruler           " show the lines/% bottomright
set encoding=utf-8  " set default encoding
set laststatus=2    " always show the status line

" wrap lines at 70 characters
"set formatprg=par\ -w70
"set formatoptions=t
"set textwidth=70

" indentation
set tabstop=4       " tab is 4 width
set softtabstop=4   " tab is 4 width
set shiftwidth=4    " for use with > and <
set expandtab       " tab key puts spaces
set autoindent      " in case filetype indent is wrong filetype plugin indent on
set list            " if tabs, show them with 2 spaces
set listchars=tab:\·\ ,trail:·
                    " display tabs with a leading \cdot
                    " trailing whitespace looks like \cdot

" Don't save tmp/swap files in the current directory.
set directory=~/.vim/tmp/swap/
set backupdir=~/.vim/tmp/backup/

" Learning to use decent vim.
""noremap <Up> <NOP>
""noremap <Down> <NOP>
""noremap <Left> <NOP>
""noremap <Right> <NOP>

" Keep selection after indenting
vnoremap > >gv
vnoremap < <gv

" some shortcuts
" go to start of line
noremap H ^
" go to end of line
noremap L g_
" center screen with <space>
noremap <space> zz
" rewrite file with sudo
cmap w!! w !sudo tee % >/dev/null
" paste the clipboard
noremap <C-b> :r!xclip -sel c -o<CR><CR>
noremap <C-m> :w !xclip -sel c<CR><CR>

" Copy/paste to/from system clipboard
nmap <C-c> :.w !pbcopy<CR><CR>
vmap <C-c> :w !pbcopy<CR><CR>
nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Unfold everything upon opening a new file
"autocmd BufRead * normal zR
set foldlevelstart=2

" airline settings
let g:airline#extensions#tabline#enabled = 1

" nerdtree settings
" Open nerdtree when vim has no file input
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

" Use ag for searching
let g:ackprg = 'ag --nogroup --nocolor --column'
