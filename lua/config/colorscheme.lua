-------------------------------------------------
-- JayNvim colorscheme configuration!
-------------------------------------------------

--Default-colorscheme----------------------------
local default = "catppuccin" -- OBS: THIS HAVE NOTHING TO DO WITH 'default' OPTION OF NVIM, 'default' SET COLORSCHEME TO NVIM DEFAULT
-------------------------------------------------

--Change-colorscheme-helpers---------------------
function ChangeColorScheme(cs) -- function
  cs = cs or default
  vim.cmd.colorscheme(cs)
end
vim.api.nvim_create_user_command("Color",function(opts)
  ChangeColorScheme(opts.args:match("([^ ]+)[ ]*(.*)"))
end,{nargs = '?'}) -- nvim command
-------------------------------------------------
