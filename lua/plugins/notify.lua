return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        require("notify").setup()
        vim.notify = require("notify") -- set notifification system to notify.nvim
    end,
}
