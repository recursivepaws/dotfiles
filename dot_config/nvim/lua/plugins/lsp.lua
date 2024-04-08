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
					-- Lua
					"lua_ls",
					-- Web
					"html",
					"cssls",
					"tsserver",
					"eslint",
					-- C
					"clangd",
					-- OpenGL
					"glsl_analyzer",
					-- Toml
					"taplo",
					-- SQL
					"sqlls",
					-- Python
					"pylsp",
					-- Markdown
					"marksman",
					-- LaTex
					"ltex",
				},
			})
			-- Web
			lspconfig.tsserver.setup({})
			lspconfig.eslint.setup({})
			-- C
			lspconfig.clangd.setup({})
			-- OpenGL
			lspconfig.glsl_analyzer.setup({})
			-- Toml
			lspconfig.taplo.setup({})
			-- SQL
			lspconfig.sqlls.setup({})
			-- Python
			lspconfig.pylsp.setup({})
			-- Markdown
			lspconfig.marksman.setup({
				filetypes = { "markdown", "markdown.mdx", "md", "mdx" },
			})
			-- LaTex
			lspconfig.ltex.setup({})
		end,
	},
}
