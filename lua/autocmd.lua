-- autocmd.lua -----------------------------------------------------------------

local A = {}

function A.create(event, opts)
    return vim.api.nvim_create_autocmd(event, opts)
end

function A.load()
    A.create("FileType",{
        callback = function(args)
            local ft = vim.bo[args.buf].filetype
            if ft and pcall(vim.treesitter.language.inspect,ft) then
                vim.treesitter.start(args.buf,ft)
            end
        end
    })
end


return A
