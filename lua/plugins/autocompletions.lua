return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local types = require("cmp.types")
      local icon_map = {
        Class = "󰠱",
        Color = "󰏘",
        Constant = "󰏿",
        Constructor = "",
        Enum = "",
        EnumMember = "󰈍",
        Event = "",
        Field = "󰜢",
        File = "󰈙",
        Folder = "󰉋",
        Function = "󰊕",
        Interface = "",
        Keyword = "󰌋",
        Method = "󰆧",
        Module = "",
        Operator = "󰆕",
        Property = "󰜢",
        Reference = "󰈇",
        Snippet = "",
        Text = "󰉿",
        TypeParameter = "",
        Struct = "󰙅",
        Unit = "󰑭",
        Value = "󰎠",
        Variable = "󰀫",
      }
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        completion = {
            autocomplete = true, -- togglebable completion(C-c): false=true, true=false
        },
        snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
        },
        window = {
          completion = cmp.config.window.bordered({
                border = "double",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuThumb,Search:None"
          }),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
            format = function (entry,vim_item)
                --//-- abbr
                local function trim(txt,max)
                    if txt and #txt > max then
                        txt = txt:sub(1,max) .. ""
                    end
                    return txt
                end
                vim_item.abbr = trim(vim_item.abbr,32);
                --//-- kind
                vim_item.kind = (icon_map[vim_item.kind] or "?") .. ' (' .. vim_item.kind .. ')'
                --//-- menu
                local item = entry:get_completion_item()
                if item.detail then
                    vim_item.menu = "-> " .. item.detail.. ' [' .. entry.source.name .. ']'
                else
                    vim_item.menu = '[' .. entry.source.name .. ']'
                end

                return vim_item
            end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
          ['<C-c>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp'},
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end

  },
}
