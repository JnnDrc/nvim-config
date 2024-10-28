-------------------------------------------------
-- Usercommands configuration!
-------------------------------------------------

local function create_command(name,func,opts)
  vim.api.nvim_create_user_command(name,
      function(o)
        func(o.args:match("([^ ]+)[ ]*(.*)"))
      end,
      opts or {})
end

-------------------------------------------------
-- Functions
-------------------------------------------------

-- re-set search highlight
local function _rshl()
    vim.cmd("let @/ = \"\"")
end
create_command("Rshl",_rshl)
-- clear register
local function _clear_reg(reg)
    vim.cmd(string.format("let @%s = ''",reg))
    vim.notify("Cleared register ".. reg,"info",{title = "Clear register"})
end
create_command("ClearRegister",_clear_reg,{nargs = 1})
-- bunny
local function _bunny()
    vim.notify("(\\(\\\n( -.-)\no_(\")(\")"  )
end
create_command("Bun",_bunny)
