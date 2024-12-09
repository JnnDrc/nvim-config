return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "onedark",
                disabled_filetypes = {"alpha","neo-tree"},
                component_separators = { left = '\u{2503}', right = '\u{2503}'}, -- 2503 : line
                section_separators = { left = '\u{258C}' , right = '\u{2590}'}, -- 2588 : full block, 258C: Left half block, 2590: Right halfblock
            }
        })
    end
}
