" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set softtabstop=4
set shiftwidth=4
set background=dark
set expandtab

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

set nomodeline
set enc=utf-8
set fileencodings=utf-8,cp950,big5,eucjp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set ambiwidth=double
set number
set list


" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'scrooloose/nerdtree'
Bundle 'Rip-Rip/clang_complete'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/indenthtml.vim'
Bundle 'mileszs/ack.vim'
Bundle 'edsono/vim-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'majutsushi/tagbar'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Rykka/riv.vim'
Bundle 'bling/vim-airline'

filetype plugin indent on

" 256 color
set t_Co=256
colorscheme codeschool

" status
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

" Google C++ Style
autocmd FileType c,h,cpp,hpp set softtabstop=2
autocmd FileType c,h,cpp,hpp set shiftwidth=2

" NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" PHP Auto Complete
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" List
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Clang Complete
let g:clang_use_library=1

" markdown syntax settings
au BufNewFile,BufRead *.mkd,*.md set filetype=markdown

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ '
let g:syntastic_python_checkers = ['flake8']

" python-mode
let g:pymode_lint=0
let g:pymode_folding=0
let g:pymode_rope_vim_completion=0

" as3 syntax
au BufRead,BufNewFile *.as set filetype=actionscript
