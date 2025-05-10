local mason_bin = require("meovv.utils.lsp").mason_bin

vim.lsp.config("sqls", {
	cmd = { mason_bin .. "sqls" },
	filetypes = {
		"sql",
	},
	root_markers = {
		".git",
	},
})

vim.lsp.enable("sqls")
