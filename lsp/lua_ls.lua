local lua_libs = {}
local lua_ls_addons = { "/love2d", "/lua-ls-cc-tweaked", "/luafilesystem" }
local lua_ls_addons_dir = vim.env.LUALS_ADDONS
if lua_ls_addons_dir then
    for i, addon in ipairs(lua_ls_addons) do
        lua_libs[i] = lua_ls_addons_dir .. addon

    end
end

return{
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = default_on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "love", "vim" },
                disable = { "lowercase-global" },
            },
            workspace = {
                library = lua_libs,
            }
        },
    },
}

