return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- servers = {
			-- 	texlab = {},
			-- 	ltex = { filetypes = { "tex", "pandoc", "bib" } },
			-- },
			inlay_hints = true,
			codelens = {
				enabled = true,
			},
			servers = {
				biome = {
					settings = {
						single_file_support = true,
					},
				},
			},
		},
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				},
			},
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					-- Bash
					"bashls",
					-- Lua
					"lua_ls",
					-- Web
					"astro",
					"html",
					"cssls",
					-- JS/TS
					"ts_ls",
					"biome",
					-- JSON
					"jsonls",
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
					-- Markdown / MDX
					"mdx_analyzer",
					-- LaTex
					"texlab",
					"ltex",
					-- WGPU
					"wgsl_analyzer",
					-- DPrint
					-- "dprint",
					--
					-- "denols",
				},
			})
			local lspconfig = require("lspconfig")
			-- Bash
			lspconfig.bashls.setup({ filetypes = { "sh", "zsh" } })
			-- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			-- Web
			lspconfig.astro.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.ts_ls.setup({
				init_options = {
					preferences = { disableSuggestions = false },
					hostInfo = "neovim",
				},
				root_patterns = { "package.json", "jsconfig.json", "tsconfig.json" },
				cmd = { "typescript-language-server", "--stdio" },
			})
			lspconfig.biome.setup({
				single_file_support = true
			})
			-- JSON
			lspconfig.jsonls.setup({})
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
			lspconfig.mdx_analyzer.setup({
				filetypes = { "markdown" },
			})
			-- LaTex
			lspconfig.texlab.setup({})
			lspconfig.ltex.setup({
				settings = {
					ltex = {
						language = "en-US",
						additionalRules = {
							enablePickyRules = true,
						},
					},
				},
				filetypes = { "plaintex", "markdown", "text", "tex", "pandoc", "bib", "gitcommit" },
				--flags = { debounce_text_changes = 300 },
			})
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
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- }
}
