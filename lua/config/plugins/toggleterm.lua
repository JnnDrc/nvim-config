-------------------------------------------------
-- Toggleterm configuration!
-------------------------------------------------
local Terminal = require("toggleterm.terminal").Terminal

if vim.fn.exepath("lazygit") ~= "" then
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
    })

    function _Lazygit_toggleterm()
      lazygit:toggle()
    end
    vim.api.nvim_set_keymap('n',"<leader>tg","<CMD>lua _Lazygit_toggleterm()<CR>",
    {desc = "lazygit",noremap = true, silent = true})
end

if vim.fn.exepath("yazi") ~= "" then
    local yazi = Terminal:new({
        cmd = "yazi",
        hidden = true,
        direction = "float",
    })
    function _Yazi_toggleterm()
        yazi:toggle()
    end
    vim.api.nvim_set_keymap('n',"<leader>ty","<CMD> lua _Yazi_toggleterm()<CR>",
    {desc = "yazi fm",noremap = true,silent = true})
end
