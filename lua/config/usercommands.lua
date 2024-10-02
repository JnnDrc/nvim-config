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

