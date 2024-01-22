return {
	-- Preferred theme
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd([[colorscheme kanagawa-wave]])
		end,
	},
	-- Improves notification display
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	-- Adds a home screen dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			-- local theme = require("plugins.dashboard-theme.hyper")
			require("dashboard").setup()
			--[[
				{
				theme = "hyper",
				config = {},
			})--]]
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Makes the window transparent
	{
		"xiyaowong/transparent.nvim",
	},
	-- Moves the command palette to the center of the window
	{
		"stevearc/dressing.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
		config = function()
			require("dressing").setup()
		end,
	},

	-- Statusline
	-- lazy
	{
		"sontungexpt/sttusline",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufEnter" },
		config = function(_, opts)
			require("sttusline").setup({
				-- statusline_color = "#000000",
				statusline_color = "StatusLine",

				-- | 1 | 2 | 3
				-- recommended: 3
				laststatus = 3,
				disabled = {
					filetypes = {
						-- "NvimTree",
						-- "lazy",
					},
					buftypes = {
						-- "terminal",
					},
				},
				components = {
					"mode",
					"filename",
					"git-branch",
					"git-diff",
					"%=",
					"diagnostics",
					"lsps-formatters",
					"copilot",
					"indent",
					"encoding",
					"pos-cursor",
					"pos-cursor-progress",
				},
			})
		end,
	},
}
