return {
	{ "preservim/nerdtree" },
	{ "ryanoasis/vim-devicons" },
	--lazy
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					sh = { "shfmt" },
					rust = { "rust_analyzer" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
