-------------------------------------------------
-- JayNvim usercommands configuration!
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

local function _rshl()
  vim.cmd("let @/ = \"\"")
end

create_command("Rshl",_rshl)
