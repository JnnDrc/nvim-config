-------------------------------------------------
-- Options configuration!
-------------------------------------------------

local opt = vim.opt
local g = vim.g
-------------------------------------------------
-- General
-------------------------------------------------
opt.clipboard = "unnamedplus"
if false then
opt.mouse = ""
end

g.loaded_netrw = nil
g.loaded_netrwPlugin = nil
-------------------------------------------------
-- Indentation
-------------------------------------------------
local tab_size = 4
opt.tabstop = tab_size
opt.softtabstop = tab_size
opt.shiftwidth = tab_size
opt.expandtab = true
opt.smartindent = true
-------------------------------------------------
-- Folding
-------------------------------------------------
opt.foldmethod = "manual"
opt.foldcolumn = "1"
-------------------------------------------------
-- UI
-------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmatch = true
opt.termguicolors = true
opt.wrap = false
