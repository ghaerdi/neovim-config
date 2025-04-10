-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=300}
  augroup end
]])

-- Preserve cursor position when opening files
vim.cmd([[
	augroup LastPosition
		autocmd!
  	autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
	augroup end
]])
