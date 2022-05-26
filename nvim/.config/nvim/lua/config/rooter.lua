local M = {}

function M.setup()
    vim.g.rooter_patterns = { '.git', '.git/', 'Makefile', 'WORKSPACE' }
end

return M
