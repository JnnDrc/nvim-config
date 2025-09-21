return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "taplo"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = vim.lsp.config

            local function default_on_attach()
                vim.keymap.set('n', "<leader>A", vim.lsp.buf.code_action, { desc = "code action" })
                vim.keymap.set('n', "<leader>d", vim.diagnostic.open_float, { desc = "see diagnostics" })
                vim.keymap.set('n', "<leader>ld", vim.lsp.buf.hover, { desc = "documentation" })
                vim.keymap.set('n', "<leader>lD", vim.lsp.buf.definition, { desc = "go to definition" })
                vim.keymap.set('n', "<leader>lr", vim.lsp.buf.rename, { desc = "rename symbol" })
                vim.keymap.set('n', "<leader>ls", vim.lsp.buf.document_symbol, { desc = "document symbols" })
                vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format, { desc = "format current buffer" })
                vim.keymap.set('n', "<leader>li", "<CMD>LspInfo<CR>", { desc = "shows lsp info" })
            end
            local function exe_path(exe)
                local path = vim.fn.exepath(exe)
                if path == "" then
                    vim.notify("Can't find " .. exe .. " executable")
                    return nil
                end
                return path
            end

            local lua_libs = {}
            local lua_ls_addons = { "/love2d", "/lua-ls-cc-tweaked", "/luafilesystem" }
            local lua_ls_addons_dir = vim.env.LUALS_ADDONS
            if lua_ls_addons_dir then
                for i, addon in ipairs(lua_ls_addons) do
                    lua_libs[i] = lua_ls_addons_dir .. addon

                end
            end

            local lsps = {
                {"clangd"},
                {"zls"},
                {"gopls"},
                {"fortls"},
                {"lua_ls",
                    {
                        cmd = { exe_path("lua-language-server") },
                        capabilities = cmp_capabilities,
                        on_attach = default_on_attach,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "love", "vim" },
                                    disable = { "lowercase-global" },
                                },
                                workspace = {
                                    library = lua_libs,
                                }
                            },
                        },
                    }
                },
            }

            for _, lsp in pairs(lsps) do
                local name, config = lsp[1], lsp[2]
                vim.lsp.enable(name)

                if config then
                    vim.lsp.config(name,config)
                else
                    config = {
                        cmd = {exe_path(lsp[1])},
                        capabilities = cmp_capabilities,
                        on_attach = default_on_attach
                    }
                    vim.lsp.config(name,config)
                end
            end

            -- if exe_path("clangd") ~= nil then
            --     lspconfig.lua_ls.setup(
            --         {
            --             cmd = { exe_path("lua-language-server") },
            --             capabilities = cmp_capabilities,
            --             on_attach = default_on_attach,
            --             settings = {
            --                 Lua = {
            --                     runtime = {
            --                         version = "LuaJIT",
            --                     },
            --                     diagnostics = {
            --                         globals = { "love", "vim" },
            --                         disable = { "lowercase-global" },
            --                     },
            --                     workspace = {
            --                         library = lua_libs,
            --                     }
            --                 },
            --             },
            --         })
            -- end

            --     lspconfig.clangd.setup({
            --         cmd = { exe_path("clangd") },
            --         capabilities = cmp_capabilities,
            --         on_attach = default_on_attach,
            --     })
            -- end
            -- if exe_path("zls") ~= nil then
            --     lspconfig.zls.setup({
            --         cmd = { exe_path("zls") },
            --         capabilities = cmp_capabilities,
            --         on_attach = default_on_attach
            --     })
            -- end
            -- if exe_path("fortls") ~= nil then
            --     lspconfig.fortls.setup({
            --         cmd = { exe_path("fortls") },
            --         capabilities = cmp_capabilities,
            --         on_attach = default_on_attach
            --     })
            -- end
            -- if exe_path("gopls") ~= nil then
            --     lspconfig.gopls.setup({
            --         cmd = { exe_path("gopls") },
            --         capabilities = cmp_capabilities,
            --         on_attach = default_on_attach,
            --     })
            -- end
        end
    }
}
