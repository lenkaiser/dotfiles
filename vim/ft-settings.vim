scriptencoding utf-8

augroup myFiletypes
  au!

  au BufRead,BufNewFile BUCK setlocal filetype=python
  au BufRead,BufNewFile *.md setlocal filetype=markdown
  au BufRead,BufNewFile .amethyst setlocal filetype=json
  au BufRead,BufNewFile .jrnl_config setlocal filetype=json
  au BufRead,BufNewFile *.pde setlocal filetype=java
  au BufRead,BufNewFile *.gradle setlocal filetype=groovy
  au BufRead,BufNewFile gitconfig setlocal filetype=gitconfig
  au BufRead,BufNewFile .eslintrc setlocal filetype=json
  au BufRead,BufNewFile .jscsrc setlocal filetype=json
  au BufRead,BufNewFile *.l1 setlocal filetype=c0
  au BufRead,BufNewFile *.l2 setlocal filetype=c0
  au BufRead,BufNewFile *.l3 setlocal filetype=c0
  au BufRead,BufNewFile *.l4 setlocal filetype=c0
  au BufRead,BufNewFile *.sqlite setlocal filetype=sql
  au BufRead,BufNewFile *.hs setlocal filetype=haskell

  " Reset concealcursor in Vim help
  au FileType help setlocal concealcursor=

augroup END
