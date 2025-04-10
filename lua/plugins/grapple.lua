return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" }
	},
	opts = {
		scope = "git_branch"
	},
	keys = {
		{ "<leader>hf", "<cmd>Grapple toggle<cr>",          desc = "Tag a file" },
		{ "<leader>hh", "<cmd>Grapple toggle_tags<cr>",     desc = "Toggle tags menu" },

		{ "<A-h>",      "<cmd>Grapple select index=1<cr>",  desc = "Select first tag" },
		{ "<A-j>",      "<cmd>Grapple select index=2<cr>",  desc = "Select second tag" },
		{ "<A-k>",      "<cmd>Grapple select index=3<cr>",  desc = "Select third tag" },
		{ "<A-l>",      "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tag" },

		{ "<A-n>",      "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<A-p>",      "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	}
}
