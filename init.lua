-- init.lua --------------------------------------------------------------------
-- startup -----------------------------
local start_time = vim.uv.hrtime()
package.path = package.path .. ";" .. vim.fn.stdpath("data") .. "/?.lua"

require("options")
kmap    = require("keymaps")
usercmd = require("usercmd")
autocmd = require("autocmd")
color   = require("colors")
parser  = require("parser")

-- load plugins ------------------------
pack = require("pack")
pack.load()

-- init config --
kmap.load()
usercmd.load()
autocmd.load()
color.load()

-- init plugins ------------------------
require("plugin.fterm").setup()     -- floating terminal
require("plugin.scratch").setup()   -- floating lua scratch buffer
require("plugin.bufline").setup()   -- custom buffer line on status line
require("plugin.notebuffer").setup()    -- notes manager

-- load tree-sitter parsers ------------
-- parser.load()    -- disable for now

-- print startup time ------------------
vim.notify(string.format("Neovim loaded in %.4fms",((vim.uv.hrtime() - start_time)/1e6)), vim.log.levels.INFO, {title = "Welcome again!"})
