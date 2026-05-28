local fw = require("plugin.flowin")

local NB = {}

function NB.setup(_opt)
    local opt = _opt or {
        path = vim.fn.stdpath("data") .. "/nb/"
    }

    NB.window  = fw.window()
    NB.path = opt.path

    vim.api.nvim_create_user_command("Note",function (ctx)
        fw.toggle(NB.window,{
            size_factor = 0.5,
        }, function (win,buf)
            vim.bo[buf].buftype   = 'nofile'
            vim.bo[buf].bufhidden = 'hide'
            vim.bo[buf].swapfile  = false

            vim.bo[buf].expandtab = true

            vim.wo[win].number         = true
            vim.wo[win].relativenumber = true
            vim.wo[win].signcolumn     = 'yes'
        end)

    end,{nargs = 0})

end

return NB
