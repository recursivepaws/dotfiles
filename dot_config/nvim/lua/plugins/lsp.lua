return {
	{
		"neovim/nvim-lspconfig",
		-- opts = {
		-- 	servers = {
		-- 		texlab = {},
		-- 		ltex = { filetypes = { "tex", "pandoc", "bib" } },
		-- 	},
		-- },
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
					"ts_ls",
					"eslint",
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
			lspconfig.ts_ls.setup({})
			lspconfig.eslint.setup({})
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
	-- Hightouch and others use prettier- we want this to have the final say on formatting if we're
	-- in a project which has a prettier config
	{
		'prettier/vim-prettier',
		lazy = false,
		config = function()
			vim.g["prettier#autoformat_config_present"] = 1
			vim.cmd([[
				augroup Prettier
					autocmd!
					autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.md,*.html PrettierAsync
				augroup end
				nnoremap gp :silent %!prettier --stdin-filepath %<CR>
			]])
		end
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	}
}
