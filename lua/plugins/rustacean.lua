return {
  { --rustaceanvim
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ["rust-analyzer"] = {
      cargo = {
        allfeatures= true,
      },
    },
    config = function ()
              vim.keymap.set('n',"<leader>A",vim.lsp.buf.code_action,{desc = "code action"})
              vim.keymap.set('n',"<leader>d",vim.diagnostic.open_float,{desc = "see diagnostics"})
              vim.keymap.set('n',"<leader>ld",vim.lsp.buf.hover,{desc = "documentation"})
              vim.keymap.set('n',"<leader>lD",vim.lsp.buf.definition,{desc = "go to definition"})
              vim.keymap.set('n',"<leader>lr",vim.lsp.buf.rename,{ desc = "rename symbol"})
              vim.keymap.set('n',"<leader>ls",vim.lsp.buf.document_symbol,{desc = "document symbols"})
              vim.keymap.set('n',"<leader>lf",vim.lsp.buf.format,{desc = "format current buffer"})
              vim.keymap.set('n',"<leader>li","<CMD>LspInfo<CR>",{desc = "shows lsp info"})
    end
  },
  {--crates
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
        require('crates').setup()
    end,
  }
}
