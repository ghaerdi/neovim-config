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

-- local split = function(value, separator)
--   local result = {}
--   for str in string.gmatch(value, "([^"..separator.."]+)") do
--     table.insert(result, str)
--   end
--   return result
-- end
--
-- local currect_directory = function ()
--   local buffer_path = vim.fn.expand("%")
--   local splited_path = split(buffer_path, "/")
--   table.remove(splited_path)
--   local buffer_dir = table.concat(splited_path, "/") .. "/"
--
--   local result = ":!mv % "  .. buffer_dir
--   print(result)
--   return result
-- end

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
      [">"] = { function() telescope_find_files(false) end, "Find files in project" },
      ["."] = { "<cmd> Telescope fd <CR>", "Find files" },
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

      c = {
        name = "code",
        x = { "<cmd>Telescope diagnostics<CR>", "show errors"},
        t = { "<cmd>Telescope treesitter<CR>", "Treesitter" },
				w = { "<cmd>Telescope grep_string<cr>", "grep word under cursor" },
      },

			f = {
				name = "file",
				a = { function() telescope_find_files(true) end, "all files in project" },
        D = { delete_current_file, "delete this file" },
        f = { "<cmd> Telescope fd <CR>", "Find files" },
        t = { "<cmd>Telescope treesitter<CR>", "Treesitter" },
				w = { "<cmd>Telescope grep_string<cr>", "grep word under cursor" },
				p = { function() telescope_find_files(false) end, "Find files in project" },
				P = { function() telescope_find_files(true) end, "all files in project" },
        -- r = { currect_directory, "Rename/move current buffer"}
			},

			g = {
				name = "git",
				b = { "<cmd> Telescope git_branches <CR>", "branches" },
				c = { "<cmd> Telescope git_commits <CR>", "commits" },
				C = { "<cmd> Telescope git_commits <CR>", "see commits of current buffer" },
				s = { "<cmd> Telescope git_status <CR>", "status" },
				S = { "<cmd> Telescope git_stash <CR>", "stash" },
			},

      s = {
        name = "search",
        d = { "<cmd> Telescope live_grep <CR>", "Search current directory"},
				w = { "<cmd>Telescope grep_string<cr>", "grep word under cursor" },
      },

      t = {
        name = "toggle",
        t = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
      },

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
