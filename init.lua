-- Init file!
-------------------------------------------------
local start_time = vim.uv.hrtime()
-------------------------------------------------
-- Init core
------------------------------------------------
require("config.lazy")          -- Lazy.nvim set-up
require("config.options")       -- vim options
require("config.colorscheme")   -- colorscheme config
require("config.keymaps")       -- re-mapings
require("config.usercommands")  -- user defined commands
-------------------------------------------------
-- Init plugins
-------------------------------------------------
require("config.plugins.toggleterm")    -- toggleterm special terminals
vim.notify = require("notify")          -- set notifification system to notify.nvim
require("plugin.flowin")
require("plugin.fterm")
-------------------------------------------------
-- Other options
-------------------------------------------------
--Colorscheme------------------------------------
SetColorScheme(require("config.current-theme")) -- no args: default, see config.colorscheme
--Print-startup-time-----------------------------
vim.notify(string.format("Neovim loaded in %.4fms",((vim.uv.hrtime() - start_time)/1e6)),"info",{title = "Welcome again!"})
