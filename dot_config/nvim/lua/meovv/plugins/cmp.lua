return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
      integrations = {

        -- lspconfig
      },
    },
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
      "MeanderingProgrammer/render-markdown.nvim",
      "saghen/blink.compat",
      {
        "onsails/lspkind.nvim",
        opts = {
          symbol_map = { spell = "󰓆", cmdline = "", markdown = "" },
        },
      },
      { "allaman/emoji.nvim", opts = { enable_cmp_integration = true } },
    },
    opts = {
      keymap = {
        preset = "none",

        -- This is the default preset
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
      },
      completion = {
        menu = {
          border = "single",
          draw = {
            columns = {
              { "kind_icon" },
              { "label",    "label_description", gap = 1 },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                --[[ highight = function(ctx)
                  local hl = "BlinkCmpKind" .. ctx.kind
                      or require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end, ]]
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = { border = "single" },
        },
        accept = { auto_brackets = { enabled = true } },
        -- list = {
        --   selection = { auto_insert = true },
        -- },
      },
      signature = {
        enabled = true,
        window = { border = "single" },
      },
      fuzzy = {
        implementation = "rust",
        sorts = {
          -- -- Always prioritize exact matches, case-sensitive.
          "exact",

          -- Sort by Fuzzy matching score.
          "score",

          -- Kind of thing
          "kind",
          --
          -- -- Sort by `label` field from LSP server, i.e. name in completion menu.
          -- -- Needed to sort results from LSP server by `label`,
          -- -- even though protocol specifies default value of `sortText` is `label`.
          -- "label",
          function(a, b)
            -- Force labels to the bottom of the list by substituting
            -- underscored prefixes with ascii values lower on the list
            if a.source_id == "lsp" then
              local x = a.label
              local y = b.label
              if x:len() > 1 then
                x = "~" .. x:sub(2)
              end
              if y:len() > 1 then
                y = "~" .. y:sub(2)
              end
              return x < y
            end
          end,
        },
      },
      sources = {
        default = {
          "lazydev",
          "snippets",
          "lsp",
          "buffer",
          "path",
          "markdown",
          "emoji",
        },
        providers = {
          snippets = {
            score_offset = 100,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 90,
          },
          markdown = {
            name = "markdown",
            module = "render-markdown.integ.blink",
            enabled = function()
              return vim.bo.filetype == "markdown"
            end,
            fallbacks = { "lsp" },
          },
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            -- overwrite kind of suggestion
            transform_items = function(ctx, items)
              local kind = require("blink.cmp.types").CompletionItemKind.Text
              for i = 1, #items do
                items[i].kind = kind
              end
              return items
            end,
            score_offset = 50,
          },
        },
      },
      cmdline = {
        enabled = true,
        sources = function()
          local type = vim.fn.getcmdtype()

          if type == "/" or type == "?" then
            return { "buffer" }
          end
          if type == ":" or type == "@" then
            return { "cmdline", "path", "buffer" }
          end
          return {}
        end,
        completion = {
          menu = { auto_show = true },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
