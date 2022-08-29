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
    config = function()
      require("custom.plugins.mason")
    end,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("custom.plugins.nvimtree")
    end,
    setup = function()
      require("core.utils").load_mappings("nvimtree")
    end,
  },
}

M.override = {
	["folke/which-key.nvim"] = require("custom.plugins.whichkey").options(),
}

return M
