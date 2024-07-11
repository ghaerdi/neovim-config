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
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				transparent_mode = not vim.g.neovide,
			})
			vim.o.background = "dark" -- or "light" for light mode
			local hl = function(thing, opts)
				vim.api.nvim_set_hl(0, thing, opts)
			end

			hl("SCCursorHead", { link = "GruvboxOrange" })
			hl("SCCursor", { link = "GruvboxOrange" })

			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require('lualine').setup()
		end
	},
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup({
				cursor = "",
				texthl = "SCCursorHead",
				linehl = nil,
				type = "exp",
				fancy = {
					enable = true,
					head = { cursor = "", texthl = "SCCursorHead" },
					body = {
						{ cursor = "●", texthl = "SCCursor" },
						{ cursor = "●", texthl = "SCCursor" },
						{ cursor = "•", texthl = "SCCursor" },
						{ cursor = "•", texthl = "SCCursor" },
						{ cursor = "∙", texthl = "SCCursor" },
						{ cursor = "∙", texthl = "SCCursor" },
					},
				},
				speed = 20,           -- max is 100 to stick to your current position
				intervals = 15,       -- tick interval
				threshold = 1,        -- animate if threshold lines jump
				disable_float_win = true, -- disable on float window
			})
		end,
	},
}
