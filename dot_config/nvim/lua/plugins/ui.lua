return {
	-- Preferred theme
	{
		"Mofiqul/dracula.nvim",
		config = function()
			vim.cmd.colorscheme("dracula")
			require("dracula").setup({
				transparent_bg = true,
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
			require("notify").setup({ timeout = 100 })
		end,
	},
	-- Improved file search
	-- Added cmdline via telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jonarrien/telescope-cmdline.nvim",
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("cmdline")
			local builtin = require("telescope.builtin")
			vim.api.nvim_set_keymap('n', 'Q', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
	-- Dressing for renaming lsp input
	{
		"liangxianzhe/floating-input.nvim",
	},
	-- Fidget for lsp messages
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
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
				--statusline_color = "#282A36",
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
	--
	-- Markdown rendering
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
