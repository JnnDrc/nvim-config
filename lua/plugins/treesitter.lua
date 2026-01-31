return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            local tsconfig = require("nvim-treesitter.configs")
            tsconfig.setup({
                ensure_installed = {"lua","c","make","markdown"},
                highlight = { enable = true },
                indent = { enable = true },
        })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    }
}
