return {
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
