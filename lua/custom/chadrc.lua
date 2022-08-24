-- make sure you maintain the structure of `core/default_config.lua` here,
--
local M = {}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
  transparency = true,
	theme = "gruvbox",
}

return M
