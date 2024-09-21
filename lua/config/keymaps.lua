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
map_key('n',"<leader>wH","<CMD>new<CR>","Create a new window in horizontal")
map_key('n',"<leader>wh","<CMD>split<CR>","Split the current window in horizontal")
map_key('n',"<leader>wV","<CMD>vnew<CR>","Create a new window in vertical")
map_key('n',"<leader>wv","<CMD>vsplit<CR>","Split the current window in vertical")
map_key('n',"<leader>wc","<CMD>close<CR>","Close the current window")

-- Window save/quiting
map_key('n',"<leader>www","<CMD>wall<CR>","Write all files with changes")
map_key('n',"<leader>wqq","<CMD>qall<CR>","Close all windows and quit nvim")
map_key('n',"<leader>wwq","<CMD>wqall<CR>","Write all files and quit nvim")
map_key('n',"<leader>wq!","<CMD>qall!<CR>","Throw all changes and quit nvim")

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
map_key('n',"<leader>r","<CMD>so %<CR>","Reload neovim config")

-- buffer keymaps
map_key('n',"<leader>c","<CMD>bd<CR>","Close current buffer")
map_key('n',"<leader>x","<CMD>bd!<CR>","Throw out current buffer")
map_key('n',"<TAB>","<CMD>bnext<CR>","Go to the next buffer")
map_key('n',"<S-TAB>","<CMD>bprevious<CR>","Go to the previous buffer")
-------------------------------------------------
-- Plugins keymaps
-------------------------------------------------
-- Alpha
map_key('n',"<leader>a","<CMD>Alpha<CR>","Dashboard/Alpha")
-- Lazy & Mason
map_key('n',"<leader>pl","<CMD>Lazy<CR>","Open Lazy dashboard")
map_key('n',"<leader>pm","<CMD>Mason<CR>","Open Mason dashboard")
-- Neotree
map_key('n',"<leader>e","<CMD>Neotree toggle<CR>","Toggle Neotree")
-- Telescope
map_key('n',"<leader>gc","<CMD>Telescope git_commits<CR>","Show git commits")
map_key('n',"<leader>gb","<CMD>Telescope git_branches<CR>","Show git branches")
map_key('n',"<leader>gs","<CMD>Telescope git_status<CR>","Show git status")
-- ToggleTerm
map_key('n',"<leader>th","<CMD>ToggleTerm direction=horizontal<CR>","Toggle horizontal terminal")
map_key('n',"<leader>tv","<CMD>ToggleTerm direction=vertical size=60<CR>","Toggle horizontal terminal")
map_key('n',"<leader>tf","<CMD>ToggleTerm direction=float<CR>","Toggle horizontal terminal")

map_key('',"<F7>","<CMD>ToggleTerm<CR>","Toggle last terminal section")
map_key('t',"<ESC>","<CMD>ToggleTerm<CR>","Close terminal")

map_key('n',"<leader>tn","<CMD>TermExec cmd=\"node\"<CR>","Toggle NodeJS")
map_key('n',"<leader>tp","<CMD>TermExec cmd=\"python\"<CR>","Toggle Python")
map_key('n',"<leader>tl","<CMD>TermExec cmd=\"lua\"<CR>","Toggle Lua")
-------------------------------------------------
-- Config/User keymaps
-------------------------------------------------
-- Themes
map_key('n',"<leader>C","<CMD>SelectColors<CR>","Change Colorscheme(UI)")
