return {
	"FabijanZulj/blame.nvim",
	keys = {
		{ "<leader>vb", "<cmd>BlameToggle<cr>", desc = "Toggle Git Blame" },
	},
	config = function()
		require("blame").setup()
	end,
}
