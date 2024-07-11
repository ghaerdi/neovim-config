return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>hh",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle Harpoon",
		},
		{
			"<leader>ha",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add file to Harpoon",
		},
		{
			"<A-h>",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Navigate to Harpoon file 1",
		},
		{
			"<A-j>",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Navigate to Harpoon file 2",
		},
		{
			"<A-k>",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Navigate to Harpoon file 3",
		},
		{
			"<A-l>",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Navigate to Harpoon file 4",
		},
	},
}
