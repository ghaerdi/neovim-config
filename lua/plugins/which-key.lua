local delete_current_file = function()
	vim.cmd("!rm %")
	vim.cmd("bd")
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>?",  function() require("which-key").show({ global = false }) end, desc = "show all keymaps" },
		{ "<leader>b",  group = "buffer" },
		{ "<leader>bN", "<cmd>enew<CR>",                                              desc = "New buffer" },
		{ "<leader>b[", "<cmd>bp<CR>",                                                desc = "Previous buffer" },
		{ "<leader>b]", "<cmd>bn<CR>",                                                desc = "Next buffer " },
		{ "<leader>bl", "<C-^>",                                                      desc = "Switch to last buffer" },
		{ "<leader>bn", "<cmd>bn<CR>",                                                desc = "Next buffer" },
		{ "<leader>bp", "<cmd>bn<CR>",                                                desc = "Next buffer" },
		{ "<leader>c",  group = "code" },
		{ "<leader>f",  group = "file" },
		{ "<leader>fd", function() delete_current_file() end,                         desc = "Delete current file" },
		{ "<leader>g",  group = "git" },
		{ "<leader>s",  group = "search" },
		{ "<leader>w",  group = "window" },
		{ "<leader>w=", "<C-W>=",                                                     desc = "balance-windows" },
		{ "<leader>w?", "Windows",                                                    desc = "fzf-window" },
		{ "<leader>wH", "<C-W>5<",                                                    desc = "expand-window-left" },
		{ "<leader>wJ", ":resize +5",                                                 desc = "expand-window-below" },
		{ "<leader>wK", ":resize -5",                                                 desc = "expand-window-up" },
		{ "<leader>wL", "<C-W>5>",                                                    desc = "expand-window-right" },
		{ "<leader>wO", "<C-W>o",                                                     desc = "close other windows" },
		{ "<leader>wS", "<C-W>s",                                                     desc = "split and focus window below" },
		{ "<leader>wV", "<C-W>v",                                                     desc = "split and focus window right" },
		{ "<leader>wW", "<C-W>W",                                                     desc = "prev-window" },
		{ "<leader>wc", "<C-W>c",                                                     desc = "delete-window" },
		{ "<leader>wd", "<C-W>c",                                                     desc = "delete-window" },
		{ "<leader>wh", "<C-W>h",                                                     desc = "window-left" },
		{ "<leader>wj", "<C-W>j",                                                     desc = "window-below" },
		{ "<leader>wk", "<C-W>k",                                                     desc = "window-up" },
		{ "<leader>wl", "<C-W>l",                                                     desc = "window-right" },
		{ "<leader>ws", "<C-W>s<C-W>W",                                               desc = "split window below" },
		{ "<leader>wv", "<C-W>v<C-W>W",                                               desc = "split window right" },
		{ "<leader>ww", "<C-W>w",                                                     desc = "next-window" },
	},
}
