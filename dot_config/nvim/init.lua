local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("mason").setup()
require("mason-lspconfig").setup()
local cmp = require("cmp")
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
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
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
  }
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities
}
vim.cmd("colorscheme kanagawa-wave")
