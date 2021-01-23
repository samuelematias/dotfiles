" coc
" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-git',
            \'coc-flutter',
            \]

nnoremap <leader>p/ :CocSearch 

" Coc-flutter
nnoremap <leader>fc :CocList --input=flutter commands<cr>
nnoremap <leader>fdev :CocCommand flutter.run --flavor dev -t lib/main_dev.dart -d all<cr>
nnoremap <leader>fprod :CocCommand flutter.run --flavor prod -t lib/main_prod.dart -d all<cr>

" Coc-flutter Actions (e.g., Wrap Widget)
nmap <silent><leader>ca <Plug>(coc-codelens-action)
vmap <silent><leader>a  <Plug>(coc-codeaction-selected)
nmap <silent><leader>a  <Plug>(coc-codeaction)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gtd <Plug>(coc-definition)
nmap <silent> gty <Plug>(coc-type-definition)
nmap <silent> gti <Plug>(coc-implementation)
nmap <silent> gtr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
