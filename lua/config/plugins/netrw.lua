-------------------------------------------------
-- NetRW config!
-------------------------------------------------
local g = vim.g

g.netrw_banner = 1                              -- Netrw banner on top                                                        
g.netrw_altv = 1                                -- Create the split of the Netrw window to the left                           
g.netrw_browse_split = 4                        -- Open files in previous window. This emulates the typical "drawer" behavior 
g.netrw_liststyle = 4                           -- Set the styling of the file list to be one column with files inside
g.netrw_winsize = 14                            -- Set the width of the "drawer"
g.netrw_list_hide = '^\\./\\?$'                 -- hide ./
-- g.netrw_list_hide = '^\\./\\?$,^\\.\\./\\?$'    -- hide ./ and ../
