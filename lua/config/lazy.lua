local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		priority = 1000
	},
	{ "pocco81/auto-save.nvim" },
	{ "gen740/SmoothCursor.nvim" },
	{ "karb94/neoscroll.nvim"},
	{ "norcalli/nvim-colorizer.lua" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "folke/which-key.nvim" },

	-- autocompletion
	{ "hrsh7th/nvim-cmp" }, -- completion plugin
	{ "hrsh7th/cmp-buffer" }, -- source for text in buffer
	{ "hrsh7th/cmp-path" }, -- source for file system paths
	{ "github/copilot.vim" }, -- github copilot

	-- snippets
	{ "L3MON4D3/LuaSnip" }, -- snippet engine
	{ "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
	{ "rafamadriz/friendly-snippets" }, -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	{ "williamboman/mason.nvim" }, -- in charge of managing lsp servers, linters & formatters
	{ "williamboman/mason-lspconfig.nvim" }, -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	{ "neovim/nvim-lspconfig" }, -- easily configure language servers
	{ "hrsh7th/cmp-nvim-lsp" }, -- for autocompletion
	{ { "glepnir/lspsaga.nvim", branch = "main" } }, -- enhanced lsp uis
	{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion
	{ { "j-hui/fidget.nvim", tag = "legacy" } },

	-- formatting & linting
	{ "joechrisellis/lsp-format-modifications.nvim" },
	-- { "jose-elias-alvarez/null-ls.nvim" },, -- configure formatters & linters
	-- { "jayp0521/mason-null-ls.nvim" },, -- bridges gap b/w mason & null-ls

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground" },
	{ "romgrk/nvim-treesitter-context" },

	-- telescope
	{ { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } } },

	-- auto closing
	{ "windwp/nvim-autopairs" }, -- autoclose parens, brackets, quotes, etc...
	{ { "windwp/nvim-ts-autotag", lazy = false } }, -- autoclose tags

	-- git integration
	{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
	{ "f-person/git-blame.nvim" },

	-- blazingly fast file switching
	{ { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } } },

	-- tmux
	{ 'christoomey/vim-tmux-navigator' },

	-- project directory tree
	{ { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } } },

	-- funny
	{ "eandrju/cellular-automaton.nvim" },
}

require("lazy").setup(plugins)
