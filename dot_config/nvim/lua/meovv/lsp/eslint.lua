local function eslint()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

	vim.lsp.config("eslint", {
		cmd = { mason_bin .. "vscode-eslint-language-server", "--stdio" },
		settings = {
			nodePath = "",
			experimental = {
				useFlatConfig = true,
			},
			packageManager = "pnpm",
			workingDirectory = {
				mode = "auto",
			},
		},
		filetypes = {
			"htmlangular",
			"html",
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_markers = {
			-- ".eslintrc",
			-- ".eslintrc.js",
			-- ".eslintrc.cjs",
			-- ".eslintrc.yaml",
			-- ".eslintrc.yml",
			-- ".eslintrc.json",
			-- "eslint.config.js",
			-- "eslint.config.mjs",
			-- "eslint.config.cjs",
			-- "eslint.config.ts",
			-- "eslint.config.mts",
			-- "eslint.config.cts",
      ".git"
		},
	})
	vim.lsp.enable("eslint")
end
return eslint
