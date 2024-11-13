return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- web
					"html",
					"cssls",
					"emmet_ls",
					"tailwindcss",
					"ts_ls",
					"eslint",
					"svelte",
					"astro",

					-- others
					"rust_analyzer",
					"dockerls",
					"lua_ls",
					"jsonls",
					"yamlls",
					"bashls",
					"taplo",
					-- "gopls",
					"pylsp",
					"zls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"joechrisellis/lsp-format-modifications.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- enable keybinds only for when lsp server available
			local on_attach = function(client, bufnr)
				-- keybind options
				local opts = { noremap = true, silent = true, buffer = bufnr }

				-- set keybinds
				vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)                     -- show definition, references
				vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)      -- got to declaration
				vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)       -- see definition and make edits in window
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)   -- go to implementation
				vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)        -- see available code actions
				vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)             -- smart rename
				vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)       -- jump to previous diagnostic in buffer
				vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)       -- jump to next diagnostic in buffer
				vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                   -- show documentation for what is under cursor
				vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)             -- see outline on right hand side

				-- format modifications
				vim.api.nvim_buf_create_user_command(bufnr, "FormatModifications", function()
					local lsp_format_modifications = require("lsp-format-modifications")
					lsp_format_modifications.format_modifications(client, bufnr)
				end, {})
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local signs = { Error = " ", Warn = " ", Hint = "󰛨 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local servers = {
				-- web
				"html",
				"cssls",
				"emmet_ls",
				"tailwindcss",
				"eslint",
				"svelte",
				"astro",

				-- others
				"rust_analyzer",
				"dockerls",
				"lua_ls",
				"jsonls",
				"yamlls",
				"bashls",
				"taplo",
				-- "gopls",
				"pylsp",
				"zls",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			vim.g.markdown_fenced_languages = {
				"ts=typescript",
			}

			local deno_config_exists = function()
				local deno_json = vim.fn.glob("deno.json")
				local deno_jsonc = vim.fn.glob("deno.jsonc")
				return deno_json ~= "" or deno_jsonc ~= ""
			end

			local package_json_exists = function()
				local package_json = vim.fn.glob("package.json")
				return package_json ~= ""
			end

			lspconfig.denols.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
				single_file_support = not deno_config_exists() and not package_json_exists(),
			})

			lspconfig.volar.setup({
				filetypes = { "vue" },
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup()
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "prettier", "black", "isort", "eslint_d" },
			})
			null_ls.setup({
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				require("none-ls.diagnostics.eslint"),
			})
			vim.keymap.set("n", "<A-S-f>", vim.lsp.buf.format)
		end,
	},
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			openai_model_id = "gpt-3.5-turbo-16k",
			context = false,
		},
		keys = {
			{
				"gw",
				mode = { "n", "x" },
				function()
					require("wtf").ai()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				mode = { "n" },
				"gW",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
		},
	}
}
