local nvtem_status, nvterm = pcall(require, "nvterm")
if not nvtem_status then
	return
end

local nvterm_terminal_status, nvterm_terminal = pcall(require, "nvterm.terminal")
if not nvterm_terminal_status then
	return
end

nvterm.setup()

local toggle_modes = { "n", "t" }
local mappings = {
	{
		toggle_modes,
		"<A-s>",
		function()
			nvterm_terminal.toggle("horizontal")
		end,
	},
	{
		toggle_modes,
		"<A-v>",
		function()
			nvterm_terminal.toggle("vertical")
		end,
	},
	{
		toggle_modes,
		"<A-i>",
		function()
			nvterm_terminal.toggle("float")
		end,
	},
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
