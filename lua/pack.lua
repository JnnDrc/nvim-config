-- plugin manager --------------------------------------------------------------
local P = {}

function P.add(spec)
    vim.pack.add({spec[1]})
    if type(spec.deps) == "table" then
        for _, dep in ipairs(spec.deps) do
            P.add(dep)
        end
    end
    if spec.config then spec.config() end
end

function P.del(name_or_list)
    if type(name_or_list) == "string" then
        vim.pack.del({name_or_list})
    else
        vim.pack.del(name_or_list)
    end
end

function P.update(arg)
    vim.pack.update(arg)
end

function P.load(path)
    local dir = path or vim.fn.stdpath("config") .. "/plugins/?.lua"
    package.path = package.path .. ";" .. dir

    local plugs = vim.fs.dir(vim.fn.stdpath("config") .. "/plugins")
    local plugins = {}

    for file, _ in plugs do
        local i = #file
        while file:sub(i,i) ~= "." do i = i - 1 end
        local plug = file:sub(1,i-1)
        local spec = require(plug)
        if type (spec[1]) ~= "string" then
            for _, s in ipairs(spec) do
                plugins[#plugins + 1] = s
            end
        else
            plugins[#plugins + 1] = spec
        end
    end

    for _, spec in ipairs(plugins) do
        if spec.lazy then vim.schedule(function() P.add(spec) end)
        else P.add(spec)
        end
    end

end

usrcmd.create("PackUpdate", P.update)
usrcmd.create("PackDelete",function(...) 
    local plugs = {...}
    for i = 1, #plugs do
        local plug = plugs[i]
        if plug:sub(1,1) == '\"' then
            plugs[i] = plug:sub(2,#plug-1)
        end
    end
    P.del(plugs)
end,{nargs = "+"})

return P
