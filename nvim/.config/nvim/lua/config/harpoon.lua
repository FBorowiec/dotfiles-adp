local M = {}

function M.setup()
    require("harpoon").setup({
        menu = {
            width = 120,
            height = 40,
        }
    })
end

return M
