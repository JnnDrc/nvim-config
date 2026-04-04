-- usercommands ----------------------------------------------------------------

local U = {}

---create a user command
---@param name string           // user command name
---@param func function | nil   // function
---@param oopts? table          // optional options
---@param ofunc? function       // optional function
function U.create(name,func,oopts, ofunc)
    local f = ofunc or function (ctx)
        if func then
            func(ctx.args:match("([^ ]+)[ ]*(.*)"))
        end
    end
    vim.api.nvim_create_user_command(name,f, oopts or {})
end

----------------------------------------
-- Functions ---------------------------
----------------------------------------

-- clear register
local function _clear_reg(reg)
    vim.cmd("let @" .. reg .. " = ''")
    vim.notify("Cleared register ".. reg,vim.log.levels.INFO,{title = "Clear register"})
end
-- set treesitter
local function _ts(parser)
    require('nvim-treesitter.highlight').attach(0, parser)
end
-- bunny
local function _bunny()
    vim.notify("\n(\\(\\\n( -.-)\no_(\")(\")"  )
end

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
        vim.notify(string.format('Failed to dump, exit code %d',vim.v.shell_error),vim.log.levels.ERROR,{title = "xxd dump"})
    else
        vim.notify('Dump created: ' .. dump,vim.log.levels.INFO,{title = "xxd dump"})
    end
end

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
        vim.notify(string.format('Failed to make binary, exit code %d',vim.v.shell_error),vim.log.levels.ERROR,{title = "xxd undump"})
    else
        vim.notify('Undumped: ' .. bin,vim.log.levels.INFO,{title = "xxd undump"})
    end
end

local function _Redir(ctx)
    local lines = vim.split(vim.api.nvim_exec(ctx.args, true),'\n',{plain = true})
    vim.cmd 'new'
    vim.api.nvim_buf_set_lines(0,0,-1,false,lines)
    vim.opt_local.modified = false
end

local function _Makeprg(...)
    local prg = {...}
    for i = 2, #prg,2 do table.insert(prg,i," ") end
    vim.opt.makeprg = table.concat(prg)
end

local function _Git(...)
    local args = {...}
    for i = 2, #args, 2 do table.insert(args,i," ") end
    vim.cmd("!git " .. table.concat(args))
end
----------------------------------------
-- Commands ----------------------------
----------------------------------------

function U.load()
    -- force quit
    U.create("Q",function () vim.cmd("q!") end)
    -- re-set search highlight
    U.create("Rshl",function () vim.cmd("let @/ = \"\"") end)
    -- clear register
    U.create("ClearRegister",_clear_reg,{nargs = 1})
    -- set tree-sitter parser for current file
    U.create("TSParser",_ts,{nargs = 1})
    -- bunny
    U.create("Bun",_bunny)
    -- print current buf nbuf
    U.create("Buf",function () print("nbuf: "..tostring(vim.api.nvim_get_current_buf())) end)
    -- dump current file
    U.create("Dump",_XXD,{desc = "Hexdump current file"})
    -- undump current file
    U.create("Undump",_XXDR,{desc = "Undump the current file(must be an xxd hexdump)"})
    -- redirect output to new buffer
    U.create("Redir",nil, {nargs = '+', complete = 'command'},_Redir)
    -- set makeprg
    U.create("Makeprg",_Makeprg, {nargs = '+'})
    U.create("MakeGCC",function() _Makeprg("gcc") end)
    -- git
    U.create("Git",_Git,{nargs = "*"})
end

return U
