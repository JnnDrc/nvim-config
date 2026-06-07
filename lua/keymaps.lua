-- keymaps.lua -----------------------------------------------------------------

local K = {}

---function map a key to a command or function
---@param _mode string | table
---@param _key string
---@param _cmd string | function
---@param _desc? string
---@param _oopts? table
function K.keymap(_mode,_key,_cmd,_desc,_oopts)
    _desc = _desc or ""
  local opts = {desc = _desc,noremap = true,silent = true}
  if _oopts then
    opts = vim.tbl_extend("force",opts,_oopts)
  end
  vim.keymap.set(_mode,_key,_cmd,opts)
end

function K.load()
    -- neovim keymaps ----------------------
    -- Window shortcuts
    K.keymap('n',"<leader>WH","<CMD>new<CR>","Create a new window in horizontal")
    K.keymap('n',"<leader>Wh","<CMD>split<CR>","Split the current window horizontaly")
    K.keymap('n',"<leader>WV","<CMD>vnew<CR>","Create a new window in vertical")
    K.keymap('n',"<leader>Wv","<CMD>vsplit<CR>","Split the current window verticaly")
    K.keymap('n',"<leader>Wc","<CMD>close<CR>","Close the current window")

    K.keymap('n',"<leader>Www","<CMD>wall<CR>","Write all files with changes")
    K.keymap('n',"<leader>Wqq","<CMD>qall<CR>","Close all windows and quit nvim")
    K.keymap('n',"<leader>Wwq","<CMD>wqall<CR>","Write all files and quit nvim")
    K.keymap('n',"<leader>Wq!","<CMD>qall!<CR>","Throw all changes and quit nvim")

    K.keymap('n',"<leader>Ws","<C-w>x","Swap the current with the next")

    K.keymap({'n','t'},"<C-H>","<C-W>h")
    K.keymap({'n','t'},"<C-L>","<C-W>l")
    K.keymap({'n','t'},"<C-J>","<C-W>j")
    K.keymap({'n','t'},"<C-K>","<C-W>k")

    K.keymap({'n','t'},"<C-up>","<CMD>resize +1<CR>")
    K.keymap({'n','t'},"<C-down>","<CMD>resize -1<CR>")
    K.keymap({'n','t'},"<C-right>","<CMD>vertical resize +1<CR>")
    K.keymap({'n','t'},"<C-left>","<CMD>vertical resize -1<CR>")

    K.keymap('t',"<ESC><ESC>","<C-\\><C-n>","Escape terminal")

    -- Config reload
    K.keymap('n',"<leader>rf","<CMD>so %<CR>","source current file")
    K.keymap('n',"<leader>rr",function ()
        local init_lua = vim.fn.stdpath("config") .. "/init.lua"
        vim.cmd ("so " .. init_lua)
    end,"source entire config")

    -- Scrooling
    K.keymap('n',"<S-k>","<C-y>")
    K.keymap('n',"<S-j>","<C-e>")

    -- Buffer 
    K.keymap('n',"<leader>c","<CMD>bd<CR>","Close current buffer")
    K.keymap('n',"<leader>x","<CMD>bd!<CR>","Throw out current buffer")
    K.keymap('n',"<S-l>","<CMD>bnext<CR>","Go to the next buffer")
    K.keymap('n',"<S-h>","<CMD>bprevious<CR>","Go to the previous buffer")

    -- Folding
    K.keymap('n',"<leader>Fo","zo","Open a fold under the cursor")
    K.keymap('n',"<leader>Fc","zc","Close a fold under the cursor")
    K.keymap('n',"<leader>Fa","za","Toggle a fold under the cursor")
    K.keymap('n',"<leader>FA","zR","Toggle all folds in the buffer")
    K.keymap('n',"<leader>Ff","zf%","Create a fold under the cursor")
    K.keymap('n',"<leader>Fd","zd","Delete a fold under the cursor")
    K.keymap('n',"<leader>FD","zD","Delete all folds under the cursor")
    
    -- Go to tag definitions
    K.keymap('n',"<C-\\>",function() vim.cmd("tag " .. vim.fn.expand("<cword>")) end, "go to tag definition")
    K.keymap('n',"gd",function() vim.cmd("tag " .. vim.fn.expand("<cword>")) end, "go to tag definition")
    K.keymap('n',"gD",function() vim.cmd("tselect " .. vim.fn.expand("<cword>")) end, "select tag definition")

    -- 
    K.keymap('n',"<leader>T", function() vim.treesitter.start() end, "start treesitter for current buffer")

    -- make
    K.keymap('n',"<C-n>","<CMD>cn<CR>","next error")
    K.keymap('n',"<C-p>","<CMD>cp<CR>","prev error")

    -- plugin keymaps ------------------
    -- Mini.nvim
    K.keymap('n','<leader>e',MiniFiles.open,"open mini files")
    K.keymap('n','<leader>D',MiniStarter.open,"open dashboard")

    K.keymap('n','<leader>ff',"<CMD>Pick files<CR>","pick files")
    K.keymap('n','<leader>fb',"<CMD>Pick buffers<CR>","pick buffers")
    K.keymap('n','<leader>fg',"<CMD>Pick grep_live<CR>", "grep cwd")
    K.keymap('n','<leader>fh',"<CMD>Pick help<CR>", "pick help tags")
    -- Markview
    K.keymap('n',"<leader>mo","<CMD>Markview open<CR>", "open path under cursor")
    K.keymap('n',"<leader>mt","<CMD>Markview toggle<CR>", "toggle markview")
    -- user keymaps --------------------
    K.keymap('n',"<leader>th","<CMD>split | terminal<CR> <CMD>resize -10<CR>a","open horizontal split terminal")
    K.keymap('n',"<leader>tv","<CMD>vsplit | terminal<CR> <CMD>resize -10<CR>a","open vertical split terminal")
    --- kj
    K.keymap('i',"kj","<ESC>","quick exit insert mode")
    -- obscure commands (double leader)
    K.keymap('n',"<leader><leader>s","<CMD>Rshl<CR>","Reset the search highlight")
    K.keymap('v',"<leader><leader>p","<ESC>a)<ESC>gvo<ESC>i(<ESC>", "enclosure selection in parenthesis")
    K.keymap('v',"<leader><leader>b","<ESC>a]<ESC>gvo<ESC>i[<ESC>", "enclosure selection in brackets")
    K.keymap('v',"<leader><leader>c","<ESC>a}<ESC>gvo<ESC>i{<ESC>", "enclosure selection in curly brackets")
    K.keymap('v',"<leader><leader>q","<ESC>a\"<ESC>gvo<ESC>i\"<ESC>", "enclosure selection in double quotes")
    K.keymap('v',"<leader><leader>Q","<ESC>a\'<ESC>gvo<ESC>i\'<ESC>", "enclosure selection in single quotes")
    K.keymap('v',"<leader><leader>a","<ESC>a><ESC>gvo<ESC>i<<ESC>", "enclosure selection in single quotes")
end

return K
