-------------------------------------------------------------------------------\
-- Keymaps configuration!
-------------------------------------------------------------------------------/
----------------------------------------
-- Utils
----------------------------------------

---function map a key to a command or function
---@param _mode string | table
---@param _key string
---@param _cmd string | function
---@param _desc? string
---@param _oopts? table
function keymap(_mode,_key,_cmd,_desc,_oopts)
    _desc = _desc or ""
  local opts = {desc = _desc,noremap = true,silent = true}
  if _oopts then
    opts = vim.tbl_extend("force",opts,_oopts)
  end
  vim.keymap.set(_mode,_key,_cmd,opts)
end

----------------------------------------
-- Neovim keympas
----------------------------------------

-- Window shortcuts
keymap('n',"<leader>wH","<CMD>new<CR>","Create a new window in horizontal")
keymap('n',"<leader>wh","<CMD>split<CR>","Split the current window horizontaly")
keymap('n',"<leader>wV","<CMD>vnew<CR>","Create a new window in vertical")
keymap('n',"<leader>wv","<CMD>vsplit<CR>","Split the current window verticaly")
keymap('n',"<leader>wc","<CMD>close<CR>","Close the current window")

keymap('n',"<leader>www","<CMD>wall<CR>","Write all files with changes")
keymap('n',"<leader>wqq","<CMD>qall<CR>","Close all windows and quit nvim")
keymap('n',"<leader>wwq","<CMD>wqall<CR>","Write all files and quit nvim")
keymap('n',"<leader>wq!","<CMD>qall!<CR>","Throw all changes and quit nvim")

keymap('n',"<leader>ws","<C-w>x","Swap the current with the next")

keymap({'n','t'},"<C-H>","<C-W>h")
keymap({'n','t'},"<C-L>","<C-W>l")
keymap({'n','t'},"<C-J>","<C-W>j")
keymap({'n','t'},"<C-K>","<C-W>k")

keymap({'n','t'},"<C-up>","<CMD>resize +1<CR>")
keymap({'n','t'},"<C-down>","<CMD>resize -1<CR>")
keymap({'n','t'},"<C-right>","<CMD>vertical resize +1<CR>")
keymap({'n','t'},"<C-left>","<CMD>vertical resize -1<CR>")

keymap('t',"<ESC><ESC>","<C-\\><C-n>","Escape terminal")

-- Config reload
keymap('n',"<leader>rf","<CMD>so %<CR>","source current file")
keymap('n',"<leader>rr",function ()
    local init_lua = vim.fn.stdpath("config") .. "/init.lua"
    vim.cmd ("so " .. init_lua)
end,"source entire config")

-- Scrooling
keymap('n',"<S-k>","<C-y>")
keymap('n',"<S-j>","<C-e>")

-- Moving
if false then
    keymap('n',"<A-k>","<CMD>move .-2<CR>","Move line up")
    keymap('n',"<A-j>","<CMD>move .+1<CR>","Move line down")
    keymap({'v','x'},"<A-k>","<CMD>move '<-2<CR>gv=gv","Move selection up")
    keymap({'v','x'},"<A-j>","<CMD>move '>+1<CR>gv=gv","Move selection down")

    keymap({'v','x'},"<A-l>", "dpgvlol", "Move selection right")
    keymap({'v','x'},"<A-h>", "dhPgvhoh", "Move selection left")
end

-- Indent
keymap({'v','x'},">",">gv", "Indent selection")
keymap({'v','x'},"<","<gv", "Indent selection")

-- Buffer keymaps
keymap('n',"<leader>c","<CMD>bd<CR>","Close current buffer")
keymap('n',"<leader>x","<CMD>bd!<CR>","Throw out current buffer")
keymap('n',"<S-l>","<CMD>bnext<CR>","Go to the next buffer")
keymap('n',"<S-h>","<CMD>bprevious<CR>","Go to the previous buffer")

-- Folding
keymap('n',"<leader>Fo","zo","Open a fold under the cursor")
keymap('n',"<leader>Fc","zc","Close a fold under the cursor")
keymap('n',"<leader>Fa","za","Toggle a fold under the cursor")
keymap('n',"<leader>FA","zR","Toggle all folds in the buffer")
keymap('n',"<leader>Ff","zf%","Create a fold under the cursor")
keymap('n',"<leader>Fd","zd","Delete a fold under the cursor")
keymap('n',"<leader>FD","zD","Delete all folds under the cursor")

-------------------------------------------------
-- Plugins keymaps
-------------------------------------------------
-- Lazy & Mason
keymap('n',"<leader>pl","<CMD>Lazy<CR>","Open Lazy dashboard")
keymap('n',"<leader>pm","<CMD>Mason<CR>","Open Mason dashboard")
-- Telescope
keymap('n',"<leader>gc","<CMD>Telescope git_commits theme=ivy<CR>","Show git commits")
keymap('n',"<leader>gr","<CMD>Telescope git_branches theme=ivy<CR>","Show git branches")
keymap('n',"<leader>gs","<CMD>Telescope git_status theme=ivy<CR>","Show git status")
keymap('n',"<leader>n","<CMD>Telescope notify theme=dropdown<CR>","See notify history")
-- Gitsigns
keymap('n',"<leader>gp","<CMD>Gitsigns preview_hunk<CR>","Preview hunk")
keymap('n',"<leader>gb","<CMD>Gitsigns toggle_current_line_blame<CR>","Toggle line blame")
keymap('n',"<leader>gl","<CMD>Gitsigns blame_line<CR>","Blame the current line")
-- Compile-mode
keymap('n',"<C-b>","<CMD>Compile<CR>","Enter compile mode")
keymap('n',"<C-n>","<CMD>NextError<CR>","Next error")
keymap('n',"<C-p>","<CMD>PrevError<CR>","Previous error")
-- Mini.nvim
keymap('n','<leader>e',MiniFiles.open,"open mini files")
keymap('n','<leader>D',MiniStarter.open,"open dashboard")
-- Markview
keymap('n',"<leader>mo","<CMD>Markview open<CR>", "open path under cursor")
keymap('n',"<leader>mt","<CMD>Markview toggle<CR>", "toggle markview")
-------------------------------------------------
-- Config/User keymaps
-------------------------------------------------
keymap('n',"<leader>th","<CMD>split | terminal<CR> <CMD>resize -10<CR>a","open horizontal split terminal")
keymap('n',"<leader>tv","<CMD>vsplit | terminal<CR> <CMD>resize -10<CR>a","open vertical split terminal")
--- kj
keymap('i',"kj","<ESC>","quick exit insert mode")
-- Obscure commands (double leader)
keymap('n',"<leader><leader>s","<CMD>Rshl<CR>","Reset the search highlight")
keymap('v',"<leader><leader>p","<ESC>a)<ESC>gvo<ESC>i(<ESC>", "enclosure selection in parenthesis")
keymap('v',"<leader><leader>b","<ESC>a]<ESC>gvo<ESC>i[<ESC>", "enclosure selection in brackets")
keymap('v',"<leader><leader>B","<ESC>a}<ESC>gvo<ESC>i{<ESC>", "enclosure selection in curly brackets")
keymap('v',"<leader><leader>q","<ESC>a\"<ESC>gvo<ESC>i\"<ESC>", "enclosure selection in double quotes")
keymap('v',"<leader><leader>Q","<ESC>a\'<ESC>gvo<ESC>i\'<ESC>", "enclosure selection in single quotes")
