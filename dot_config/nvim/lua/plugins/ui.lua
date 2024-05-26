return {
	-- Preferred theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin")
			require("catppuccin").setup({
				flavour = "mocha",
				custom_highlights = function(C)
					return {
						CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
						CmpItemKindKeyword = { fg = C.base, bg = C.red },
						CmpItemKindText = { fg = C.base, bg = C.teal },
						CmpItemKindMethod = { fg = C.base, bg = C.blue },
						CmpItemKindConstructor = { fg = C.base, bg = C.blue },
						CmpItemKindFunction = { fg = C.base, bg = C.blue },
						CmpItemKindFolder = { fg = C.base, bg = C.blue },
						CmpItemKindModule = { fg = C.base, bg = C.blue },
						CmpItemKindConstant = { fg = C.base, bg = C.peach },
						CmpItemKindField = { fg = C.base, bg = C.green },
						CmpItemKindProperty = { fg = C.base, bg = C.green },
						CmpItemKindEnum = { fg = C.base, bg = C.green },
						CmpItemKindUnit = { fg = C.base, bg = C.green },
						CmpItemKindClass = { fg = C.base, bg = C.yellow },
						CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
						CmpItemKindFile = { fg = C.base, bg = C.blue },
						CmpItemKindInterface = { fg = C.base, bg = C.yellow },
						CmpItemKindColor = { fg = C.base, bg = C.red },
						CmpItemKindReference = { fg = C.base, bg = C.red },
						CmpItemKindEnumMember = { fg = C.base, bg = C.red },
						CmpItemKindStruct = { fg = C.base, bg = C.blue },
						CmpItemKindValue = { fg = C.base, bg = C.peach },
						CmpItemKindEvent = { fg = C.base, bg = C.blue },
						CmpItemKindOperator = { fg = C.base, bg = C.blue },
						CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
						CmpItemKindCopilot = { fg = C.base, bg = C.teal },
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
			require("notify").setup({ timeout = 100, background_colour = "#000000" })
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
	-- Markdown rendering
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
