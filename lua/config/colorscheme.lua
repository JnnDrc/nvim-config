-------------------------------------------------
-- JayNvim colorscheme configuration!
-------------------------------------------------

--Default-colorscheme----------------------------
local default = "catppuccin-mocha" -- OBS: THIS HAVE NOTHING TO DO WITH 'default' OPTION OF NVIM, 'default' SET COLORSCHEME TO NVIM DEFAULT
-------------------------------------------------

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
vim.api.nvim_create_user_command("SetColors",function(opts)
  SetColorScheme(opts.args:match("([^ ]+)[ ]*(.*)"))
end,{nargs = '?'}) -- nvim command
vim.api.nvim_create_user_command("ChangeColors",function(opts)
  ChangeColorScheme(opts.args:match("([^ ]+)[ ]*(.*)"))
end,{nargs = '?'}) -- nvim command
-------------------------------------------------
