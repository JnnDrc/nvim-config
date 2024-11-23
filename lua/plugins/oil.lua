return {
    "stevearc/oil.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
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
