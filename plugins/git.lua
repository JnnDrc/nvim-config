return {
    "https://github.com/NeogitOrg/neogit",
    lazy = true,
    deps = {
        {"https://github.com/sindrets/diffview.nvim"},
        {"https://github.com/m00qek/baleia.nvim"},
    },
    config = function()
        require("neogit").setup()

        local K = require("keymaps")
        K.keymap('n',"<leader>gg","<CMD>Neogit<CR>","Show Neogit UI")
    end,
}
