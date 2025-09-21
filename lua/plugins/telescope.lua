return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {"nvim-lua/plenary.nvim"},
        event = "VeryLazy",
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "ivy"
                    },
                    buffers = {
                        theme = "ivy"
                    },
                    live_grep = {
                        theme = "ivy"
                    },
                    keymaps = {
                        theme = "dropdown"
                    }
                }
            })
            local builtin = require("telescope.builtin")

            vim.keymap.set('n',"<leader>ff",builtin.find_files,{desc = "find files"})
            vim.keymap.set('n',"<leader>fg",builtin.live_grep,{ desc = "grep in cwd tree"})
            vim.keymap.set('n',"<leader>fb",builtin.buffers,{ desc = "find buffers"})
            vim.keymap.set('n',"<leader>fh",builtin.help_tags,{ desc = "help tags (docs)"})
            vim.keymap.set('n',"<leader>fk",builtin.keymaps,{desc = "nvim keymaps"})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                            require("telescope.themes").get_cursor {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
