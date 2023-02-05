require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,

	-- enable indentation
	indent = { enable = true },

	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
