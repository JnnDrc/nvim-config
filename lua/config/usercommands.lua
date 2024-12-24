-------------------------------------------------
-- Usercommands configuration!
-------------------------------------------------

---create a user command
---@param name string
---@param func function
---@param oopts? table
local function create_command(name,func,oopts)
  vim.api.nvim_create_user_command(name,
      function(o)
        func(o.args:match("([^ ]+)[ ]*(.*)"))
      end,
      oopts or {})
end

-------------------------------------------------
-- Functions
-------------------------------------------------

local function _throw_quit()
    vim.cmd("q!")
end
create_command("Q",_throw_quit)
-- re-set search highlight
local function _rshl()
    vim.cmd("let @/ = \"\"")
end
create_command("Rshl",_rshl)
-- clear register
local function _clear_reg(reg)
    vim.cmd("let @" .. reg .. " = ''")
    vim.notify("Cleared register ".. reg,"info",{title = "Clear register"})
end
create_command("ClearRegister",_clear_reg,{nargs = 1})
-- set treesitter
local function _ts(parser)
    require('nvim-treesitter.highlight').attach(0, parser)
end
create_command("TSParser",_ts,{nargs = 1})
-- bunny
local function _bunny()
    vim.notify("(\\(\\\n( -.-)\no_(\")(\")"  )
end
create_command("Bun",_bunny)

local function _Buf()
    print("nbuf: "..tostring(vim.api.nvim_get_current_buf()))
end
create_command("Buf",_Buf)
