local mason_bin = require("meovv.utils.lsp").mason_bin
return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  version = "1.*",
  opts = {
    dependencies_bin = {
      ["tinymist"] = mason_bin .. "tinymist",
      ["websocat"] = "websocat",
    },
  },
}
