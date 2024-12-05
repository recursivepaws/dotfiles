return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		local parser_configs =
			require('nvim-treesitter.parsers').get_parser_configs()
		parser_configs.http = {
			install_info = {
				url = 'https://github.com/rest-nvim/tree-sitter-http',
				files = { 'src/parser.c' },
				branch = 'main'
			}
		}
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
				-- "tree-sitter-http",
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
