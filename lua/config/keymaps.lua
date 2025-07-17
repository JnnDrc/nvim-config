-------------------------------------------------
-- Keymaps configuration!
-------------------------------------------------

-------------------------------------------------
-- Utils
-------------------------------------------------

---function map a key to a command or function
---@param _mode string | table
---@param _key string
---@param _cmd string | function
---@param _desc? string
---@param _oopts? table
local function map_key(_mode,_key,_cmd,_desc,_oopts)
    _desc = _desc or ""
  local opts = {desc = _desc,noremap = true,silent = true}
  if _oopts then
    opts = vim.tbl_extend("force",opts,_oopts)
  end
  vim.keymap.set(_mode,_key,_cmd,opts)
end


-------------------------------------------------
-- Neovim keympas
-------------------------------------------------

-- Disable arrow keys
if true then
  map_key('',"<up>","<nop>")
  map_key('',"<down>","<nop>")
  map_key('',"<left>","<nop>")
  map_key('',"<right>","<nop>")
end

-- Window shortcuts
map_key('n',"<leader>wH","<CMD>new<CR>","Create a new window in horizontal")
map_key('n',"<leader>wh","<CMD>split<CR>","Split the current window in horizontal")
map_key('n',"<leader>wV","<CMD>vnew<CR>","Create a new window in vertical")
map_key('n',"<leader>wv","<CMD>vsplit<CR>","Split the current window in vertical")
map_key('n',"<leader>wc","<CMD>close<CR>","Close the current window")

map_key('n',"<leader>www","<CMD>wall<CR>","Write all files with changes")
map_key('n',"<leader>wqq","<CMD>qall<CR>","Close all windows and quit nvim")
map_key('n',"<leader>wwq","<CMD>wqall<CR>","Write all files and quit nvim")
map_key('n',"<leader>wq!","<CMD>qall!<CR>","Throw all changes and quit nvim")

map_key('n',"<leader>ws","<C-w>x","Swap the current with the next")

map_key({'n','t'},"<C-H>","<C-W>h")
map_key({'n','t'},"<C-L>","<C-W>l")
map_key({'n','t'},"<C-J>","<C-W>j")
map_key({'n','t'},"<C-K>","<C-W>k")

map_key({'n','t'},"<C-up>","<CMD>resize +1<CR>")
map_key({'n','t'},"<C-down>","<CMD>resize -1<CR>")
map_key({'n','t'},"<C-right>","<CMD>vertical resize +1<CR>")
map_key({'n','t'},"<C-left>","<CMD>vertical resize -1<CR>")

map_key('t',"<ESC><ESC>","<C-\\><C-n>","Escape terminal")

-- Config reload
map_key('n',"<leader>rf","<CMD>so %<CR>","source current file")
map_key('n',"<leader>rr",function ()
    local init_lua = vim.fn.stdpath("config") .. "/init.lua"
    vim.cmd ("so " .. init_lua)
end,"source entire config")

-- Scrooling
map_key('n',"<S-k>","<C-y>")
map_key('n',"<S-j>","<C-e>")

-- Moving
if false then
    map_key('n',"<A-k>","<CMD>move .-2<CR>","Move line up")
    map_key('n',"<A-j>","<CMD>move .+1<CR>","Move line down")
    map_key('v',"<A-k>","<CMD>move '<-2<CR>gv=gv","Move selection up")
    map_key('v',"<A-j>","<CMD>move '>+1<CR>gv=gv","Move selection down")
    map_key('v',"<A-l>", "dpgvlol", "Move selection right")
    map_key('v',"<A-h>", "dhpgvlol", "Move selection left")
end

-- Buffer keymaps
map_key('n',"<leader>c","<CMD>bd<CR>","Close current buffer")
map_key('n',"<leader>x","<CMD>bd!<CR>","Throw out current buffer")
map_key('n',"<S-l>","<CMD>bnext<CR>","Go to the next buffer")
map_key('n',"<S-h>","<CMD>bprevious<CR>","Go to the previous buffer")

-- Folding
map_key('n',"<leader>Fo","zo","Open a fold under the cursor")
map_key('n',"<leader>Fc","zc","Close a fold under the cursor")
map_key('n',"<leader>Fa","za","Toggle a fold under the cursor")
map_key('n',"<leader>FA","zR","Toggle all folds in the buffer")
map_key('n',"<leader>Ff","zf%","Create a fold under the cursor")
map_key('n',"<leader>Fd","zd","Delete a fold under the cursor")
map_key('n',"<leader>FD","zD","Delete all folds under the cursor")

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
-- Oil
map_key('n','<leader>o',"<CMD>Oil<CR>","Toggle oil")
-- Telescope
map_key('n',"<leader>gc","<CMD>Telescope git_commits theme=ivy<CR>","Show git commits")
map_key('n',"<leader>gr","<CMD>Telescope git_branches theme=ivy<CR>","Show git branches")
map_key('n',"<leader>gs","<CMD>Telescope git_status theme=ivy<CR>","Show git status")
map_key('n',"<leader>n","<CMD>Telescope notify theme=dropdown<CR>","See notify history")
map_key('n',"<leader>ft","<CMD>TodoTelescope theme=ivy<CR>","Find TODO tags")
-- Gitsigns
map_key('n',"<leader>gp","<CMD>Gitsigns preview_hunk<CR>","Preview hunk")
map_key('n',"<leader>gb","<CMD>Gitsigns toggle_current_line_blame<CR>","Toggle line blame")
map_key('n',"<leader>gl","<CMD>Gitsigns blame_line<CR>","Blame the current line")
-- Markview
map_key('n',"<leader>mt","<CMD>Markview toggle<CR>","Toggle the preview mode")
-------------------------------------------------
-- Config/User keymaps
-------------------------------------------------
-- Themes
map_key('n',"<leader>C","<CMD>ColorsSelect<CR>","Change Colorscheme(UI)")
-- Obscure commands (double leader)
map_key('n',"<leader><leader>s","<CMD>Rshl<CR>","Reset the search highlight")
