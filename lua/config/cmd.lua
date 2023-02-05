local cmd = vim.cmd

-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

cmd([[
	augroup LastPosition
		autocmd!
  	autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
	augroup end
]])

-- cmd([[
-- 	augroup Ident Javascript
-- 		autocmd!
-- 		autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
-- 	augroup end
-- ]])
--
-- cmd([[
-- 	augroup Ident Typescript
-- 		autocmd!
-- 		autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
-- 	augroup end
-- ]])
--
-- cmd([[
-- 	augroup Ident HTML
-- 		autocmd!
-- 		autocmd FileType html setlocal shiftwidth=2 tabstop=2
-- 	augroup end
-- ]])
