local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	lightbulb = {
		enable = false,
	},

	outline = {
		win_width = 40,
	},

	ui = {
		colors = {
			normal_bg = "#32302f",
		},
	},

	symbol_in_winbar = {
		enable = false,
	},
})
