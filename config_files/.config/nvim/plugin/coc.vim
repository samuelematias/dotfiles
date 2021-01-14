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
