-- options.lua -----------------------------------------------------------------
-- leader ------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- misc --------------------------------
vim.opt.clipboard:append("unnamedplus")

vim.o.timeoutlen = 500

vim.o.splitbelow = true

vim.o.undofile = true

vim.o.swapfile = false

vim.o.tags = "./tags;,tags;"
-- ui ----------------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorcolumn = false

vim.o.wrap = false
vim.o.linebreak = false

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.o.termguicolors = true
vim.o.signcolumn  = "yes"
vim.o.colorcolumn = "80"
vim.o.showmatch = true
vim.o.showmode  = true
vim.o.winborder = "rounded"

vim.o.list = true
vim.o.listchars = 'tab:» ,trail:·,space:·,nbsp:␣'
-- indentation -------------------------
local tab_size  = 4
vim.o.tabstop     = tab_size
vim.o.shiftwidth  = tab_size
vim.o.softtabstop = tab_size
vim.o.expandtab   = true
vim.o.smartindent = true
vim.o.autoindent  = true
-- files -------------------------------
vim.o.autoread   = true
vim.o.autowrite  = false
vim.o.updatetime = 400

vim.filetype.add({
    extension = {
        h = "c"
    }
})

-- search ------------------------------
vim.o.ignorecase = true vim.o.smartcase  = true
vim.o.incsearch  = true
vim.o.hlsearch  = true
-- folding -----------------------------
vim.o.foldmethod = "manual"
vim.o.foldcolumn = "1"
vim.o.foldlevel  = 99
