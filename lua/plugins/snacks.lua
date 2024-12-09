return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
		dashboard = {
			enabled = false,
			sections = {
				{
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
				-- {
				-- 	section = "terminal",
				-- 	cmd = "ascii-image-converter ~/Pictures/jellyfish.png -C",
				-- 	pane = 2,
				-- 	random = 10,
				-- 	indent = 4,
				-- 	height = 30,
				-- 	padding = 1,
				-- },
			},
		},
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = {
			enabled = true, -- enable/disable the plugin
			debounce = 200, -- time in ms to wait before updating
		},
  },
}
