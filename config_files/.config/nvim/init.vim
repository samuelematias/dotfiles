call plug#begin()

" General plugins
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
" Plug 'sheerun/vim-polyglot' " remove because this error 'Some plugin change completeopt on insert mode: Last set from ~/.config/nvim/plugged/vim-lsc/autoload/lsc/complete.vim line 132!'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
source ~/.config/nvim/plug/airline.vim

" Dart plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" Coc.vim plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Flutter plugin
Plug 'thosakwe/vim-flutter'

call plug#end()

" Vim configs
set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set wildcharm=<C-z> " to enable <Tab> on nnoremap

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'

" Vim-lsc
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '', 'NextReference': '', 'PreviousReference': ''} " disable the LSClientPReviousReference(PreviousReference) <c-p> to be able to use on :File <c-p>
let g:lsc_reference_highlights = v:false

" Dart-plugin 
let dart_format_on_save = 1
let dart_style_guide = 2

" Rainbow
let g:rainbow_active = 1

" Dracula theme
packadd! dracula
syntax enable
colorscheme dracula
let g:netrw_dirhistmax=0

" Set cursor always in shape block (normal/visual/insert mode)
:set guicursor=n-v-c:block,i-ci-ve:block

" Keybindings (that line down)
let mapleader="\<space>"

" Vim-flutter
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Coc-flutter
nnoremap <leader>fc :CocList --input=flutter commands<cr>
nnoremap <leader>fdev :CocCommand flutter.run --flavor dev -t lib/main_dev.dart -d all<cr>
nnoremap <leader>fprod :CocCommand flutter.run --flavor prod -t lib/main_prod.dart -d all<cr>

" Reload configuration
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>

" File
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

" Project
nnoremap <silent> <leader>pt :NERDTreeToggle<CR>   " open a horizontal split and switch to it (,h)
nnoremap <silent> <leader>pF :NERDTreeFind<CR>   " open a horizontal split and switch to it (,h)
nnoremap <leader>pf :GitFiles<CR>
nnoremap <leader>p/ :CocSearch 
nnoremap <leader>pr :History<CR>
nnoremap <leader>ps :Snippets<CR>
nnoremap <leader>pc :Commands<CR>

" Git
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gl :GV<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gvc :GV!<CR>
nnoremap <leader>gvq :GV?<CR>
nnoremap <leader>gw :Gwrite<CR>

" Buffer
command Bd :up | %bd | e#
nnoremap <Leader><Tab> :e#<CR> " switch to last buffer
nnoremap <leader>bb :Buffers<CR>
"nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bD :Bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>b/ :Lines<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bd :bd<space><C-z>
" nnoremap <Leader>b :buffer <C-z>

" Terminal stuff
:tnoremap <Esc> <C-\><C-n>
