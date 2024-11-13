return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
		"BufReadPre " .. vim.fn.expand "~" .. "/Documents/obsidian_vault/*.md",
		"BufNewFile " .. vim.fn.expand "~" .. "/Documents/obsidian_vault/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian_vault",
      },
    },
		completion = {
			nvim_cmp = true,
			min_chars = 2
		},
		mappings = {
			["gd"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			}
		},
		notes_subdir = "05 - Fleeting",
		ui = {
			enable = true,
			update_debounce = 200,
			max_file_length = 5000,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
			},
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				ObsidianTodo = { bold = true, link = "GruvboxGray" },
				ObsidianDone = { bold = true, link = "GruvboxBlue" },
				ObsidianRightArrow = { bold = true, link = "GruvboxYellow" },
				ObsidianTilde = { bold = true, link = "GruvboxOrange" },
				ObsidianImportant = { bold = true, link = "GruvboxRed" },
				ObsidianBullet = { bold = true, link = "GruvboxBlue" },
				ObsidianRefText = { underline = true, link = "GruvboxPurple" },
				ObsidianExtLinkIcon = { link = "GruvboxPurple" },
				ObsidianTag = { italic = true, link = "GruvboxBlue" },
				ObsidianBlockID = { italic = true, link = "GruvboxBlue" },
				ObsidianHighlightText = { link = "GruvboxYellow" },
			},
		},
  } 
}
