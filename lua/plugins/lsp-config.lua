return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
 --             PATH = "append",
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls","clangd","taplo"}
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
            local lua_ls_path = vim.fn.exepath("lua-language-server")
            if lua_ls_path == "" then
              vim.notify("Can't find lua-language-server in $PATH")
            end
            lspconfig.lua_ls.setup({
              cmd = {lua_ls_path},
              capabilities = cmp_capabilities,
              on_attach =  default_on_attach,
            })

            local clangd_path = vim.fn.exepath("clangd")
            if clangd_path == "" then
              vim.notify("Can't find clangd in $PATH")
            end
            lspconfig.clangd.setup({
              cmd = {clangd_path},
              capabilities = cmp_capabilities,
              on_attach = default_on_attach,
            })


        end
    }
}

