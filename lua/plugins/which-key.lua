local icons = require("utils.icons")
return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({
      win = {
        --border = user_config.border,
        --[[ position = 'bottom', ]]
        --[[ margin = { 1, 0, 1, 0 }, ]]
        padding = { 3, 2, 3, 2 },
        --[[ winblend = 20, ]]
      },
      layout = {
        height = { min = 10, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 8,
        align = "center",
      },
    })

    wk.add({
      { "<leader>f",  group = "find",       icon = icons.magnify },
      { "<leader>d",  group = "dap",        icon = icons.debug },
      { "<leader>g",  group = "goto",       icon = icons.target },
      { "<leader>k",  group = "buffer",     icon = icons.file },
      { "<leader>j",  group = "tab",        icon = icons.tab },
      { "<leader>l",  group = "lsp",        icon = icons.lsp },
      { "<leader>lw", group = "workspace" },
      { "<leader>p",  group = "lazy" },
      { "<leader>w",  group = "session" },
      { "<leader>v",  group = "git",        icon = icons.git.hub },
      { "<leader>x",  group = "diagnostics" },
      -- { "<leader>c", group = "quickfix" },
      -- { "<leader>lt", group = "toggle" },
      -- { "<leader>b", group = "debugger" },
      -- { "<leader>t", group = "testing" },
    })
  end,
  event = "VeryLazy",
}
