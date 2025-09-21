return {
    -- set the colorscheme in init.lua
    -- colorfulls
    {
        "catppuccin/nvim",
        priority = 1000,
    },
    {
        "morhetz/gruvbox",
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
    },
    -- darkies
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
    },
    {
        "Alligator/accent.vim",
        priority = 1000,
        config = function()
            vim.cmd "let g:accent_colour = 'yellow' "
            vim.cmd "let g:accent_darken = 1"
        end
    },
}
