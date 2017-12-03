scriptencoding utf-8
" Colors {{{
syntax enable           " enable syntax processing
" colorscheme molokai
set termguicolors
" }}}
" Misc {{{
set clipboard=unnamed,unnamedplus
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap g, za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}
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

" ----- Convenience commands and cabbrev's ----------------------------------

" Make these commonly mistyped commands still work
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Wqa wqa<bang>
command! -bang W w<bang>
command! -bang Q q<bang>

" Use :C to clear hlsearch
command! C nohlsearch

" Force write readonly files using sudo
command! WS w !sudo tee %

" open help in a new tab
cabbrev help tab help

" My LaTeX Makefiles all have a `view` target which compiles and opens the PDF
" This command saves the file then runs that target
command! Wv w | make view
command! WV w | make view

" Open terminal in a split split
command! Vte vsplit | terminal
command! Ste split | terminal

" Open scratch buffer in a split on left
command! Vsnew vert new | norm <C-w>H

" ----- Custom keybindings --------------------------------------------------

map <space> <leader>
noremap <CR> :
noremap <M-Enter> <CR>
" noremap : <nop>
noremap <M-:> :
noremap S <nop>

nnoremap <leader>l :call ToggleNumber()<CR>

" Make navigating long, wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> gk k
noremap <silent> gj j
noremap <silent> 0 g0
noremap <silent> g0 0
noremap <silent> $ g$
noremap <silent> g$ $
noremap <silent> ^ g^
noremap <silent> g^ ^
noremap <silent> _ g_

" use 'Y' to yank to the end of a line, instead of the whole line
nnoremap <silent> Y y$

" take first suggested spelling as correct spelling and replace
nnoremap <silent> <leader>z z=1<CR><CR>
nnoremap <silent> <leader>zf V$%zf
nnoremap <silent> zT zMzvzczO

" See WV command above
" nnoremap <silent> <leader>w :WV<CR>

" See Vte command above
nnoremap <silent> <leader>v :Vte<CR>

nnoremap <silent> <leader>c :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>

noremap <silent> <leader>y "+y

nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Neovim Terminal Emulator keys
if has('nvim')
  tnoremap <M-e> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" noob tools: I've disabled these to prevent myself from getting into a bad
" habit.
" TODO: toggle these whenever other people need to drive.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <ESC> <nop>

" make the j and k work better with wrapped text
" if you hit j, it goes down a visual line, not a logical line
noremap j gj
noremap k gk
noremap ; :

" navigate splits by adding the Ctrl-modifier to the analogous vim motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <silent> <leader>/ :nohlsearch<CR>
inoremap jk <esc>
nmap H 0
vmap H 0
nmap L $
vmap L $
map <F7> :setlocal spell! spell?<CR>

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

" ----- Not-quite-general-but-don't-belong-anywhere-else Settings -----------

augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!

  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END
