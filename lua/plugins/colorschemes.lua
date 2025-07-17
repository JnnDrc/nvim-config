return {
    -- set the colorscheme in init.lua
    -- colorfulls
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "morhetz/gruvbox",
        lazy = false,
        priority = 1000,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup({
                style = 'darker'
            })
        end
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
    },
    -- darkies
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "Alligator/accent.vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd "let g:accent_colour = 'yellow' "
            vim.cmd "let g:accent_darken = 1"
        end
    },
}
