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
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
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
                    --autocomplete = false --uncomment to make autocompletes optional/toggleable
                    completeopt = 'menu,menuone,noselect'
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    expandable_indicator = true,
                    format = function(entry, vim_item)
                        --//-- abbr
                        local function trim(txt, max)
                            if txt and #txt > max then
                                txt = txt:sub(1, max) .. ""
                            end
                            return txt
                        end
                        vim_item.abbr = trim(vim_item.abbr, 32);
                        --//-- kind
                        if vim_item.kind and vim_item.kind ~= "" then
                            vim_item.kind = (icon_map[vim_item.kind] or "?") .. ' (' .. vim_item.kind .. ')'
                        end
                        --//-- menu
                        local item = entry.completion_item
                        if item.detail and item.detail ~= "" then
                            vim_item.menu = "-> " .. item.detail .. ' [' .. entry.source.name .. ']'
                        else
                            vim_item.menu = '[' .. entry.source.name .. ']'
                        end

                        return vim_item
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
                    ['<C-c>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    {
                        name = 'path',
                        option = {
                            trailing_slash = true,
                            label_trailing_slash = true,
                        }
                    },
                })
            })
        end

    },
}
