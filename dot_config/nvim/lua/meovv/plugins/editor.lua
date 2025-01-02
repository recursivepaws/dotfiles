return {
	-- Dev icons
	{ "ryanoasis/vim-devicons" },
	-- Indent blank lines
	-- Better diagnostics, references, quickfixes, telescope results
	-- Run formatters on save
	-- Rust-specific quality of life
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
