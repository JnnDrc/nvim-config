-------------------------------------------------
-- Options configuration!
-------------------------------------------------

local opt = vim.opt
local g = vim.g
-------------------------------------------------
-- General
-------------------------------------------------
opt.clipboard:append("unnamedplus")

-- disable mouse
if false then
    opt.mouse = ""
end

opt.timeoutlen = 500

opt.splitbelow = true

opt.undofile = true
-------------------------------------------------
-- UI
-------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = false

opt.wrap = false
opt.linebreak = false

opt.scrolloff = 10
opt.sidescrolloff = 10

opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.showmatch = true
opt.showmode = false
opt.winborder = "rounded"

opt.list = true
opt.listchars = 'tab:» ,trail:·,space:·,nbsp:␣'
-------------------------------------------------
-- Indentation
-------------------------------------------------
local tab_size = 4
opt.tabstop = tab_size
opt.shiftwidth = tab_size
opt.softtabstop = tab_size
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
-------------------------------------------------
-- Files
-------------------------------------------------
opt.autoread = true
opt.autowrite = false
opt.updatetime = 400
-------------------------------------------------
-- Search
-------------------------------------------------
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
-------------------------------------------------
-- Folding
-------------------------------------------------
opt.foldmethod = "manual"
opt.foldcolumn = "1"
opt.foldlevel = 99
-------------------------------------------------
-- Netrw
-------------------------------------------------
-- netrw options
local netrw = nil
g.loaded_netrw = netrw        -- 1 = off, 0 | nil = on
g.loaded_netrwPlugin = netrw  -- 1 = off, 0 | nil = on
if (not g.loaded_netrw) and (not g.loaded_netrwPlugin) then
    g.netrw_banner = 1                              -- Netrw banner on top                                                        
    g.netrw_altv = 1                                -- Create the split of the Netrw window to the left                           
    -- g.netrw_browse_split = 4                        -- Open files in previous window. This emulates the typical "drawer" behavior 
    g.netrw_liststyle = 4                           -- Set the styling of the file list to be one column with files inside
    -- g.netrw_winsize = 14                            -- Set the width of the "drawer"
    g.netrw_list_hide = '^\\./\\?$'                 -- hide ./
    -- g.netrw_list_hide = '^\\./\\?$,^\\.\\./\\?$'    -- hide ./ and ../
end
