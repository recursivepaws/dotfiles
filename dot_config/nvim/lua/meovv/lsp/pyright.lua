local function pyright()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

	vim.lsp.config("pyright", {
		cmd = { mason_bin .. "pyright" },
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
end

return pyright
