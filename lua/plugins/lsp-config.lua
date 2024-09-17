return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = cmp_capabilities
            })
            vim.keymap.set('n',"<leader>ld",vim.lsp.buf.hover,{desc = "documentation"})
            vim.keymap.set('n',"<leader>lD",vim.lsp.buf.definition,{desc = "go to definition"})
            vim.keymap.set('n',"<leader>lr",vim.lsp.buf.rename,{ desc = "rename symbol"})
            vim.keymap.set('n',"<leader>ls",vim.lsp.buf.document_symbol,{desc = "document symbols"})
            vim.keymap.set('n',"<leader>A",vim.lsp.buf.code_action,{desc = "code action"})
            vim.keymap.set('n',"<leader>li","<CMD>LspInfo<CR>",{desc = "shows lsp info"})
        end
    }
}

