--flowin.nvim----------------------------------------------
-- My super duper simple floating window plugin (actually used just by myself)
-----------------------------------------------------------

local M = {}

---@class winbuf
---@field win integer | nil window id
---@field buf integer | nil buffer id

---@class wopts
---@field width number window width
---@field height number window height
---@field size_factor number factor for window size if width and height are not provided (nil), expected between 0.0 and 1.0
---@field win_config vim.api.keyset.win_config window config

-- Creates a (invalid) window
---@return winbuf
function M.window()
    return {win = nil, buf = nil}
end

---@param win integer | nil window id
---@return boolean
function M.win_is_valid(win)
    if win and vim.api.nvim_win_is_valid(win) then return true else return false end
end
---@param buf integer | nil buffer id
---@return boolean
function M.buf_is_valid(buf)
    if buf and vim.api.nvim_buf_is_valid(buf) then return true else return false end
end

---Open a window for the desired buffer
---If a buffers isn't passed or valid, a new buffer will be created
---@param obuf? integer optional initial buffer
---@param oopts? wopts  optional options
---@return winbuf
function M.open(obuf, oopts)
    oopts = oopts or {}

    -- calculate size and position of window
    local sf = oopts.size_factor or 0.8

    local w = oopts.width or math.floor(vim.o.columns * sf)
    local h = oopts.height or math.floor(vim.o.lines * sf)

    local col = math.floor((vim.o.columns - w)/2)
    local row = math.floor((vim.o.lines - h)/2)

    -- use passed buffer or create a new (scratch) one
    local buf = nil
    if M.buf_is_valid(obuf) then
        buf = obuf
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
    local win = nil
    if buf then
        win = vim.api.nvim_open_win(buf,true,winconf)
    end

    return {buf = buf, win = win}
end

---Closes the window and destroys the buffer
---@param win winbuf
---@param oforce? boolean optional forced close (defaults to false)
function M.close(win, oforce)
    if M.win_is_valid(win.win) then
        vim.api.nvim_win_close(win.win,oforce or false)
        win.win = nil
        win.buf = nil
    end
end

--- Toggle an existing window
--- It preserves the buffer for future calls
--- If a winbuf with invalid buf is passed, it will create a new buffer
--- Can execute hook funcstions before the close and after the open
---@param win winbuf
---@param oopts? wopts
---@param on_open? function (win,buf)
---@param on_close? function (win,buf)
function M.toggle(win, oopts, on_open,on_close)
    if M.win_is_valid(win.win) then
        if on_close then
            on_close(win.win,win.buf)
        end
        local b = win.buf
        M.close(win)
        win.buf = b
    else
        local r = M.open(win.buf, oopts)
        win.win = r.win
        win.buf = r.buf
        if on_open then
            on_open(win.win,win.buf)
        end
    end
end

return M
