-------------------------------------------------
-- JayNvim colorscheme configuration!
-------------------------------------------------

--Default-colorscheme----------------------------
local default = "catppuccin-mocha" -- OBS: THIS HAVE NOTHING TO DO WITH 'default' OPTION OF NVIM, 'default' SET COLORSCHEME TO NVIM DEFAULT
-------------------------------------------------
local installed_themes = {
  "catppuccin-mocha",
  "catppuccin-macchiato",
  "catppuccin-frappe",
  "catppuccin-latte",
  "gruvbox",
  "monokai-pro-default",
  "monokai-pro-classic",
  "monokai-pro-octagon",
  "monokai-pro-machine",
  "monokai-pro-ristretto",
  "monokai-pro-spectrum",
} -- THIS IS MANUAL


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

--Change-colorscheme-helpers---------------------
function ChangeColorScheme(cs)
  cs = cs or default
  local f = io.open("lua/config/current-theme.lua","w")
  if(f == nil) then
    return
  end
  f:write(string.format("return \"%s\"",cs))
  f:close()
  vim.cmd.colorscheme(cs)
end
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

vim.api.nvim_create_user_command("SelectColors",SelectColorScheme,{nargs = '?'})
-------------------------------------------------
