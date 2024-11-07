------------------------------------------------
-- Colorscheme configuration!
-------------------------------------------------

--Default-colorscheme----------------------------
local default = "catppuccin-mocha" -- OBS: THIS HAVE NOTHING TO DO WITH 'default' OPTION OF NVIM, 'default' SET COLORSCHEME TO NVIM DEFAULT
-------------------------------------------------
local installed_themes = vim.fn.getcompletion("","color")


--Change-colorscheme-helpers---------------------

-- This function opens a selection screen for the themes on installed_themes table
local function SelectColorScheme()
  vim.ui.select(installed_themes,{
    prompt = "Choose theme:",
    format_item = function (theme)
      return "> " .. theme
    end,
  }, function(choice)
        if choice then
        ChangeColorScheme(choice)
      end
  end)
end
-- This function changes the colorscheme to cs and save it to the next sections
--- @param cs string | nil
function ChangeColorScheme(cs)
  cs = cs or default
  local f = io.open(vim.fn.stdpath("config") .. "/lua/config/current-theme.lua","w")
  if(f == nil) then
    vim.notify("Failed to open current-theme.lua")
    return
  end
  f:write(string.format("return \"%s\"",cs))
  f:close()
  vim.cmd.colorscheme(cs)
end
-- This function change the colorscheme
--- @param cs string | nil
function SetColorScheme(cs)
  cs = cs or default
  vim.cmd.colorscheme(cs)
end
--UserCommands-----------------------------------
vim.api.nvim_create_user_command("SetColors",function(opts)
  SetColorScheme(opts.args:match("([^ ]+)[ ]*(.*)"))
end,{nargs = '?'}) -- nvim command
vim.api.nvim_create_user_command("ChangeColors",function(opts)
  ChangeColorScheme(opts.args:match("([^ ]+)[ ]*(.*)"))
end,{nargs = '?'}) -- nvim command

vim.api.nvim_create_user_command("SelectColors",SelectColorScheme,{nargs = 0})
-------------------------------------------------
