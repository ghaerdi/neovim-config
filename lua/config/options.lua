local opt = vim.opt

-- set termguicolors
opt.termguicolors = true

-- relative numbers
opt.relativenumber = true
opt.nu = true

-- search
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true

-- tabs & identation
opt.smartindent = true -- make indenting smarter again
opt.autoindent = true
opt.cindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- clipboard
opt.clipboard:append("unnamedplus")

-- line wrapping
opt.wrap = false

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- keywords
opt.iskeyword:append("-")

-- persist undo history
opt.undofile = true

-- Dont make backups
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.signcolumn = "yes"
