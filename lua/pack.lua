-- plugin manager --------------------------------------------------------------

-- helpers

local function run_build(build)
    local t = type(build)

    if t == "function" then build() 
    elseif t == "string" then
        if spec.build:sub(1,1) == ':' then
            vim.cmd(spec.build:sub(2))
        else
            vim.system(vim.split(spec.build," "), {text = true}):wait()
        end
    elseif t == "table" then
        for _, b in ipairs(build) do
            run_build(b)
        end
    end
end

-- api

local P = {
    plugins_loaded = 0,
    specs = {}
}

-- PackSpec
-- [1]  = source path   (string)
-- lazy = lazy loading  (bool)
-- deps = dependencies  ({PackSpec})
-- build = install/update command (string)

function P.add(spec)
    vim.pack.add({spec[1]})

    if type(spec.deps) == "table" then
        for _, dep in ipairs(spec.deps) do
            P.add(dep)
        end
    end

    if spec.config then spec.config() end

    P.plugins_loaded = P.plugins_loaded + 1
end

function P.del(name_or_list)
    if type(name_or_list) == "string" then
        vim.pack.del({name_or_list})
    else
        vim.pack.del(name_or_list)
    end
end

function P.update(arg)
    local updated = vim.pack.update(arg)
    if updated then
        for name, spec in pairs(P.specs) do
            if updated[name] and spec.build then
                run_build(spec.build)
            end
        end
    end
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
        P.specs[spec[1]] = spec
        if spec.lazy then vim.schedule(function() P.add(spec) end)
        else P.add(spec)
        end
    end

end

usercmd.create("PackUpdate", P.update)
usercmd.create("PackDelete",function(...)
    local args = {...}
    local plugs = {}
    for _, plug in ipairs(args) do
        if plug:sub(1,1) == '\"' then
            plugs[#plugs+1] = plug:sub(2,#plug-1)
        else
            plugs[#plugs+1] = plug
        end
    end
    P.del(plugs)
end,{nargs = "+"})

return P
