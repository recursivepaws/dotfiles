local actions = require("telescope.actions")
local icons = require("meovv.utils.icons")
local u = require("meovv.utils")

local default_mappings = {
	n = {
		["Q"] = actions.smart_add_to_qflist + actions.open_qflist,
		["q"] = actions.smart_send_to_qflist + actions.open_qflist,
		["<tab>"] = actions.toggle_selection + actions.move_selection_next,
		["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
		["v"] = actions.file_vsplit,
		["s"] = actions.file_split,
		["<cr>"] = actions.file_edit,
	},
}

local opts_cursor = {
	initial_mode = "normal",
	sorting_strategy = "ascending",
	layout_strategy = "cursor",
	results_title = false,
	layout_config = {
		width = 0.5,
		height = 0.4,
	},
}

local opts_vertical = {
	initial_mode = "normal",
	sorting_strategy = "ascending",
	layout_strategy = "vertical",
	results_title = false,
	layout_config = {
		width = 0.3,
		height = 0.5,
		prompt_position = "top",
		mirror = true,
	},
}

local opts_flex = {
	layout_strategy = "flex",
	layout_config = {
		width = 0.7,
		height = 0.7,
	},
}

require("telescope").setup({
	defaults = {},
	-- pickers = {
	--   buffers = u.merge(opts_flex, {
	--     prompt_title = "✨ Search Buffers ✨",
	--     mappings = u.merge({
	--       n = {
	--         ["d"] = actions.delete_buffer,
	--       },
	--     }, default_mappings),
	--     sort_mru = true,
	--     preview_title = false,
	--   }),
	--   lsp_code_actions = u.merge(opts_cursor, {
	--     prompt_title = "Code Actions",
	--   }),
	--   lsp_range_code_actions = u.merge(opts_vertical, {
	--     prompt_title = "Code Actions",
	--   }),
	--   lsp_document_diagnostics = u.merge(opts_vertical, {
	--     prompt_title = "Document Diagnostics",
	--     mappings = default_mappings,
	--   }),
	--   lsp_implementations = u.merge(opts_cursor, {
	--     prompt_title = "Implementations",
	--     mappings = default_mappings,
	--   }),
	--   lsp_definitions = u.merge(opts_cursor, {
	--     prompt_title = "Definitions",
	--     mappings = default_mappings,
	--   }),
	--   lsp_references = u.merge(opts_vertical, {
	--     theme = "dropdown",
	--     prompt_title = "References",
	--     mappings = default_mappings,
	--   }),
	--   find_files = u.merge(opts_flex, {
	--     prompt_title = "✨ Search Project ✨",
	--     mappings = default_mappings,
	--     hidden = true,
	--   }),
	--   diagnostics = u.merge(opts_vertical, {
	--     mappings = default_mappings,
	--   }),
	--   git_files = u.merge(opts_flex, {
	--     prompt_title = "✨ Search Git Project ✨",
	--     mappings = default_mappings,
	--     hidden = true,
	--   }),
	--   live_grep = u.merge(opts_flex, {
	--     prompt_title = "✨ Live Grep ✨",
	--     mappings = default_mappings,
	--   }),
	--   git_branches = u.merge(opts_flex, {
	--     prompt_title = icons.git.branch .. " Checkout Git Branch " .. icons.git.branch,
	--     mappings = default_mappings,
	--   }),
	--   grep_string = u.merge(opts_vertical, {
	--     prompt_title = "✨ Grep String ✨",
	--     mappings = default_mappings,
	--   }),
	-- },
})
