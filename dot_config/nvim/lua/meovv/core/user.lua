local config = {
	border = "rounded",
	disable_builtin_plugins = {},
	add_plugins = {},
	plugins = {},
	lsp = {
		inlay_hint = false,
		format_timeout = 500,
		rename_notification = true,
		-- table of callbacks pushed via plugins
		on_attach_mappings = {},
		-- lsp servers that should be installed
		-- ensure_installed = {
		-- 	-- -- Bash
		-- 	"bashls",
		-- 	-- Web
		-- 	"cssls",
		-- 	"eslint",
		-- 	"html",
		-- 	"prettierd",
		-- 	"ts_ls",
		-- 	"jsonls",
		-- 	-- Web Supplemental
		-- 	"astro",
		-- 	"svelte",
		-- 	"graphql",
		-- 	"tailwindcss",
		-- 	-- "mdx_analyzer",
		-- 	-- Go
		-- 	"gopls",
		-- 	-- Lua
		-- 	"lua_ls",
		-- 	-- Python
		-- 	"pyright",
		-- 	-- Yaml
		-- 	"yamlls",
		-- 	-- LaTex
		-- 	"texlab",
		-- 	"ltex",
		-- 	-- WGPU
		-- 	"wgsl_analyzer",
		-- },
		ensure_installed = {
			"astro",
			"cssls",
			"eslint",
			"eslint",
			"gopls",
			"graphql",
			"html",
			"jsonls",
			"lua_ls",
			"prettierd",
			"pyright",
			"svelte",
			"tailwindcss",
			"ts_ls",
			"yamlls",
		},
		-- lsp servers that should be enabled
		--[[ servers = {
			astro = true,
			bashls = { filetypes = { "sh", "zsh" } },
			mdx_analyzer = { filetypes = { "markdown" } },
			ltex = {
				settings = {
					ltex = {
						language = "en-US",
						additionalRules = {
							enablePickyRules = true,
						},
					},
				},
				filetypes = { "plaintex", "markdown", "text", "tex", "pandoc", "bib", "gitcommit" },
			},
			wgsl_analyzer = true,
			texlab = true,
			yamlls = true,
			tailwindcss = true,
			eslint = true,
			jsonls = {
				format_on_save = false,
			},
			pyright = true,
			lua_ls = {
				format_on_save = false,
			},
			gopls = true,
			html = true,
			ts_ls = {
				format_on_save = false,
			},
		}, ]]
		servers = {
			astro = true,
			tailwindcss = true,
			eslint = true,
			jsonls = {
				format_on_save = false,
			},
			pyright = true,
			lua_ls = {
				format_on_save = false,
			},
			gopls = true,
			html = true,
			ts_ls = {
				format_on_save = false,
			},
		},
	},
}

function config.lsp.add_on_attach_mapping(callback)
	table.insert(config.lsp.on_attach_mappings, callback)
end

return config
