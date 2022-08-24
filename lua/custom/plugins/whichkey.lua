local cmd = vim.api.nvim_command

local M = {}

local telescope_find_files = function(show_all)
  local project_directory = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  require'telescope.builtin'.find_files({
    cwd = project_directory,
    no_ignore = show_all,
    hidden = show_all,
  })
end

local delete_current_file = function()
  cmd("!rm %")
  cmd("bd")
end

M.register = function()
	local ok, wk = pcall(require, "which-key")

	if not ok then
		return
	end

	wk.register({
		["<leader>"] = {
      -- ["<TAB>"] = {
      --   name = "workspaces",
      -- },

      ["."] = { function() telescope_find_files(false) end, "Find files" },
      [","] = { "<cmd> Telescope buffers <CR>", "Switch buffer" },

      b = {
        name = "buffer",
        ["["] = { "<cmd>bp<CR>", "Previous buffer" },
        ["]"] = { "<cmd>bn<CR>", "Next buffer "},
        b = { "<cmd>Telescope buffers<CR>", "Switch buffer" },
        d = { "<cmd>bd<CR>", "Kill buffer" },
        k = { "<cmd>bd<CR>", "Kill buffer" },
        K = { "<cmd>%bd<CR>", "Kill all buffers" },
        l = { "<C-^>", "Switch to last buffer" },
        n = { "<cmd>bn<CR>", "Next buffer" },
        N = { "<cmd>enew<CR>", "New buffer" },
        O = { "<cmd>%bd|e#|bd#<CR>", "Kill other buffers" },
        p = { "<cmd>bn<CR>", "Next buffer"},
      },

      -- c = {
      --   name = "code",
      -- },

			f = {
				name = "file",
				a = { function() telescope_find_files(true) end, "all files in project" },
        d = { "<cmd>Telescope fd<CR>", "find files in directory" },
        D = { delete_current_file, "delete this file" },
        f = { function() telescope_find_files(false) end, "Find files" },
				-- g = { "", "live grep" },
				-- h = { "help pages" },
				-- o = { "old files" },
				-- p = { "<cmd>Telescope projects<cr>", "projects" },
				-- s = { "<cmd>Telescope symbols<cr>", "symbols" },
				-- w = { "<cmd>Telescope grep_string<cr>", "grep word under cursor" },
				-- x = {
				-- 	name = "other",
				-- 	a = { "<cmd>Telescope autocommands<cr>", "vim autocommands" },
				-- 	c = { "<cmd>Telescope commands<cr>", "vim commands" },
				-- 	e = { "<cmd>Telescope env<cr>", "environment vars" },
				-- 	k = { "<cmd>Telescope keymaps<cr>", "normal mode keymaps" },
				-- 	o = { "<cmd>Telescope vim_options<cr>", "vim options" },
				-- },
			},

			g = {
				name = "git",
				b = { "<cmd> Telescope git_branches <CR>", "branches" },
				c = { "<cmd> Telescope git_commits <CR>", "commits" },
				s = { "<cmd> Telescope git_status <CR>", "status" },
			},

      -- h = {
      --   name = "help"
      -- },

      -- i = {
      --   name = "insert"
      -- },

      -- n = {
      --   name = "notes"
      -- },

      -- o = {
      --   name = "open"
      -- },

      -- p = {
      --   name = "project"
      -- },

      -- q = {
      --   name = "quit/session"
      -- },

      -- s = {
      --   name = "search"
      -- },

      -- t = {
      --   name = "toggle"
      -- },

      w = {
        name = "window",
        ["="] = { "<C-W>=", "balance-windows" },
        ["?"] = { "Windows", "fzf-window" },
        c = { "<C-W>c", "delete-window" },
        d = { "<C-W>c", "delete-window" },
        h = { "<C-W>h", "window-left" },
        H = { "<C-W>5<", "expand-window-left" },
        j = { "<C-W>j", "window-below" },
        J = { ":resize +5", "expand-window-below" },
        k = { "<C-W>k", "window-up" },
        K = { ":resize -5", "expand-window-up" },
        l = { "<C-W>l", "window-right" },
        L = { "<C-W>5>", "expand-window-right" },
        O = { "<C-W>o", "close other windows" },
        s = { "<C-W>s<C-W>W", "split window below" },
        S = { "<C-W>s", "split and focus window below" },
        v = { "<C-W>v<C-W>W", "split window right" },
        V = { "<C-W>v", "split and focus window right" },
        w = { "<C-W>w", "next-window" },
        W = { "<C-W>W", "prev-window" },
      },

			["?"] = {
				function()
					vim.cmd("WhichKey")
				end,
				"show all keymaps",
			},
		},
	})
end

M.options = function()
	local opt = {}

	opt.icons = {
		group = "",
	}

	return opt
end

return M
