return{
    {
        "https://github.com/OXY2DEV/markview.nvim",
    },
    {
        "https://github.com/lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end,
    },
}
