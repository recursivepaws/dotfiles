return {
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1
			local home = os.getenv("HOME")
			vim.g.dbs = {
				core = "sqlite://" .. home .. "/Documents/banyan/banyan-core/crates/banyan-core-service/data/server.db",
				staging = "sqlite://"
					.. home
					.. "/Documents/banyan/banyan-core/crates/banyan-staging-service/data/server.db",
				storage = "sqlite://"
					.. home
					.. "/Documents/banyan/banyan-core/crates/banyan-storage-provider-service/data/server.db",
			}
		end,
	},
}
