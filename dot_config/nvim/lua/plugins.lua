return {
	--[[{
		"LazyVim/LazyVim",
		import = "lazyvim.plugins",
		opts = {
			colorscheme = "kanagawa-wave",
		},
	},]]
	-- Disable some of the default LazyVim plugins
  -- 
	{ "akinsho/bufferline.nvim", enabled = false },
	{ "windwp/nvim-autopairs", config = true },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-eunuch" },
	{ "jessarcher/vim-heritage" },
}
