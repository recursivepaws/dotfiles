-- Statusline
return {
  "sontungexpt/sttusline",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufEnter" },
  config = function()
    require("sttusline").setup({
      -- statusline_color = "#282A36",
      -- mode
      -- statusline_color = "StatusLine",

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
}
