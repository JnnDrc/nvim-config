local fw = require("plugin.flowin")
-- opts ------------------------------------------------------------------------

local eval_to = "bottom"

-- code ------------------------------------------------------------------------

local ns = vim.api.nvim_create_namespace("scratch_eval")

local function fmt_res(res)
    if res == nil then
        return "nil"
    elseif type(res) == 'string' then
        return res
    else
        return vim.inspect(res,{newline = " ", indent = "" })
    end
end

-- scratch env -----------------------------------------------------------------

local _ENV = setmetatable({},{__index = _G})

_ENV.echo = function(...)
    local args = {...}
    local msg = ""
    for _,v in ipairs(args) do
        if #msg > 0 then msg = msg .. ' ' end
        msg = msg .. v
    end
    return print(msg) or msg
end

-- evaluation ------------------------------------------------------------------
local function eval_lua(code)
    local fn, err = load("return " .. code, "eval",'t',_ENV)
    if fn then
        return pcall(fn)
    end

    local lines = vim.split(code,"\n")
    while #lines > 0 and lines[#lines]:match("^%s*$") do
        table.remove(lines)
    end
    if #lines == 0 then return true, nil end

    local last = table.remove(lines)

    local wrapped = table.concat(lines,"\n") .. (#lines > 0 and "\n" or "" or "") .. "return " .. last

    fn, err = load(wrapped,"eval",'t',_ENV)
    if fn then
        return pcall(fn)
    end

    fn, err = load(code,"eval",'t',_ENV)
    if fn then
        return pcall(fn)
    end

    return false, err
end

local function eval_to_bot(buf,code)
    local ok,res = eval_lua(code)
    local lines = {}

    if ok then
        if res == nil then
            lines = {"-- => nil"}
        elseif type(res) == "string" then
            lines = vim.split(res, "\n")
            for i, _ in ipairs(lines) do
                lines[i] = "-- => " .. lines[i]
            end
        else
            lines = vim.split(vim.inspect(res),"\n")
            for i,_ in ipairs(lines) do
                lines[i] = "-- => " .. lines[i]
            end
        end
    else
        lines = {"-- ERROR: ", tostring(res)}
    end

    local lc = vim.api.nvim_buf_line_count(buf)
    vim.api.nvim_buf_set_lines(buf,lc,lc,false,lines)
end

local function eval_inline(buf,code,line)
    vim.api.nvim_buf_clear_namespace(buf, ns, line, line + 1)
    local ok,res = eval_lua(code)

    local text,hl
    if ok then
        text = " => " .. fmt_res(res)
        hl = "Comment"
    else
        text = " => ERROR: " .. tostring(res)
        hl = "DiagnosticError"
    end

    vim.api.nvim_buf_set_extmark(buf, ns, line, -1, {
        virt_text = {
            { text, hl }
        },
        virt_text_pos = "eol",
    })
end

-- commands
local _scratch = fw.window()

vim.api.nvim_create_user_command("Scratch",function (ctx)
    fw.toggle(_scratch,{
        size_factor = 0.5,
    }, function (win,buf)
        vim.bo[buf].buftype   = 'nofile'
        vim.bo[buf].bufhidden = 'hide'
        vim.bo[buf].swapfile  = false

        vim.bo[buf].filetype  = "lua"

        vim.bo[buf].expandtab = true

        vim.wo[win].number         = true
        vim.wo[win].relativenumber = true
        vim.wo[win].signcolumn     = 'yes'
    end)

end,{nargs = 0})

vim.api.nvim_create_user_command("Eval",function (ctx)
    local buf  = vim.api.nvim_get_current_buf()
    local code
    local line
    if vim.bo[buf].buftype == 'nofile' then
        if ctx.range == 2 then
            local lines = vim.api.nvim_buf_get_lines(buf,ctx.line1 - 1,ctx.line2,false)
            code = table.concat(lines,"\n")
            line = ctx.line2 - 1
        else
            code = vim.api.nvim_get_current_line()
            line = vim.api.nvim_win_get_cursor(0)[1] - 1
        end

        if eval_to == "inline" then
            eval_inline(buf,code,line)
        elseif eval_to == "bottom" then
            eval_to_bot(buf,code)
        else
            error("invalid 'eval_to' option: " .. eval_to, 2)
        end
    else
        print("not in scratch file")
    end
end,{range = true})

vim.keymap.set('n','<C-e>',":Eval<CR>",{silent = true})
vim.keymap.set('v','<C-e>',":'<,'>Eval<CR>",{silent = true})
vim.keymap.set('n','<C-s>',":Scratch<CR>",{silent = true})
