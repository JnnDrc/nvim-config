-------------------------------------------------
-- Usercommands configuration!
-------------------------------------------------

---create a user command
---@param name string
---@param func function
---@param oopts? table
local function create_command(name,func,oopts)
  vim.api.nvim_create_user_command(name,
      function(o)
        func(o.args:match("([^ ]+)[ ]*(.*)"))
      end,
      oopts or {})
end

-------------------------------------------------
-- Functions
-------------------------------------------------

-- force quit
create_command("Q",function () vim.cmd("q!") end)
-- re-set search highlight
create_command("Rshl",function () vim.cmd("let @/ = \"\"") end)
-- clear register
local function _clear_reg(reg)
    vim.cmd("let @" .. reg .. " = ''")
    vim.notify("Cleared register ".. reg,vim.log.levels.INFO,{title = "Clear register"})
end
create_command("ClearRegister",_clear_reg,{nargs = 1})
-- set treesitter
local function _ts(parser)
    require('nvim-treesitter.highlight').attach(0, parser)
end
create_command("TSParser",_ts,{nargs = 1})
-- bunny
local function _bunny()
    vim.notify("(\\(\\\n( -.-)\no_(\")(\")"  )
end
create_command("Bun",_bunny)
-- print current buffer nbuf
create_command("Buf",function () print("nbuf: "..tostring(vim.api.nvim_get_current_buf())) end)

local function _XXD()
    local xxd = vim.fn.exepath("xxd")
    if not xxd then
        vim.notify("xxd not found",vim.log.levels.ERROR,{title = "xxd dump"})
    end

    local buf = vim.fn.expand("%:p")
    local dump = vim.fn.fnamemodify(buf,":r") .. ".dump"
    local cmd = string.format("silent !xxd %s %s",buf,dump)

    vim.cmd(cmd)
    vim.cmd('redraw')

    if vim.v.shell_error ~= 0 then
        vim.notify('Failed to dump',vim.log.levels.ERROR,{title = "xxd dump"})
    else
        vim.notify('Dump created: ' .. dump,vim.log.levels.INFO,{title = "xxd dump"})
    end
end
create_command("Dump",_XXD,{desc = "Hexdump current file"})
local function _XXDR()
    local xxd = vim.fn.exepath("xxd")
    if not xxd then
        vim.notify("xxd not found",vim.log.levels.ERROR,{title = "xxd undump"})
    end

    local buf = vim.fn.expand("%:p")
    local bin = vim.fn.fnamemodify(buf,":r") .. ".bin"
    local cmd = string.format("silent !xxd -r %s %s",buf,bin)

    vim.cmd(cmd)
    vim.cmd('redraw')

    if vim.v.shell_error ~= 0 then
        vim.notify('Failed to make binary',vim.log.levels.ERROR,{title = "xxd undump"})
    else
        vim.notify('Undumped: ' .. bin,vim.log.levels.INFO,{title = "xxd undump"})
    end
end
create_command("Undump",_XXDR,{desc = "Undump the current file(must be an xxd hexdump)"})
