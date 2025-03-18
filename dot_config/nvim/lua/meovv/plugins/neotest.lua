return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-jest",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>tn",
			":lua require('neotest').run.run()<CR>",
			desc = "Run nearest test",
			noremap = true,
			silent = true,
		},
		{ "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run file tests" },
		{ "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary" },
	},
}
