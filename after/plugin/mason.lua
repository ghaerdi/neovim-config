local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		-- web
		"html",
		"cssls",
		"emmet_ls",
		"tailwindcss",
		"tsserver",
		"eslint",
		"svelte",

		-- others
		"rust_analyzer",
		"marksman",
		"dockerls",
		"lua_ls",
		"jsonls",
		"yamlls",
		"bashls",
		"taplo",
		"pylsp",
	},

	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	automatic_installation = true,
})
