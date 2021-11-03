" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


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
let g:which_key_map['F'] = [ ':CocCommand prettier.formatFile', 'format current file' ]
let g:which_key_map['T'] = [ 'gg=G'                           , 'indent current file' ]
let g:which_key_map['t'] = [ ':Rg'                            , 'find text' ]
let g:which_key_map['f'] = [ ':Files'                         , 'find file' ]
let g:which_key_map['b'] = [ ':Buffers'                       , 'find buffer' ]
let g:which_key_map['n'] = [ ':NERDTreeToggle'                , 'toggle nerd tree']

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

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5' , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5' , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
