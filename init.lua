-------------------------------------------------
-- JayNvim init file
-------------------------------------------------
local start_time = vim.loop.hrtime()
-------------------------------------------------
-- Init core
-------------------------------------------------
require("config.lazy")         -- Lazy.nvim set-up
require("config.options")      -- vim options
require("config.colorscheme")  -- colorscheme config
require("config.keymaps")      -- re-mapings
require("config.usercommands") -- user defined commands
-------------------------------------------------
-- Init plugins
-------------------------------------------------
vim.notify = require("notify") -- set notifification system to notify.nvim
-------------------------------------------------
-- Other options
-------------------------------------------------
--Colorscheme------------------------------------
ChangeColorScheme() -- no args: default, see config.colorscheme
--Print-startup-time-----------------------------
vim.notify(string.format("Neovim loaded in %.4fms",((vim.loop.hrtime() - start_time)/1e6)),"info",{title = "Welcome again!"})
