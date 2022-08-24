local M = {}

M.user = {
  ["Pocco81/auto-save.nvim"] = {
    enable = true,
    config = function()
      require("auto-save").setup {}
    end
  },

  ["goolord/alpha-nvim"] = {
     disable = false,
   },


	["folke/which-key.nvim"] = {
		disable = false,
		config = function()
			require("plugins.configs.whichkey")
			require("custom.plugins.whichkey").register()
		end,
	},

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.plugins.lspconfig")
    end,
  },

  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      -- web
      "html-lsp",
      "css-lsp",
      "emmet-ls",
      "tailwindcss-language-server",
      "typescript-language-server",
      "json-lsp",

      -- rust
      "rust-analizer",

      -- lua
      "lua-language-server",
    },
  },
}

M.override = {
	["folke/which-key.nvim"] = require("custom.plugins.whichkey").options(),
}

return M
