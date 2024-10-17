-------------------------------------------------
-- Usercommands configuration!
-------------------------------------------------

local function create_command(name,func,opts)
  vim.api.nvim_create_user_command(name,
      function(opts)
        func(opts.args:match("([^ ]+)[ ]*(.*)"))
      end,
      opts or {})
end

-------------------------------------------------
-- Functions
-------------------------------------------------

--re-set search highlight
local function _rshl()
    vim.cmd("let @/ = \"\"")
end

create_command("Rshl",_rshl)

local function _clear_reg(reg)
    vim.cmd(string.format("let @%s = ''",reg))
end

create_command("ClearRegister",_clear_reg,{nargs = 1})
