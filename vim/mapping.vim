nnoremap g, za
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}
let mapleader = ' '
let maplocalleader = ' '
let g:mapleader = ' '
" map <space> <leader>
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

" noob tools: I've disabled these to prevent myself from getting into a bad
" habit.
" TODO: toggle these whenever other people need to drive.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" inoremap <ESC> <nop>

noremap ; :

" navigate splits by adding the Ctrl-modifier to the analogous vim motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <silent> <leader>/ :nohlsearch<CR>
inoremap jk <esc>
inoremap jj <esc>
inoremap kk <esc>

nmap H 0
vmap H 0
nmap L $
vmap L $
map <F7> :setlocal spell! spell?<CR>
