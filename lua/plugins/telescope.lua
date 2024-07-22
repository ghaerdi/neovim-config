local telescope_find_files = function(show_all)
	local project_directory = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	require("telescope.builtin").find_files({
		cwd = project_directory,
		no_ignore = show_all,
		hidden = show_all,
	})
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>>",  function() telescope_find_files(true) end, desc = "Find files in project" },
			{ "<leader>,",  "<cmd> Telescope buffers <CR>",            desc = "Switch buffer" },
			{ "<leader>.",  "<cmd> Telescope fd <CR>",                 desc = "Find files" },
			{ "<leader>bb", "<cmd> Telescope buffers <CR>",            desc = "Switch buffer" },
			{ "<leader>ct", "<cmd> Telescope treesitter <CR>",         desc = "Treesitter" },
			{ "<leader>cx", "<cmd> Telescope diagnostics <CR>",        desc = "show errors" },
			{ "<leader>ff", "<cmd> Telescope fd <CR>",                 desc = "Find files" },
			{ "<leader>ft", "<cmd> Telescope treesitter <CR>",         desc = "Treesitter" },
			{ "<leader>sd", "<cmd> Telescope live_grep <CR>",          desc = "Search current directory" },
			{ "<leader>sw", "<cmd> Telescope grep_string <CR>",        desc = "grep word under cursor" },
			{ "<leader>gC", "<cmd> Telescope git_commits <CR>",        desc = "see commits of current buffer" },
			{ "<leader>gS", "<cmd> Telescope git_stash <CR>",          desc = "stash" },
			{ "<leader>gb", "<cmd> Telescope git_branches <CR>",       desc = "branches" },
			{ "<leader>gc", "<cmd> Telescope git_commits <CR>",        desc = "commits" },
			{ "<leader>gs", "<cmd> Telescope git_status <CR>",         desc = "status" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_ignore_patterns = { "node_modules", "git" },
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" },
				},
				extensions_list = { "themes", "terms" },
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
