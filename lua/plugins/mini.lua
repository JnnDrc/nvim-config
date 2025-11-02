return{
    'nvim-mini/mini.nvim',
    version = false,
    config = function ()
        require("mini.pairs").setup()
        require("mini.move").setup()
        require("mini.comment").setup()
        require("mini.splitjoin").setup()
        require("mini.surround").setup()

        require("mini.files").setup()
        require("mini.notify").setup()

        require("mini.statusline").setup()
        require("mini.tabline").setup()
        require("mini.icons").setup()
        require("mini.cursorword").setup()
        local hlp = require("mini.hipatterns")
        hlp.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = {'%f[%w]()FIXME()%f[%W]', '%f[%w]()BUG()%f[%W]'}, group = 'MiniHipatternsFixme' },
                hack  = { pattern = {'%f[%w]()HACK()%f[%W]', '%f[%w]()WARN()%f[%W]'}, group = 'MiniHipatternsHack'  },
                todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hlp.gen_highlighter.hex_color(),
          },
        })

        local miniclue = require('mini.clue')
        miniclue.setup({
            window = {
                delay = 0,
            },
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },
            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers({ show_contents = true}),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
                {mode = 'n', keys = "<leader>", desc = "Leader"},
                {mode = 'n', keys = "<leader><leader>", desc = "Misc"},
                {mode = 'n', keys = "<leader>f", desc = "Find"},
                {mode = 'n', keys = "<leader>F", desc = "Fold"},
                {mode = 'n', keys = "<leader>m", desc = "Markview"},
                {mode = 'n', keys = "<leader>g", desc = "Git"},
                {mode = 'n', keys = "<leader>l", desc = "LSP"},
                {mode = 'n', keys = "<leader>t", desc = "Terminal"},
                {mode = 'n', keys = "<leader>w", desc = "Window"},
                {mode = 'n', keys = "<leader>p", desc = "Plugins"},
                {mode = 'n', keys = "<leader>r", desc = "Source config"},

            },
        })
    end
}
