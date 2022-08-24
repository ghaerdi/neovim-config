local autocmd = vim.api.nvim_create_autocmd
local createGroup = vim.api.nvim_create_augroup

-- Go to last loc when opening a buffer
autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- Disable tabline
autocmd("FileType", { command = [[:set showtabline=0]] })

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = createGroup("YankHighlight", { clear = true }),
})

-- Close nvim if NvimTree is only running buffer
autocmd(
  "BufEnter",
  { command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]] }
)

-- Enable spell checking for certain file types
autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
