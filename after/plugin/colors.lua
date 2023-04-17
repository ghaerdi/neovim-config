local gruvbox_status, gruvbox = pcall(require, "gruvbox")
if not gruvbox_status then
	return
end

gruvbox.setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		operators = false,
		comments = false,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	transparent_mode = true,
})

vim.o.background = "dark" -- or "light" for light mode

vim.cmd([[colorscheme gruvbox]])

local hl = function(thing, opts)
	vim.api.nvim_set_hl(0, thing, opts)
end

hl("SCCursorHead", {
	bg = nil,
	fg = "#FE8019" -- TODO: use a color from colorscheme or pick a neutral color
})

hl("SCCursor", {
	bg = nil,
	fg = "#B15911", -- TODO: use a color from colorscheme or pick a neutral color
})

hl("GitSignsAdd", {
	bg = nil,
	fg = "#B8BB26",
})

hl("GitSignsChange", {
	bg = nil,
	fg = "#8EC07C",
})

hl("GitSignsDelete", {
	bg = nil,
	fg = "#FB4934",
})

hl("GitBlame", {
	fg = "#5E554B",
})

hl("DiagnosticSignWarn", {
	bg = nil,
	fg = "#FABD2F",
})

hl("DiagnosticSignHint", {
	bg = nil,
	fg = "#8EC07C",
})

hl("DiagnosticSignError", {
	bg = nil,
	fg = "#FB4934",
})
