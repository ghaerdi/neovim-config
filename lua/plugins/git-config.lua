return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_message_template = " <author>  <date>  <summary>"
			vim.g.gitblame_date_format = "%r"
			require("gitblame").setup()
		end,
	},
	{ "tpope/vim-fugitive" },
}
