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
			auto_install = true,
			sync_install = false,
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			ident = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
