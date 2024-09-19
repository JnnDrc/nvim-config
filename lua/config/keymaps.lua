-------------------------------------------------
-- JayNvim keymaps configuration!
-------------------------------------------------

-------------------------------------------------
-- Utils
-------------------------------------------------
local set = vim.keymap.set

local function map_key(_mode,_keymap,_cmd,_desc,_oopts)
  local opts = {desc = _desc,noremap = true,silent = true}
  if _oopts then
    opts = opts.._oopts
  end
  set(_mode,_keymap,_cmd,opts)
end


-------------------------------------------------
-- Neovim keympas
-------------------------------------------------

-- Block arrow keys
if true then
  map_key('',"<up>","<nop>")
  map_key('',"<down>","<nop>")
  map_key('',"<left>","<nop>")
  map_key('',"<right>","<nop>")
end

-- Window split
map_key('n',"<leader>wH","<CMD>new<CR>","create a new window in horizontal")
map_key('n',"<leader>wh","<CMD>split<CR>","split the current window in horizontal")
map_key('n',"<leader>wV","<CMD>vnew<CR>","create a new window in vertical")
map_key('n',"<leader>wv","<CMD>vsplit<CR>","split the current window in vertical")
map_key('n',"<leader>wc","<CMD>close<CR>","close the current window")

-- Window save/quiting
map_key('n',"<leader>www","<CMD>wall<CR>","write all files with changes")
map_key('n',"<leader>wqq","<CMD>qall<CR>","close all windows and quit nvim")
map_key('n',"<leader>wwq","<CMD>wqall<CR>","write all files and quit nvim")
map_key('n',"<leader>wq!","<CMD>qall!<CR>","throw all changes and quit nvim")

-- Window movement
map_key('n',"<C-H>","<C-W>h")
map_key('n',"<C-L>","<C-W>l")
map_key('n',"<C-J>","<C-W>j")
map_key('n',"<C-K>","<C-W>k")

-- Window resize
map_key('n',"<C-up>","<CMD>resize +1<CR>")
map_key('n',"<C-down>","<CMD>resize -1<CR>")
map_key('n',"<C-right>","<CMD>vertical resize +1<CR>")
map_key('n',"<C-left>","<CMD>vertical resize -1<CR>")

-- config reload
map_key('n',"<leader>r","<CMD>so %<CR>","reload neovim")

-- buffer keymaps
map_key('n',"<leader>c","<CMD>bd<CR>","close current buffer")
map_key('n',"<leader>C","<CMD>bd!<CR>","throw out current buffer")
map_key('n',"<leader>>","<CMD>bnext<CR>","go to the next buffer")
map_key('n',"<leader><","<CMD>bprevious<CR>","go to the previousbuffer")
-------------------------------------------------
-- Plugins keymaps
-------------------------------------------------
-- Alpha
map_key('n',"<leader>a","<CMD>Alpha<CR>","Dashboard/Alpha")
-- Lazy & Mason
map_key('n',"<leader>pl","<CMD>Lazy<CR>","open Lazy dashboard")
map_key('n',"<leader>pm","<CMD>Mason<CR>","open Mason dashboard")
-- Neotree
map_key('n',"<leader>e","<CMD>Neotree toggle<CR>","toggle Neotree")
-- Telescope
map_key('n',"<leader>gc","<CMD>Telescope git_commits<CR>","show git commits")
map_key('n',"<leader>gb","<CMD>Telescope git_branches<CR>","show git branches")
map_key('n',"<leader>gs","<CMD>Telescope git_status<CR>","show git status")
