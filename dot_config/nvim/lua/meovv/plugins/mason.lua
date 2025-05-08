return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			-- require("mason-nvim-dap").setup()
		end,
	},
}
