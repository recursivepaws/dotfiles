return {
	"hrsh7th/nvim-cmp",
	config = function()
		require("meovv.plugins.nvim-cmp.config")
	end,
	dependencies = {
		-- ensure mason and cmp lst are loaded first
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		-- now do the rest
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		{
			"L3MON4D3/LuaSnip",
			config = function()
				local ls = require("luasnip")
				ls.config.set_config({
					history = true,
					-- Update more often, :h events for more info.
					updateevents = "TextChanged,TextChangedI",
					enable_autosnippets = true,
				})

				-- extend html snippets to react files
				require("luasnip").filetype_extend("javascriptreact", { "html" })
				require("luasnip").filetype_extend("typescriptreact", { "html" })
				-- load snippets (friendly-snippets)
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			-- build = "make install_jsregexp",
		},
	},
	event = { "InsertEnter", "CmdlineEnter" },
}
