""" ENABLE THEME AND SYNTAX
syntax enable

if (has("termguicolors"))
 set termguicolors
endif

""" THEMES
colorscheme gruvbox 
" gruvbox, dogrun,          palenight, nord, OceanicNext
let g:airline_theme = 'base16_gruvbox_dark_soft'
" base16_gruvbox_dark_soft, palenight, nord, oceanicnext

" transparency
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE
hi CursorLineNr ctermbg=NONE guibg=NONE
hi ALEErrorSign ctermbg=NONE guibg=NONE guifg=#E94734
hi ALEWarningSign ctermbg=NONE guibg=NONE guifg=#FABD2F
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi CocHintSign guibg=NONE ctermbg=NONE

" colors
if g:colors_name == 'gruvbox'
    hi CocHintSign guifg=#83A598
    hi ALEErrorSign guifg=#E94734
    hi ALEWarningSign guifg=#FABD2F
elseif g:colors_name == 'dogrun'
    hi LineNr guifg=#40466e
    hi CursorLineNr guifg=#646ca1
endif

""" AIRLINE
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
