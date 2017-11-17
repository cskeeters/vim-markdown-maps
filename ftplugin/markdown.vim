setlocal wrap
if !has("patch-7.4-353")
    setlocal nolist
endif
setlocal conceallevel=0
setlocal commentstring=<!--\ %s\ -->

" Since vim overrides this, we need a way to reset it
nmap <buffer> \c :setlocal commentstring=<!--\ %s\ -->

" Setext style headers
nmap <buffer> <localleader>h yypVr=
nmap <buffer> <localleader>j yypVr-

" Atx style Headers
nmap <buffer> <localleader>1 I# <ESC>$F#xd0i#<ESC>0
nmap <buffer> <localleader>2 I# <ESC>$F#xd0i##<ESC>0
nmap <buffer> <localleader>3 I# <ESC>$F#xd0i###<ESC>0
nmap <buffer> <localleader>4 I# <ESC>$F#xd0i####<ESC>0
nmap <buffer> <localleader>5 I# <ESC>$F#xd0i#####<ESC>0

" Text styling Bold Italic Fixed-width
" Note: "_yiw moves cursor to the beginning of the word
nmap <buffer> <localleader>b "_yiWi**<ESC>lEa**<ESC>
nmap <buffer> <localleader>i "_yiWi*<ESC>lEa*<ESC>
nmap <buffer> <localleader>f "_yiWi`<ESC>lEa`<ESC>

vmap <buffer> <localleader>b s**<C-r>"**<ESC>
vmap <buffer> <localleader>i s*<C-r>"*<ESC>
vmap <buffer> <localleader>f s`<C-r>"`<ESC>

" HTML Keyboard Wrapper
nmap <buffer> <localleader>k "_yiwcw<kbd><C-r>"</kbd><ESC>

" Table Heading
nmap <buffer> <localleader>t yypV:s/[^\|]/-/g<cr>:noh<cr>yypV:s/-/ /g<cr>:noh<cr>

"Links
nmap <buffer> <localleader>[ yiwi[<ESC>Ea](<C-r>")<ESC>
nmap <buffer> <localleader>l lBi<<ESC>Ea><ESC>

vmap <buffer> <localleader>[ s[<C-r>"]()<ESC>i
vmap <buffer> <localleader>l s<<C-r>"><ESC>

"vim-marked command
nnoremap <buffer> <C-k>v :MarkedOpen<cr>
nnoremap <buffer> <C-k>r :silent !~/redcarpet/render.rb '%' && open '%:r'.html<cr>
nnoremap <buffer> <C-k>k :silent !~/kramdown/render.rb '%' && open '%:r'.html<cr>
nnoremap <buffer> <C-k>d :update<cr>:!pandoc -f markdown+yaml_metadata_block+simple_tables '%' -o %:r.docx && open %:r.docx<cr>
