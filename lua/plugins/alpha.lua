return {
    "goolord/alpha-nvim",
    dependencies = {"nvim-tree/nvim-web-devicons" },
    config = function ()
      local dashboard = require("alpha.themes.dashboard")
      --Header---------------------------------------------
      if true then
        dashboard.section.header.val = {
            " _   _         __     ___",
            "| \\ | | ___  __\\ \\   / (_)_ __ ___",
            "|  \\| |/ _ \\/ _ \\ \\ / /| | '_ ` _ \\",
            "| |\\  |  __/ (_) \\ V / | | | | | | |",
            "|_| \\_|\\___|\\___/ \\_/  |_|_| |_| |_|",
        }
      end
      --Buttons--------------------------------------------
      if true then
        dashboard.section.buttons.val = {
          dashboard.button("e","\u{F0214} :\t New file","<CMD>ene <BAR> startinsert <CR>"),
          dashboard.button("f","󰈞 :\t Find file","<CMD>Telescope find_files <CR>"),
          dashboard.button("g","\u{F1C2} :\t Find word","<CMD>Telescope live_grep<CR>"),
          dashboard.button("r"," :\t Recent files", ":Telescope oldfiles <CR>"),
          dashboard.button("c","\u{EB51} :\t Configurations","<CMD>cd $NVIM_CONFIG <CR>|<CMD>e init.lua <CR> "),
          dashboard.button("q", "\u{F0206} :\t Quit Neovim", ":qa<CR>"),
        }
      end
      --Footer---------------------------------------------
      if true then
        dashboard.section.footer.val = {
          "Life isn't a question, it doesn't need an answer...",
          "\t-Some korvax cartographer"
        }
      end

      require("alpha").setup(dashboard.config)
      vim.cmd([[
        autocmd Filetype alpha setlocal nofoldenable
      ]])
    end
}
-- old headers
          --"|\\  | /--- /---\\ \\    / | |\\  /|",
          --"| \\ | |--- |   |  \\  /  | | \\/ |",
          --"|  \\| \\--- \\---/   \\/   | |    |",
          --"--------------------------------",
