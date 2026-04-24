-- colors.lua ------------------------------------------------------------------

local C = {}

function C.save(file)
    local cs = vim.g.colors_name or "default"
    file = file or "colorscheme.lua"
    local f = io.open(vim.fn.stdpath("data") .. "/" .. file, "w")
    if (f == nil) then
        vim.notify("Failed to open data/colorscheme.lua")
        return
    end
    f:write(string.format("return \"%s\"", cs))
    f:close()
    vim.cmd.colorscheme(cs)
end

function C.get(file)
    return require(file or "colorscheme")
end

function C.load(file)
    vim.cmd.colorscheme(C.get(file) or "default")
end

require("usercmd").create("SaveColorscheme",function() C.save() end,{nargs = 0})

return C
