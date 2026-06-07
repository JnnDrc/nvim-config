-- custom buffer line in status line -------------------------------------------
function _G.BufferLine()
    local cur  = vim.api.nvim_get_current_buf()
    local max_wid = math.floor(vim.o.columns / 2)

    local bufs = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buflisted then table.insert(bufs,buf) end
    end

    if #bufs == 0 then return "" end

    local cur_i = 1
    for i, b in ipairs(bufs) do
        if b == cur then
            cur_i = i
            break
        end
    end
    
    local items = {}
    for i, buf in ipairs(bufs) do 
        local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf),":t")
        if name == "" then name = "[noname]" end
        if vim.bo[buf].modified then name = name .. '+' end
        items[i] = {
            buf = buf,
            text = name,
            len = #name + 2
        }
    end

    local left = cur_i
    local right = cur_i
    local total = items[cur_i].len

    while true do
        local added = false

        if right < #items then 
            local w = items[right+1].len
            if total + w <= max_wid then
                right = right + 1
                total = total + w
                added = true
            end
        end
        if left > 1 then
            local w = items[left-1].len
            if total + w <= max_wid then
                left = left - 1
                total = total + w
                added = true
            end
        end
        if not added then break end
    end

    local s = ""
    if left > 1 then s = s .. '… ' end

    for i = left, right do
        local item = items[i]
        if item.buf == cur then
            s = s .. "%#Visual# " .. item.text .. " %#Normal#"
        else
            s = s .. " " .. item.text .. " "
        end
    end

    if right < #items then s = s .. " …" end
    return s
end

local M = {}
function M.setup()
    vim.o.statusline = table.concat({
        "%{% v:lua.BufferLine() %} ",
        "%h%w%m%r ",
        "%=",
        "%y [%n] ",
        "%{% &showcmdloc == 'statusline' ? '%-10.S ' : '' %}",
        "%{% exists('b:keymap_name') ? '<'..b:keymap_name..'> ' : '' %}",
        "%{% &busy > 0 ? '◐ ' : '' %}",
        "%{% luaeval('(package.loaded[''vim.diagnostic''] and next(vim.diagnostic.count()) and vim.diagnostic.status() .. '' '') or '''' ') %}",
        "%{% &ruler ? ( &rulerformat == '' ? '%-14.(%l,%c%V%) %P' : &rulerformat ) : '' %}",
    },"")
end

return M
