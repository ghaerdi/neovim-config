local hl = function(thing, opts)
	vim.api.nvim_set_hl(0, thing, opts)
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.neovide_transparency = 0.98
			require("gruvbox").setup({
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					operators = false,
					comments = true,
					folds = false,
					emphasis = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				transparent_mode = not vim.g.neovide,
			})
			vim.o.background = "dark" -- or "light" for light mode

			hl("SCCursorHead", { link = "GruvboxOrange" })
			hl("SCCursor", { link = "GruvboxOrange" })

			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		priority = 1000,
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat",
					"NvimTreeNormal"
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end
	}
}
