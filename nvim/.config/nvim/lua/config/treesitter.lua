local M = {}

function M.setup()
    require "nvim-treesitter.configs".setup {
        ensure_installed = { "c", "cpp", "lua", "python" },
        highlight = { enable = true },
    }
end

return M
