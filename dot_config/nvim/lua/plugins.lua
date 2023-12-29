return {
  { 
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 'c', 'rust', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'html' },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  { 'neovim/nvim-lspconfig'},
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'windwp/nvim-autopairs', config=true },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-eunuch' },
  { 'jessarcher/vim-heritage' },	
}
