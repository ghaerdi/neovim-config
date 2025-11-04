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
					"dockerls",
					"lua_ls",
					"jsonls",
					"yamlls",
					"hyprls",
					"bashls",
					"taplo",
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
				-- format modifications
				vim.api.nvim_buf_create_user_command(bufnr, "FormatModifications", function()
					local lsp_format_modifications = require("lsp-format-modifications")
					lsp_format_modifications.format_modifications(client, bufnr)
				end, {})
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
				"jsonls",
				"yamlls",
				"hyprls",
				"bashls",
				"taplo",
				"gopls",
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

			lspconfig.denols.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deno.lock"),
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

			lspconfig.lua_ls.setup {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
							return
						end
					end
					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							version = 'LuaJIT'
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = true,
							library = {
								vim.env.VIMRUNTIME
							}
						}
					})
				end,
				settings = {
					Lua = {}
				}
			}
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false
				}
			})
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
				null_ls.builtins.formatting.alejandra,
				require("none-ls.diagnostics.eslint"),
			})
			vim.keymap.set("n", "<A-S-f>", vim.lsp.buf.format)
		end,
	}
}
