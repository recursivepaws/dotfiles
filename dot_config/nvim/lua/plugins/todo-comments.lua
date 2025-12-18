local icons = require("utils.icons")

-- NOTE:
-- TODO:
-- WARN:
-- PERF:
-- INFO:
-- FIXME:
-- FIXIT:
-- ISSUE:
-- BUG:
-- DOCS:
-- WARNING:
-- XXX:
-- OPTIMIZE:
-- NOTE:
-- REFACTOR:
-- HACK:

-- local dracula = require("").setup()
return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "Mofiqul/dracula.nvim" },
	--[[ opts = {
		colors = {
			error = { dracula.red },
			warning = { dracula.orange },
			info = { dracula.cyan },
			hint = { dracula.green },
			default = { dracula.purple },
			refactor = { dracula.pink },
		},
		keywords = {
			FIX = {
				icon = icons.debug, -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fix", "fixme", "bug" }, -- a set of other keywords that all map to this FIX keywords
			},
			TODO = { icon = icons.check, color = "info" },
			DOCS = { icon = icons.file, color = "hint" },
			HACK = { icon = icons.flame, color = "warning" },
			WARN = { icon = icons.warn, color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = icons.clock, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = icons.comment, color = "hint" },
			INFO = { icon = icons.info, color = "hint" },
			REFACTOR = { icon = icons.hint, color = "refactor" },
		},
	}, ]]
}
