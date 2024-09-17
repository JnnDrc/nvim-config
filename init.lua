-------------------------------------------------
-- Init core
-------------------------------------------------
require("config.lazy")
require("config.options")
require("config.keymaps")
--Colorscheme------------------------------------
vim.cmd.colorscheme "catppuccin"
-------------------------------------------------
-------------------------------------------------
-- Init plugins
-------------------------------------------------
require("bufferline").setup()
require("neo-tree").setup()
require("neodev").setup()

