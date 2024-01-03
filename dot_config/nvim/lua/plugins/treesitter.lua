return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"rust",
				"lua",
				"vim",
				"bash",
				"toml",
				"json",
				"jsonc",
				"regex",
				"tsx",
				"markdown",
				"markdown_inline",
				"vimdoc",
				"javascript",
				"html",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
