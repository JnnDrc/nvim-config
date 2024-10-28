return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                    ensure_installed = {"lua_ls","clangd","taplo","asm_lsp"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            local function default_on_attach()
              vim.keymap.set('n',"<leader>A",vim.lsp.buf.code_action,{desc = "code action"})
              vim.keymap.set('n',"<leader>d",vim.diagnostic.open_float,{desc = "see diagnostics"})
              vim.keymap.set('n',"<leader>ld",vim.lsp.buf.hover,{desc = "documentation"})
              vim.keymap.set('n',"<leader>lD",vim.lsp.buf.definition,{desc = "go to definition"})
              vim.keymap.set('n',"<leader>lr",vim.lsp.buf.rename,{ desc = "rename symbol"})
              vim.keymap.set('n',"<leader>ls",vim.lsp.buf.document_symbol,{desc = "document symbols"})
              vim.keymap.set('n',"<leader>li","<CMD>LspInfo<CR>",{desc = "shows lsp info"})
            end
            local function exe_path(lsp)
                local path = vim.fn.exepath(lsp)
                if path == "" then
                    vim.notify("Can't find " .. lsp .. "executable")
                end
                return path
            end
            local lua_ls_path = exe_path("lua-language-server")
            local clangd_path = exe_path("clangd")
            local asm_lsp_path = exe_path("asm-lsp")

            lspconfig.lua_ls.setup({
              cmd = {lua_ls_path},
              capabilities = cmp_capabilities,
              on_attach =  default_on_attach,
            })
            lspconfig.clangd.setup({
              cmd = {clangd_path},
              capabilities = cmp_capabilities,
              on_attach = default_on_attach,
            })
            lspconfig.asm_lsp.setup({
                cmd = {asm_lsp_path},
                capabilities = cmp_capabilities,
                on_attach = default_on_attach,
            })


        end
    }
}

