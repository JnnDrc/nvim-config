return {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opt = {
            styles = {},
            bigfile = { enabled = false },
            dashboard = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
        config = function()
            -- Enable/Disable plugins
            Snacks.toggle.profiler():map("<leader>pp")
            Snacks.toggle.profiler_highlights():map("<leader>ph")
        end,
        keys = {
            {"<leader>.", function() Snacks.scratch() end,desc = "Toggle scratch buffer"},
            {"<leader>S", function() Snacks.scratch.select() end,desc = "Toggle scratch buffer"},
            {"<leader>ps",function() Snacks.profiler.scratch() end, desc = "Profiler scratch buffer"},
        }
}
