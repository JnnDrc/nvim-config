return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local tsconfig = require("nvim-treesitter.configs")
            tsconfig.setup({
            ensure_installed = {"lua","c","make","toml","markdown"},
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            highlight = { eneable = true},
            indent = { eneable = true},
        })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    }
}
