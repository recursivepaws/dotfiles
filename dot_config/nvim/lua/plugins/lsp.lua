return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim'
      },
      {
        "ray-x/navigator.lua",
        dependencies = {
          { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
          { "neovim/nvim-lspconfig" },
          { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
          require("navigator").setup({
            mason = true,
          })
        end,
      },
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'rust_analyzer',
        'lua_ls',
      },
    }
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities
    }

  end
}
