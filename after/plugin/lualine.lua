local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
	print("Lualine not installed")
	return
end

lualine.setup()
