return {
    "https://github.com/phrmendes/notes.nvim",
    config = function ()
        local K = require("keymaps")
        local notes = require("notes")
        local path = vim.fs.joinpath(vim.env.HOME,"Notes")
        
        notes.setup({
            path = path,
            picker = "mini",
            journal = "%d-%m-%Y",
            lsp = {
                marksmen = {enabled = false},
                ltex_plus = {
                    enabled = false,
                    languages = { default = "en-US", additionals = "pt-BR"},
                }
            }
        })

        K.keymap('n', "<leader>nn",function () notes.new() end, "Notes: new")
        K.keymap('n', "<leader>ns",function () notes.search() end, "Notes: search")
        K.keymap('n', "<leader>n/",function () notes.grep() end, "Notes: grep")
        K.keymap('n', "<leader>nj",function () notes.journal() end, "Notes: journal")
    end
}
