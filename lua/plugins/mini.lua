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
    end
}
