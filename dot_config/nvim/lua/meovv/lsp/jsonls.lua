local function jsonls()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

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
end

return jsonls
