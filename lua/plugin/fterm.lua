-- just testing tings

local fw = require("plugin.flowin")

local _fterm = fw.window()

vim.api.nvim_create_user_command("FTerm",
function()
    if not vim.api.nvim_win_is_valid(_fterm.win) then
        _fterm = fw.create_window({buf = _fterm.buf})
        if vim.bo[_fterm.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
    else
        vim.api.nvim_win_hide(_fterm.win)
    end
    vim.bo[_fterm.buf].buflisted = false
end,
{}
)
vim.keymap.set("n","<leader>tt","<CMD>FTerm<CR>",{desc = "Toggle fterm(mah plagin)"})
