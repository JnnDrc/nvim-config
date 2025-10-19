-- misc/plugins with less config
return {
    -- markview
    {"OXY2DEV/markview.nvim"},
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end
    },
}
