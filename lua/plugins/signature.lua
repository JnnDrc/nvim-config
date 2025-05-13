return {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function(_, opts)
        require("lsp_signature").setup({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        })
    end
}
