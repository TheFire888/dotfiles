
let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode' .
      \ '-halt-on-error -synctex=1 -output-directory=%:h %'

let s:latexmk = 'latexmk -pdf -output-directory=%:h %'

let &l:makeprg = expand(s:latexmk)

let b:tex_use_latexmk = 0

" Toggles between latexmk and pdflatex
function! s:TexToggleLatexmk() abort
  if b:tex_use_latexmk  " if latexmk is on, turn it off
    let b:tex_use_latexmk = 0
  else  " if latexmk is off, turn it on
    let b:tex_use_latexmk = 1
  endif
  call s:TexSetMakePrg()  " update Vim's `makeprg` option
endfunction

" Sets the value of `makeprg` based on current value of `b:tex_use_latexmk`
function! s:TexSetMakePrg() abort
  if b:tex_use_latexmk
    let &l:makeprg = expand(s:latexmk)
  else
    let &l:makeprg = expand(s:pdflatex)
  endif
endfunction

nmap <leader>tl <Plug>TexToggleLatexmk
nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>

call s:TexSetMakePrg()

" Match file name
setlocal errorformat=%-P**%f
setlocal errorformat+=%-P**\"%f\"

" Match LaTeX errors
setlocal errorformat+=%E!\ LaTeX\ %trror:\ %m
setlocal errorformat+=%E%f:%l:\ %m
setlocal errorformat+=%E!\ %m

" More info for undefined control sequences
setlocal errorformat+=%Z<argument>\ %m

" More info for some errors
setlocal errorformat+=%Cl.%l\ %m

" Catch-all to ignore unmatched lines
setlocal errorformat+=%-G%.%#
