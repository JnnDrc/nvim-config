return {
    "goolord/alpha-nvim",
    config = function ()
      local dashboard = require("alpha.themes.dashboard")
      -- to quickly select saved dashboards
      local dashboards = {
          {
              "|\\  | |--- /---\\ \\    / | |\\  /|",
              "| \\ | |--- |   |  \\  /  | | \\/ |",
              "|  \\| |___ \\---/   \\/   | |    |",
          },
          {
              " _   _         __     ___",
              "| \\ | | ___  __\\ \\   / (_)_ __ ___",
              "|  \\| |/ _ \\/ _ \\ \\ / /| | '_ ` _ \\",
              "| |\\  |  __/ (_) \\ V / | | | | | | |",
              "|_| \\_|\\___|\\___/ \\_/  |_|_| |_| |_|",
          },
          {
            "neoneo     neo neoneoneoneo    neoneo    vim          vim vim vim",
            "neo neo    neo neo           neo    neo   vim        vim      vimvimvimvimvim",
            "neo  neo   neo neoneoneoneo neo      neo   vim      vim   vim vim   vim    vim",
            "neo   neo  neo neoneoneoneo neo      neo    vim    vim    vim vim   vim    vim",
            "neo    neo neo neo           neo    neo      vim  vim     vim vim   vim    vim",
            "neo     neoneo neoneoneoneo    neoneo         vimvim      vim vim   vim    vim",
          }
      }
    --Header---------------------------------------------
    if true then
        dashboard.section.header.val = dashboards[2]
        local nvv = string.format("%s.%s.%s",vim.version().major,vim.version().minor,vim.version().patch)
        table.insert(dashboard.section.header.val,string.rep("-",#dashboard.section.header.val[#dashboard.section.header.val]-#nvv)..nvv)
      end
    --Buttons--------------------------------------------
    if true then
        dashboard.section.buttons.val = {
            dashboard.button("e", "\u{F0214} :\t New file", "<CMD>ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰈞 :\t Find file", "<CMD>Telescope find_files <CR>"),
            dashboard.button("g", "\u{F1C2} :\t Find word", "<CMD>Telescope live_grep<CR>"),
            dashboard.button("r", " :\t Recent files", "<CMD>Telescope oldfiles <CR>"),
            dashboard.button("c", "\u{EB51} :\t Configurations", "<CMD>cd $NVIM_CONFIG <CR>|<CMD>e init.lua <CR>"),
            dashboard.button("q", "\u{F0206} :\t Quit Neovim", "<CMD>qa<CR>"),
        }
    end
    --Footer---------------------------------------------
    if true then
        dashboard.section.footer.val = {
            "Life isn't a question, it doesn't need an answer...",
            "\t-Some korvax cartographer",
        }
    end

    require("alpha").setup(dashboard.config)
        vim.cmd([[
            autocmd Filetype alpha setlocal nofoldenable
        ]])
    end
}
