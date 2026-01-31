-- misc/plugins with less config
return {
    -- markview
    {"OXY2DEV/markview.nvim"},
    {
        --eldoc
        "sj2tpgk/nvim-eldoc",
        config = function()
            require("nvim-eldoc").setup()

            vim.cmd "set updatetime=700"
            vim.cmd "hi link Eldoc Normal"
            vim.cmd "hi link EldocCur Identifier"
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
    },
}
