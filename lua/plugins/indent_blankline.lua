return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		exclude = {
			buftypes = { "terminal" },
			filetypes = { "help", "packer", "dashboard", "neogitstatus" },
		},
		scope = {
			enabled = false,
		},
	},
	config = function ()
		vim.opt.list = true
		vim.opt.listchars = {
			space = "⋅",
			tab = "▸ ",
			extends = "❯",
			precedes = "❮",
			trail = "•",
			eol = "↴",
		}
	end
}
