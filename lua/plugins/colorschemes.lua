return {
  -- set the colorscheme in init.lua
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
    -- {
    --     "doums/darcula",
    --     lazy = false,
    --     priority = 1000,
    -- },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require('onedark').setup({
                style = 'darker'
            })
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
    }
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false,
    --     priority = 1000,
    -- },
}
