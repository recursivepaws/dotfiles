return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					-- "ocamllsp",
					-- "clangd",
					"cssls",
					"gopls",
					-- "biome",
					"tsserver",
					"eslint",
					"html",
					"cssls",
					"taplo",
					"sqlls",
					"pylsp",
					"marksman",
					"ltex",
				},
				handlers = {
					["tsserver"] = function()
						lspconfig.tsserver.setup({
							capabilities = lsp_capabilities,
							settings = {
								completions = {
									completeFunctionCalls = true,
								},
							},
						})
					end,
				},
			})
		end,
	},
}
