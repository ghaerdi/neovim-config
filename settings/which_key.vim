" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" By default timeoutlen is 1000 ms
set timeoutlen=2000

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['F'] = [ ':CocCommand prettier.formatFile', 'Format current file' ]
let g:which_key_map['T'] = [ 'gg=G'                           , 'Indent current file' ]
let g:which_key_map['.'] = [ ':Files'                         , 'Find file' ]
let g:which_key_map[','] = [ ':Buffers'                       , 'Find buffer' ]
let g:which_key_map['n'] = [ ':NERDTreeToggle'                , 'Toggle nerd tree' ]

" file
let g:which_key_map.f = {
      \ 'name' : '+file'                          ,
      \ 'D' : [':!rm %'     , 'Delete this file'] ,
      \ 'f' : [':Files'     , 'Find file']        ,
      \ 'r' : [':Buffers'   , 'Recent files']     ,
      \ 's' : [':w'         , 'Save file']        ,
      \ }

" toggle
let g:which_key_map.t = {
      \ 'name' : '+toggle'                                 ,
      \ 't' : [':NERDTreeToggle'     , 'Toggle nerd tree'] ,
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search - fzf'                      ,
      \ '/' : [':History/'     , 'history']           ,
      \ ';' : [':Commands'     , 'commands']          ,
      \ 'a' : [':Ag'           , 'text Ag']           ,
      \ 'b' : [':BLines'       , 'current buffer']    ,
      \ 'B' : [':Buffers'      , 'open buffers']      ,
      \ 'c' : [':Commits'      , 'commits']           ,
      \ 'C' : [':BCommits'     , 'buffer commits']    ,
      \ 'f' : [':Files'        , 'files']             ,
      \ 'g' : [':GFiles'       , 'git files']         ,
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history']      ,
      \ 'H' : [':History:'     , 'command history']   ,
      \ 'l' : [':Lines'        , 'lines']             ,
      \ 'm' : [':Marks'        , 'marks']             ,
      \ 'M' : [':Maps'         , 'normal maps']       ,
      \ 'p' : [':Helptags'     , 'help tags']         ,
      \ 'P' : [':Tags'         , 'project tags']      ,
      \ 's' : [':Snippets'     , 'snippets']          ,
      \ 'S' : [':Colors'       , 'color schemes']     ,
      \ 't' : [':Rg'           , 'text Rg']           ,
      \ 'T' : [':BTags'        , 'buffer tags']       ,
      \ 'w' : [':Windows'      , 'search windows']    ,
      \ 'y' : [':Filetypes'    , 'file types']        ,
      \ 'z' : [':FZF'          , 'FZF']               ,
      \ }

" Buffers
let g:which_key_map.b = {
      \ 'name' : '+buffer'                                   ,
      \ '[' : [':bp'           , 'Previous buffer']          ,
      \ ']' : [':bn'           , 'Next buffer']              ,
      \ 'b' : [':Buffers'      , 'Switch buffer']            ,
      \ 'B' : [':Buffers'      , 'Switch buffer']            ,
      \ 'd' : [':bdelete'      , 'Kill buffer']              ,
      \ 'k' : [':bdelete'      , 'Kill buffer']              ,
      \ 'K' : [':%bdelete'     , 'Kill all buffers']         ,
      \ 'l' : ['<C-^>'         , 'Switch to last buffer']    ,
      \ 'n' : [':bn'           , 'Next buffer']              ,
      \ 'O' : [':%bdelete|e#'  , 'Kill other buffers']       ,
      \ 'p' : [':bp'           , 'Previous buffer']          ,
      \ }

" Windows
let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ '=' : ['<C-W>='     , 'balance-windows']       ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ 'c' : ['<C-W>c'     , 'delete-window']         ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'J' : [':resize +5' , 'expand-window-below']   ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'K' : [':resize -5' , 'expand-window-up']      ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'O' : ['<C-W>o'     , 'close other windows']   ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ 'w' : ['<C-W>w'     , 'next-window']           ,
      \ 'W' : ['<C-W>W'     , 'prev-window']           ,
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
