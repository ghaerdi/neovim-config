return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "startup" },
				-- {
				-- 	section = "terminal",
				-- 	cmd = "ascii-image-converter ~/Pictures/sukuna-chibi.png -C -c",
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
    words = { enabled = false },
  },
}
