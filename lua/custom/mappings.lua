local M = {}

M.disabled = {
	n = {
		["<leader>wK"] = "", -- unmap which-key mapped by nvchad
		["<leader>wk"] = "", -- unmap which-key mapped by nvchad
		["<leader>fw"] = "", -- unmap find live_grep mapped by nvchad
		["<leader>tk"] = "", -- unmap telescope keymaps
		["<leader>gt"] = "", -- unmap git status 
		["<leader>cm"] = "", -- unmap git commits
		["<Space>"] = "",
		["<leader>b"] = "",
	},
}

M.editing = {
	i = {
		-- Press jj fast to exit insert mode
		["jj"] = { "<Esc>", " exit insert mode", { nowait = true } },
	},

  -- v = {
  --   ["<TAB>"] = { "<cmd> > <CR>" },
  -- },

	-- n = {
	-- 	-- Use space only as leader key
	-- 	-- save file
	-- 	["<leader>w"] = { "<Esc>:w<CR>", " save file", { nowait = true } },
	-- 	-- Move text
	-- 	["<A-Down>"] = { "<Esc>:m .+1<CR>", " move line down" },
	-- 	["<A-Up>"] = { "<Esc>:m .-2<CR>", " move line up" },
	-- 	-- remember that swap lines is `ddp`
 --
	-- 	-- Duplicate lines
	-- 	["<A-S-Down>"] = { "yyp", " copy line down" },
	-- 	["<A-S-Up>"] = { "yyP", " copy line up" },
 --
	-- 	-- Enter a new line without entering insert mode
	-- 	["<A-o>"] = { "o<Esc>", "- insert a new line" },
	-- },
}

return M
