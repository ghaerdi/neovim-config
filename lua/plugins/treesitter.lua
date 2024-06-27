return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				indent = { enable = true },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function ()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				show_all_context = true,
				patterns = {
					default = {
						"function",
						"method",
						"for",
						"while",
						"if",
						"switch",
						"case",
					},
					rust = {
						"loop_expression",
						"impl_item",
					},
					typescript = {
						"class_declaration",
						"abstract_class_declaration",
						"else_clause",
					},
				},
			})
		end
	},
}
