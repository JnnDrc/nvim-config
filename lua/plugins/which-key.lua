return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
        local wk = require("which-key").setup({
            preset = "helix"
        })
        if wk then
            wk.add({"<leader>s",group = "Symbols(Namu)"})
        end
    end
}
