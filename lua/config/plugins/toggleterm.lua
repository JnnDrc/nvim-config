-------------------------------------------------
-- Toggleterm configuration!
-------------------------------------------------
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function _Lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap('n',"<leader>tg","<CMD>lua _Lazygit_toggle()<CR>",{desc = "lazygit",noremap = true, silent = true})
