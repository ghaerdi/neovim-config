return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function ()
		local harpoon_ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>h", function()
			harpoon_ui.toggle_quick_menu()
		end)
		vim.keymap.set("n", "<leader>ha", function()
			require("harpoon.mark").add_file()
		end)
		local nav_file = function(index)
			return function()
				harpoon_ui.nav_file(index)
			end
		end
		vim.keymap.set("n", "<A-h>", nav_file(1))
		vim.keymap.set("n", "<A-j>", nav_file(2))
		vim.keymap.set("n", "<A-k>", nav_file(3))
		vim.keymap.set("n", "<A-l>", nav_file(4))
	end
}
