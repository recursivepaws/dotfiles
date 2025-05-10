local mason_bin = require("meovv.utils.lsp").mason_bin

vim.lsp.config("jsonls", {
	cmd = { mason_bin .. "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = true,
	},
	single_file_support = true,
	settings = {
		json = {
			format = {
				enable = true,
			},
			validate = { enable = true },
		},
	},
})

vim.lsp.enable("jsonls")
