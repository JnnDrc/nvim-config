return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
        require("which-key").setup({
            preset = "helix"
        })
        require('which-key').add(
            {
                {"<leader>", group = "Leader"},
                {"<leader><leader>", group = "Misc"},
                {"<leader>f", group = "Telescope"},
                {"<leader>F", group = "Folding"},
                {"<leader>m", group = "Markview"},
                {"<leader>g", group = "Git"},
                {"<leader>l", group = "LSP"},
                {"<leader>t", group = "Terminal"},
                {"<leader>w", group = "Window"},
                {"<leader>p", group = "Plugins"},
                {"<leader>r", group = "Source config"}
            }
        )
    end,
}
