" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Load Plugins with vim-plug
call plug#begin(expand('~/.config/nvim/plugged'))

" General plugins
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
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
Plug 'natebosch/dartlang-snippets'

" Coc.vim plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " cool start up screen
Plug 'mhinz/vim-startify'

"MarkDown Preview for VIM
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

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

" Load VIM Configs
source ~/.config/nvim/settings.vim

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

" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']

"" startify
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'dir'       },
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands' },
    \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'d': '~/.dotfiles' }
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]

" custom banner
let g:startify_custom_header = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '',
 \]
