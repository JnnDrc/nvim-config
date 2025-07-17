--fterm.nvim----------------------------------------------
-- A simple floating terminal with flowin
-----------------------------------------------------------

local fw = require("plugin.flowin")

local _fterm = fw.window()

vim.api.nvim_create_user_command("FTerm",
function()
    fw.toggle(_fterm,nil,function (win,buf)
        if vim.bo[buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
        vim.bo[buf].buflisted = false
    end)
end,
{}
)
vim.keymap.set("n","<leader>t","<CMD>FTerm<CR>",{desc = "Toggle fterm(mah plagin)"})
