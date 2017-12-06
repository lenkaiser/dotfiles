scriptencoding utf-8
syntax enable           " enable syntax processing
" colorscheme molokai
colorscheme jay
filetype indent on
filetype plugin on
set termguicolors
set clipboard=unnamed,unnamedplus
set backspace=indent,eol,start
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
set autoindent
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1
set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set ruler              " show the cursor position all the time
if exists('&inccommand')
  set inccommand=split " like incsearch, but do it for commands (like :s)
endif
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=7        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical   splits  use  right  half  of screen
set splitbelow         " Horizontal splits  use  bottom half  of screen
set timeoutlen=1000    " Lower ^[ timeout
set fillchars+=fold:\ , " get rid of obnoxious '-' characters in folds & diffs
set fillchars+=diff:\ ,
set tildeop            " use ~ to toggle case as an operator, not a motion
set colorcolumn=+0     " show a column whenever textwidth is set
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif
set list               " Show certain non-printing characters as printed
set listchars-=trail:- " Don't show trailing whitespace in listchars output
                       " (I use vim-better-whitespace for trailing whitespace)
set listchars-=eol:$   " Don't show trailing end-of-line characters
                       " (I use vim-better-whitespace for trailing whitespace)
set cinkeys-=0#        " Let #pragma directives appear anywhere in a line

set wildmode=full


" Always show the status line
set laststatus=2


" ----- Terminal-as-GUI settings --------------------------------------------

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has('gui_running')
  syntax on
  set hlsearch
endif

if exists('+termguicolors')
  " This lets us use 24-bit "true" colors in the terminal
  set termguicolors
endif

" NeoVim and iTerm2 have support to display different cursor shapes than just
" the standard white block.
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!

  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END
