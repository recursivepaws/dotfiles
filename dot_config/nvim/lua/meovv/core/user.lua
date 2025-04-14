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
			--[[ "biome", ]]
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
			--[[ biome = {
        format_on_save = false,
        opts = {
          filetypes = { "markdown" },
        },
      }, ]]
			wgsl_analyzer = true,
			bashls = { opts = { filetypes = { "sh", "zsh" } } },
			mdx_analyzer = { opts = { filetypes = { "markdown" } } },
			texlab = true,
			ltex = {
				opts = {
					settings = {
						ltex = {
							language = "en-US",
							additionalRules = {
								enablePickyRules = true,
							},
						},
					},
					filetypes = { "plaintex", "tex", "pandoc", "bib" },
				},
			},
			tailwindcss = true,
			eslint = {
				opts = {
					settings = {
						packageManager = "pnpm",
						workingDirectory = {
							mode = "auto",
						},
						workingDirectories = { mode = "auto" },
						experimental = {
							useFlatConfig = true,
						},
					},
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
