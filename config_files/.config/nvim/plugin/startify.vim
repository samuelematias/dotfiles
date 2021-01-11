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