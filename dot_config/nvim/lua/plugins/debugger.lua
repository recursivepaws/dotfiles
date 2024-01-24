return {
	-- Framework for testing
	"nvim-neotest/neotest",
	dependencies = {
		"rouge8/neotest-rust",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rust"),
			},
		})
	end,
}
