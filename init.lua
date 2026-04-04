-- init.lua --------------------------------------------------------------------
-- startup -----------------------------
local start_time = vim.uv.hrtime()
package.path = package.path .. ";" .. vim.fn.stdpath("data") .. "/?.lua"

require("options")
kmap    = require("keymaps")
usrcmd  = require("usercommands")
color   = require("colors")
-- load plugins ------------------------
local pack = require("pack")
pack.load()

-- init config --
kmap.load()
usrcmd.load()
color.load()

-- init plugins ------------------------
require("plugin.fterm").setup()  -- floating terminal
require("plugin.scratch")        -- floating lua scratch buffer

-- print startup time ------------------
vim.notify(string.format("Neovim loaded in %.4fms",((vim.uv.hrtime() - start_time)/1e6)), vim.log.levels.INFO, {title = "Welcome again!"})
