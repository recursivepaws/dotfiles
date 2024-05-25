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
				automatic_installation = true,
				ensure_installed = {
					-- Bash
					"bashls",
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
					-- MDX
					"mdx_analyzer",
					-- LaTex
					"ltex",
					-- WGPU
					"wgsl_analyzer",
				},
			})
			-- Bash
			lspconfig.bashls.setup({ filetypes = { "sh", "zsh", "zshrc", "bashrc" } })
			-- Lua
			lspconfig.lua_ls.setup({})
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
			vim.filetype.add({
				extension = {
					md = "markdown.md",
					mdx = "markdown.mdx",
				},
			})
			lspconfig.marksman.setup({})
			lspconfig.mdx_analyzer.setup({})
			-- LaTex
			lspconfig.ltex.setup({})
			-- WGPU
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				pattern = "*.wgsl",
				callback = function()
					vim.bo.filetype = "wgsl"
				end,
			})
			lspconfig.wgsl_analyzer.setup({})
		end,
	},
}
