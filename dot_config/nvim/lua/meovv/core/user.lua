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
		ensure_installed = {
			-- Bash
			"bashls",
			-- Web
			"cssls",
			"eslint",
			"html",
			"ts_ls",
			"jsonls",
			-- Web Supplemental
			"astro",
			"svelte",
			"graphql",
			"tailwindcss",
			"mdx_analyzer",
			-- Go
			"gopls",
			-- Lua
			"lua_ls",
			-- Python
			"pyright",
			-- Yaml
			"yamlls",
			-- LaTex
			"texlab",
			"ltex",
			-- WGPU
			"wgsl_analyzer",
		},
		-- lsp servers that should be enabled
		servers = {
			astro = true,
			-- Enable rust_analyzer
			rust_analyzer = true,
			wgsl_analyzer = true,
			bashls = { filetypes = { "sh", "zsh" } },
			mdx_analyzer = { filetypes = { "markdown" } },
			texlab = true,
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
			tailwindcss = true,
			eslint = {
				settings = {
					eslint = {
						runtime = "node",
						execArgv = { "--max-old-space-size=8192", "--max_old_space_size=8192" },
						run = "onSave",
					},
					runtime = "node",
					execArgv = { "--max-old-space-size=8192", "--max_old_space_size=8192" },
				},
			},
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
