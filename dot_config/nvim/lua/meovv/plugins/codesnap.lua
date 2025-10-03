return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cc", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    {
      "<leader>cs",
      "<Esc><cmd>CodeSnapSave<cr>",
      mode = "x",
      desc = "Save selected code snapshot in ~/Pictures/Code",
    },
    {
      "<leader>ca",
      "<Esc><cmd>CodeSnapSave<cr>",
      mode = "x",
      desc = "Save selected code snapshot as ASCII into clipboard",
    },
  },
  ---@module 'codesnap'
  opts = {
    save_path = "~/Pictures/Code",
    code_font_family = "CaskaydiaCove Nerd Font",
    bg_x_padding = 33,
    bg_y_padding = 33,
    mac_window_bar = false,
    has_breadcrumbs = true,
    show_workspace = true,
    bg_theme = "summer",
  },
  config = function(opts)
    require("codesnap").setup(opts)
  end,
}
