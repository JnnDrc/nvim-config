return {
    -- set the colorscheme in init.lua
    -- colorfulls
    -- {
    --     "catppuccin/nvim",
    --     priority = 1000,
    -- },
    -- {
    --     "morhetz/gruvbox",
    --     priority = 1000,
    -- },
    {
        "rose-pine/neovim",
        priority = 1000,
    },
    {
        "vague2k/vague.nvim",
        priority = 1000,
    },
    {
        "lucasadelino/conifer.nvim",
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
            -- colours:
            -- > yellow (default)
            -- > orange
            -- > red
            -- > green
            -- > blue
            -- > magenta
            -- > cyan
            vim.cmd "let g:accent_colour = 'magenta' "
            vim.cmd "let g:accent_darken = 1"
        end
    },
}
