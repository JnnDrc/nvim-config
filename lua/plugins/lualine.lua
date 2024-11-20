return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox",
                disabled_filetypes = {"alpha","neo-tree"}
            }
        })
    end
}
