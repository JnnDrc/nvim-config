return {
    {
        -- compile mode
        "ej-shafran/compile-mode.nvim",
        version = "^5.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function ()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            -- baleia_setup = true,
            -- bang_expansion = true,
        }
        end
    },
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
}
