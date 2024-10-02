-------------------------------------------------
-- JayNvim options configuration!
-------------------------------------------------

local opt = vim.opt

-------------------------------------------------
-- General
-------------------------------------------------
opt.clipboard = "unnamedplus"
if true then
opt.mouse = ""
end
-------------------------------------------------
-- Indentation
-------------------------------------------------
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-------------------------------------------------
-- UI
-------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmatch = true
opt.termguicolors = true
opt.wrap = false
