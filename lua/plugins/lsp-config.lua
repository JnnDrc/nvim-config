return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
    },
}
