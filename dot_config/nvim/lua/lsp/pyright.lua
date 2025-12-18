local mason_bin = require("utils.lsp").mason_bin

vim.lsp.config("pyright", {
	cmd = { mason_bin .. "pyright-langserver", "--stdio" },
	filetypes = {
		"python",
	},

	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
				useLibraryCodeForTypes = true,
				completeFunctionParens = true,
			},
		},
	},
})

vim.lsp.enable("pyright")
