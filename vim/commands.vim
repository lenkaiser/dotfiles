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

" Open terminal in a split split
command! Vte vsplit | terminal
command! Ste split | terminal

" Open scratch buffer in a split on left
command! Vsnew vert new | norm <C-w>H

