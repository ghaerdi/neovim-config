local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_status then
	return
end

vim.opt.list = true
vim.opt.listchars = {
	space = "⋅",
	tab = "▸ ",
	extends = "❯",
	precedes = "❮",
	trail = "•",
	eol = "↴",
}

indent_blankline.setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "help", "packer", "dashboard", "neogitstatus" },
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = false,
	show_current_context_start = false,
	char_highlight_list = {
		"GitBlame",
	},
	space_char_highlight_list = {
		"GitBlame",
	},
	-- show_first_indent_level = false,
	-- show_trailing_blankline_indent = false,
})
