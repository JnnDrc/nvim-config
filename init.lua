-------------------------------------------------
-- Init file!
-------------------------------------------------
local start_time = vim.uv.hrtime()  -- measure startup time
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
require("config.plugins.netrw")         -- netrw options
require("plugin.flowin")                -- little plugin for make floating windows(my first try to make a plugin)
require("plugin.fterm")                 -- terminal using flowin
-------------------------------------------------
-- Other options
-------------------------------------------------
--Colorscheme------------------------------------
SetColorScheme(require("config.current-theme")) -- no args: default, see config.colorscheme
--Print-startup-time-----------------------------
vim.notify(string.format("Neovim loaded in %.4fms",((vim.uv.hrtime() - start_time)/1e6)),vim.log.levels.INFO,{title = "Welcome again!"})
