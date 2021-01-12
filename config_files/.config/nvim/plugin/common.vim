" clear search results
nnoremap <leader>sc :noh<cr>

" File
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

" Project
nnoremap <leader>pr :History<CR>
nnoremap <leader>ps :Snippets<CR>
nnoremap <leader>pc :Commands<CR>

" Buffer (M = option/alt key)
command Bd :up | %bd | e#
nnoremap <Leader><Tab> :e#<CR> " switch to last buffer
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bD :Bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>b/ :Lines<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bd :bd<space><C-z>
nnoremap <leader>bq :bp <bar> bd! #<cr> " close current buffer
nnoremap <leader>ba :bufdo bd!<cr> " close all open buffers
nnoremap <M-Tab> :bn<CR> " Switching between files (Next)
nnoremap <M-S-Tab> :bp<CR> " Switching between files (Previous)
nnoremap <M-W> :bp <bar> bd! #<CR> " Close current Buffer
nnoremap <M-S-W> :bufdo bd!<CR> " Close All open Buffers

" Terminal stuff
:tnoremap <Esc> <C-\><C-n>

" Reload configuration
nnoremap <leader>sv :source $MYVIMRC<cr>
