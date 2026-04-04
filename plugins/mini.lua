return {
    "https://github.com/nvim-mini/mini.nvim",
    config = function()
        require("mini.pairs").setup({ modes = {command = true}})
        require("mini.move").setup()
        require("mini.comment").setup()
        require("mini.splitjoin").setup()
        require("mini.surround").setup()
        require("mini.cursorword").setup()
        require("mini.files").setup()
        require("mini.icons").setup()

        require("mini.pick").setup()

        local hlp = require("mini.hipatterns")

        -- local snip = require("mini.snippets").setup()
        -- local comp = require("mini.completion").setup()

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

        local clue = require('mini.clue')
        clue.setup({
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
                clue.gen_clues.builtin_completion(),
                clue.gen_clues.g(),
                clue.gen_clues.marks(),
                clue.gen_clues.registers({ show_contents = true}),
                clue.gen_clues.windows(),
                clue.gen_clues.z(),
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

        local header = {
              " _   _         __     ___",
              "| \\ | | ___  __\\ \\   / (_)_ __ ___",
              "|  \\| |/ _ \\/ _ \\ \\ / /| | '_ ` _ \\",
              "| |\\  |  __/ (_) \\ V / | | | | | | |",
              "|_| \\_|\\___|\\___/ \\_/  |_|_| |_| |_|",
          }
        local nvv = string.format("%s.%s.%s",vim.version().major,vim.version().minor,vim.version().patch)
        table.insert(header,string.rep("-",#header[#header]-#nvv)..nvv)
        local footer = {
                "Life isn't a question",
                "\tit doesn't need an answer...",
                " -Some korvax cartographer",
        }

        local starter = require("mini.starter")
        starter.setup({
            autoopen = true,
            evaluate_single = true,
            items = {
                {name = "new", action = "ene ", section = "nvim"},
                {name = "config", action = "lua vim.cmd(\"cd \" .. vim.fn.stdpath(\"config\") ..\" | e init.lua\")", section = "nvim"},
                {name = "quit", action = "wqa", section = "nvim"},
                starter.sections.recent_files(5,true,false),
                -- starter.sections.recent_files(5,false,false),
                -- starter.sections.sessions(5,true), no sessions
            },
            header = table.concat(header,'\n'),
            footer = table.concat(footer,'\n'),
            content_hooks = {
                starter.gen_hook.adding_bullet("~ "),
                starter.gen_hook.aligning("center", "center"),
            },
            query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
            silent = true,
        })

    end
}
