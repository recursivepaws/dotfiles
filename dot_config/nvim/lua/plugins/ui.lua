return {
	-- Preferred theme
	{
		"Mofiqul/dracula.nvim",
		config = function()
			vim.cmd.colorscheme("dracula")
			require("dracula").setup({
				transparent_bg = true,
				overrides = function(C)
					return {
						CmpItemKindSnippet = { fg = C.bg, bg = C.purple },
						CmpItemKindKeyword = { fg = C.bg, bg = C.red },
						CmpItemKindText = { fg = C.bg, bg = C.teal },
						CmpItemKindMethod = { fg = C.bg, bg = C.cyan },
						CmpItemKindConstructor = { fg = C.bg, bg = C.cyan },
						CmpItemKindFunction = { fg = C.bg, bg = C.cyan },
						CmpItemKindFolder = { fg = C.bg, bg = C.cyan },
						CmpItemKindModule = { fg = C.bg, bg = C.cyan },
						CmpItemKindConstant = { fg = C.bg, bg = C.orange },
						CmpItemKindField = { fg = C.bg, bg = C.green },
						CmpItemKindProperty = { fg = C.bg, bg = C.green },
						CmpItemKindEnum = { fg = C.bg, bg = C.green },
						CmpItemKindUnit = { fg = C.bg, bg = C.green },
						CmpItemKindClass = { fg = C.bg, bg = C.yellow },
						CmpItemKindVariable = { fg = C.bg, bg = C.fg },
						CmpItemKindFile = { fg = C.bg, bg = C.cyan },
						CmpItemKindInterface = { fg = C.bg, bg = C.yellow },
						CmpItemKindColor = { fg = C.bg, bg = C.red },
						CmpItemKindReference = { fg = C.bg, bg = C.red },
						CmpItemKindEnumMember = { fg = C.bg, bg = C.red },
						CmpItemKindStruct = { fg = C.bg, bg = C.cyan },
						CmpItemKindValue = { fg = C.bg, bg = C.orange },
						CmpItemKindEvent = { fg = C.bg, bg = C.cyan },
						CmpItemKindOperator = { fg = C.bg, bg = C.cyan },
						CmpItemKindTypeParameter = { fg = C.bg, bg = C.cyan },
					}
				end,
			})
		end,
	},
	-- Color Code rendering
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	-- Improves notification display
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("notify").setup({ timeout = 100, background_colour = "#282A36" })
		end,
	},
	-- Improved file search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
	-- Improved cmd ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- Adds a home screen dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = {
						[[                                  _           ]],
						[[  /\/\   ___  _____      __/\   /(_)_ __ ___  ]],
						[[ /    \ / _ \/ _ \ \ /\ / /\ \ / / | '_ ` _ \ ]],
						[[/ /\/\ \  __/ (_) \ V  V /  \ V /| | | | | | |]],
						[[\/    \/\___|\___/ \_/\_/    \_/ |_|_| |_| |_|]],
					},
					disable_move = { false },
					shortcut = {},
					packages = { false },
					project = { enable = true, limit = 3, action = "Oil" },
					mru = { limit = 4 },
					footer = {},
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Makes the window transparent
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup()
			vim.cmd([[TransparentEnable]])
		end,
	},
	-- Modify filesystem
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	-- Statusline
	{
		"sontungexpt/sttusline",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufEnter" },
		config = function(_, opts)
			require("sttusline").setup({
				statusline_color = "#282A36",
				--statusline_color = "StatusLine",

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
	-- Markdown rendering
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
