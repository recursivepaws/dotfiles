return {
  "Mofiqul/dracula.nvim",
  config = function()
    vim.cmd.colorscheme("dracula")
    require("dracula").setup({})
    vim.cmd("color dracula")
  end,
  lazy = false,
}
