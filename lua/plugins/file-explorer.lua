return {
    -- neo-tree : tree explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-tree/nvim-web-devicons',
            "MunifTanjim/nui.nvim",
        },
        config = function()
          require("neo-tree").setup({
              source_selector = {
                winbar = true,
              },
          })
          vim.cmd([[ 
          autocmd Filetype neo-tree setlocal nofoldenable
          ]])
        end
    },
    -- oil: buffer explorer
    {
        "stevearc/oil.nvim",
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        config = function()
            require("oil").setup({
                default_file_explorer = false,
                delete_to_trash = true,
                skip_confirm_for_simple_edits = true,
                win_options = {
                    wrap = true
                }
            })
        end
    }

}


