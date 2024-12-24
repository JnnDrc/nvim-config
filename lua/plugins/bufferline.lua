return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                themable = true,
                diagnostics = 'nvim_lsp',
                separator_style = "slope",
                custom_filter = function (nbuf)
                    if not vim.bo[nbuf].buflisted or vim.bo[nbuf].buftype == "nofile" then
                        return false
                    end
                    return true
                end
            }
        })
    end
}
