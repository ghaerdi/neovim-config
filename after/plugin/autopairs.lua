local nvim_autopairs_status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not nvim_autopairs_status then
	print("nvim-autopairs not installed")
	return
end

nvim_autopairs.setup()
