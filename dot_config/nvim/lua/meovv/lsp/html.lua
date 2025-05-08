local function html()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

	vim.lsp.config("html", {
		cmd = { mason_bin .. "vscode-html-language-server", "--stdio" },
		filetypes = {
			"htmlangular",
			"html",
			"templ",
		},
	})
	vim.lsp.enable("html")
end

return html
