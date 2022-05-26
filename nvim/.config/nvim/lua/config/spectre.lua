local M = {}

function M.setup()
    require('spectre').setup({
        color_devicons = true,
        mapping = {
            ['send_to_qf'] = {
                map = "<leader><space>q",
                cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                desc = "send all item to quickfix"
            }
        },
        default = {
            find = {
                cmd = "rg",
                options = { "ignore-case", "hidden" }
            },
        },
        is_open_target_win = true, -- open file on opener window
        is_insert_mode = true -- start open panel on is_insert_mode
    })
end

return M
