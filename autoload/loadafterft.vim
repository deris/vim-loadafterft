" vim-loadafterft - filetype plugin読み込み後にユーザカスタムコマンドを実行する
" Version: 0.0.1
" Copyright (C) 2012 deris0126
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_loadafterft')
  finish
endif

" Public API {{{1

function! loadafterft#execute_after_ftplugin() "{{{2
  if !exists('g:execcmd_after_ftplugin')
    return
  endif

  call s:execute_filetype(g:execcmd_after_ftplugin, '_')
  for ftype in split(&ft, '\.')
    call s:execute_filetype(g:execcmd_after_ftplugin, ftype)
  endfor
endfunction
"}}}

function! loadafterft#execute_after_indent() "{{{2
  if !exists('g:execcmd_after_indent')
    return
  endif

  call s:execute_filetype(g:execcmd_after_indent, '_')
  for ftype in split(&ft, '\.')
    call s:execute_filetype(g:execcmd_after_indent, ftype)
  endfor
endfunction
"}}}

"}}}

" Private {{{1

function! s:execute_filetype(cmdlistdir, ftype) "{{{2
  if has_key(a:cmdlistdir, a:ftype)
    for cmd in a:cmdlistdir[a:ftype]
      execute cmd
    endfor
  endif
endfunction
"}}}

"}}}

let g:loaded_loadafterft = 1

" __END__ "{{{1
" vim: foldmethod=marker
