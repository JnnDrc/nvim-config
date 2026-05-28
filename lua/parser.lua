-- tree-sitter parsers helper

local M = {}

function M.add(name, reg)
    vim.treesitter.language.add(name, {path = vim.fs.joinpath(M.path,name .. M.os)})
    if reg then vim.treesitter.register(name,reg) end
    print("added: " .. vim.fs.joinpath(M.path, name .. M.os))
end


function M.load(opts)
    opt = opts or {
        path = vim.fn.stdpath("data") .. "/parser"
    }

    M.path = opt.path
    local sys = vim.loop.os_uname().sysname
    if sys == "Windows_NT" then
        M.os = ".dll"
    else    -- linux and BSD
        M.os = ".so"
    end

    local dir = vim.fs.dir(M.path)
    local parsers = {}

    for file, _ in dir do
        local i = #file
        while file:sub(i,i) ~= "." do i = i - 1 end
        local parser = file:sub(1,i-1)
        M.add(parser)

    end

end

usercmd.create("ParserAdd", function(name, path)
    vim.treesitter.language.add(name,{path = vim.fs.joinpath((path or M.path) .. M.os)})
end)

return M
