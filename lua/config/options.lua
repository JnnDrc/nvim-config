-------------------------------------------------
-- Options configuration!
-------------------------------------------------

local opt = vim.opt
local g = vim.g
-------------------------------------------------
-- General
-------------------------------------------------
opt.clipboard:append("unnamedplus")

if false then
opt.mouse = ""
end

g.loaded_netrw = nil
g.loaded_netrwPlugin = nil
opt.timeoutlen = 500
-------------------------------------------------
-- UI
-------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.showmatch = true
opt.showmode = false
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
