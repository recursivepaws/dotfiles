return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			hint = {
				enable = true,
				paramName = "Literal",
				setType = true,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "ide" },
			},
			workspace = {
				checkThirdParty = false,
				-- Make the server aware of Neovim runtime files
				library = {
					vim.env.VIMRUNTIME,
					--[[ "${3rd}/busted/library", ]]
					"${3rd}/luv/library",
				},
			},
		},
	},
}
