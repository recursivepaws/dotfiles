return {
  "sontungexpt/witch-line",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {},
  config = function()
    require("witch-line").setup({
      global = {
        "mode",
        "file.name",
        "git.branch",
        "git.diff",
        "nvim_dap",
        "diagnostic.info",
        "diagnostic.hint",
        "diagnostic.warn",
        "diagnostic.error",
        "%=",
        "lsp.clients",
        "indent",
        "encoding",
        "pos-cursor",
        "pos-cursor-progress",
      },
    })
  end,
}
