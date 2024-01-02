return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
	},
	config = function()
		local has_words_before = function()
			local cursor = vim.api.nvim_win_get_cursor(0)
			return not vim.api.nvim_get_current_line():sub(1, cursor[2]):match('^%s$')
		end

		local cmp = require('cmp')
		cmp.setup {
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body)
				end,
			},
			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump',
								true, true,
								true), '')
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = 'vsnip' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'cmdline' },
			},
		}
	end,
}
