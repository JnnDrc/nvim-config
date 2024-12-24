--flowin.nvim----------------------------------------------
-- My super duper simple floating window plugin (actually used just by myself)
-----------------------------------------------------------

local M = {}

---@param oopts? table
function M.create_window(oopts)
    oopts = oopts or {}

    -- calculate size and position of window
    local w = oopts.width or math.floor(vim.o.columns * 0.8)
    local h = oopts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - w)/2)
    local row = math.floor((vim.o.lines - h)/2)

    -- use passed buffer or create a new (scratch) one
    local buf = nil
    if vim.api.nvim_buf_is_valid(oopts.buf) then
        buf = oopts.buf
    else
        buf = vim.api.nvim_create_buf(false,true)
    end

    -- define window conf
    local winconf = oopts.win_config or {
        relative = "editor",
        width = w,
        height = h,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf,true,winconf)

    return {buf = buf, win = win}
end


return M
