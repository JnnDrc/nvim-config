return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local tsconfig = require("nvim-treesitter.configs")
        tsconfig.setup({
        ensure_installed = {"lua","c","make","toml","markdown"},
        highlight = { eneable = true},
        indent = { eneable = true},
    })
    end
}
