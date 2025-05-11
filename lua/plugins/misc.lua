-- misc/plugins with less config
return {
    --vim mov
    {"matze/vim-move"},
    {
        -- mini.icons
        'echasnovski/mini.icons',
        version = false,
        config = function ()
            require('mini.icons').setup()
        end
    },
    {
        -- autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        -- colorizer
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("colorizer").setup()
        end
    }
}
