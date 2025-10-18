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
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			-- Smear cursor when switching buffers or windows.
			smear_between_buffers = true,

			-- Smear cursor when moving within line or to neighbor lines.
			-- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
			smear_between_neighbor_lines = true,

			-- Draw the smear in buffer space instead of screen space when scrolling
			scroll_buffer_space = true,

			-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
			-- Smears will blend better on all backgrounds.
			legacy_computing_symbols_support = false,

			-- Smear cursor in insert mode.
			-- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
			smear_insert_mode = true,
		},
	}
}
