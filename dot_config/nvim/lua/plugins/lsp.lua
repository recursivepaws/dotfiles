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
					"biome",
					"taplo",
					"sqlls",
					"pylsp",
					"marksman",
					"ltex",
				},
			})
		end,
	},
}
