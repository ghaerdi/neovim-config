vim.o.background = "dark" -- or "light" for light mode

require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = false,
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

vim.cmd([[colorscheme gruvbox]])

local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
end

local SCColor = "#FE8019" -- TODO: Use a color of the colorscheme to change the color automatically

hl("SCCursorHead", {
		bg = nil,
		fg = SCColor
})

hl("SCCursor", {
		bg = nil,
		fg = SCColor
})

hl("GitSignsAdd", {
		bg = nil,
		fg = "#B8BB26"
})

hl("GitSignsChange", {
		bg = nil,
		fg = "#8EC07C"
})

hl("GitSignsDelete", {
		bg = nil,
		fg = "#FB4934"
})

-- hl("DiagnosticSignInfo", {
-- 		bg = "none"
-- })

hl("DiagnosticSignWarn", {
		bg = nil,
		fg = "#FABD2F"
})

hl("DiagnosticSignHint", {
		bg = nil,
		fg = "#8EC07C"
})

hl("DiagnosticSignError", {
		bg = nil,
		fg = "#FB4934"
})
