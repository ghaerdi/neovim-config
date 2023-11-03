local ibl_status, ibl = pcall(require, "ibl")
if not ibl_status then
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

ibl.setup({
	exclude = {
		buftypes = { "terminal" },
		filetypes = { "help", "packer", "dashboard", "neogitstatus" },
	},
	scope = {
		enabled = false,
		highlight = {
			"GitBlame",
		}
	},
	indent = {
		highlight = {
			"GitBlame",
		}
	},
	whitespace = {
		highlight = {
			"GitBlame",
		}
	}
})
