" All Vundle initialization. Don't change anything outside the block comment.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"""
Plugin 'davidhalter/jedi-vim'
"""
call vundle#end()
filetype plugin indent on
" End Vundle.

" Set how many lines of history VI has to remember.
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" :W will now save the file with root, for handling permission-denied after opening.
command W w !sudo tee % > /dev/null

" Always show current position.
set ruler

" Configure backspace so it acts as it should act.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching.
set ignorecase

" When searching try to be smart about cases.
set smartcase

" Highlight search results.
set hlsearch

" Makes search act like search in modern browsers.
set incsearch 

" For regular expressions turn magic on.
set magic

" Show matching brackets when text indicator is over them.
set showmatch 

" How many tenths of a second to blink when matching brackets.
set mat=2

" No annoying sound on errors.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable 256 colors palette in Gnome Terminal.
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language.
set encoding=utf8

" Use Unix as the standard file type.
set ffs=unix,dos,mac

" Turn backup off, since everything is in Git.
set nobackup
set nowb
set noswapfile

" Show line numbers.
set number

" When using the >> or << commands, shift lines by 4 spaces.
set shiftwidth=4

" Set tabs to have 4 spaces.
set tabstop=4

" Expand tabs into spaces.
set expandtab

" Be smart.
set smarttab

" Indent when moving to the next line while writing code.
set autoindent
set si  " Smart Indent

" Wrap lines.
set wrap

" Specify location of ctags.
set tags=~/.tags

" Always show the status line.
set laststatus=2

" Format the status line.
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Return to last edit position when opening files.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Generic syntax highlighting.
syntax enable

" Python. 
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

" Shell.
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif

" Navigating tabs.
map <C-t> :tabe 
map <C-w> :tabc<cr>
map <leader><Left> :tabp<cr>
map <leader><Right> :tabn<cr>
