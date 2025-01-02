return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		-- "JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	event = "BufEnter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"go",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"regex",
				"rust",
				"styled",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
			refactor = {
				highlight_definitions = { enable = true },
				highlight_current_scope = { enable = false },
			},
		})
	end,
}
