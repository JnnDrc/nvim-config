cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

function default_on_attach()
    vim.keymap.set("n", "<leader>A", vim.lsp.buf.code_action, { desc = "code action" })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "see diagnostics" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "rename symbol" })
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.hover, { desc = "documentation" })
    vim.keymap.set("n", "<leader>lD", vim.lsp.buf.definition, { desc = "go to definition" })
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "signature help" })
    vim.keymap.set("n", "<leader>lS", vim.lsp.buf.document_symbol, { desc = "document symbols" })
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "format current buffer" })
    vim.keymap.set("n", "<leader>li", "<CMD>LspInfo<CR>", { desc = "shows lsp info" })
end

function exe_path(exe)
    local path = vim.fn.exepath(exe)
    if path == "" then
        vim.notify("Can't find " .. exe .. " executable")
        return nil
    end
    return path
end

local lsps = {
    "lua_ls",
    "clangd",
    "fortls",
    "gopls",
    "zls",
}

for i = 1, #lsps do
    vim.lsp.enable(lsps[i])
end
