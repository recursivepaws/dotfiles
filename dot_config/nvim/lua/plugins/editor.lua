return {
	-- Dev icons
	{ "ryanoasis/vim-devicons" },
	-- Smart comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Indent blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl")
			-- Hide indent guides
			vim.api.nvim_create_autocmd({ "VimEnter" }, {
				command = "IBLDisable",
			})
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				command = "IBLEnable",
			})
		end,
	},
	-- Better diagnostics, references, quickfixes, telescope results
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	-- Indicate git differences in editor
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	-- Run formatters on save
	{
		"stevearc/conform.nvim",
		dependencies = { "rcarriga/nvim-notify" },
		event = "LspAttach",
		opts = {
			notify_on_error = true,
			quiet = true,
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				-- javascript = { "biome", "biome-check" },
				-- typescript = { "biome", "biome-check" },
				-- javascriptreact = { "biome", "biome-check" },
				-- typescriptreact = { "biome", "biome-check" },
				-- javascript = { "biome" },
				-- typescript = { "biome" },
				-- javascriptreact = { "biome" },
				-- typescriptreact = { "biome" },
				-- javascript = { "biome-check" },
				-- typescript = { "biome-check" },
				-- javascriptreact = { "biome-check" },
				-- typescriptreact = { "biome-check" },
				javascript = { "dprint", "biomejs" },
				typescript = { "dprint", "biomejs" },
				javascriptreact = { "dprint", "biomejs" },
				typescriptreact = { "dprint", "biomejs" },
				-- javascript = { "biomejs" },
				-- typescript = { "biomejs" },
				-- javascriptreact = { "biomejs" },
				-- typescriptreact = { "biomejs" },
			},
			format_on_save = function(bufnr)
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") then
					return
				end
				return {
					timeout_ms = 1000,
					async = false,
					lsp_fallback = true
				}
			end,
			format_after_save = { lsp_fallback = true },
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
	-- Rust-specific quality of life
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		dependencies = { "mfussenegger/nvim-dap" },
	},
	-- Pretty LSP-based folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			require("ufo").setup({
				fold_virt_text_handler = handler,
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})

			-- Set global options to ensure that we dont refold on save
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
	},
}
