local M = {}

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(clients)
            -- filter out clients that you don't want to use
            return vim.tbl_filter(function(client)
                return client.name ~= "clangd"
            end, clients)
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

function M.setup()
    require("null-ls").setup({
        sources = {
            -- python
            require("null-ls").builtins.formatting.black,
            require("null-ls").builtins.formatting.isort,
            -- bazel
            require("null-ls").builtins.diagnostics.buildifier,
            require("null-ls").builtins.formatting.buildifier.with({
                condition = function()
                    return vim.fn.executable("buildifier") > 0
                end,
            }),
            -- cpp
            require("null-ls").builtins.formatting.clang_format,
            require("null-ls").builtins.formatting.cmake_format,
            -- json
            require("null-ls").builtins.formatting.json_tool.with({
                condition = function()
                    return vim.fn.executable("python3") > 0
                end,
            }),
            require("null-ls").builtins.diagnostics.jsonlint.with({
                condition = function()
                    return vim.fn.executable("jsonlint") > 0
                end,
            }),
            require("null-ls").builtins.formatting.fixjson.with({
                condition = function()
                    return vim.fn.executable("fixjson") > 0
                end,
            }),
            -- markdown
            require("null-ls").builtins.diagnostics.mdl,
            -- sh
            require("null-ls").builtins.formatting.shfmt,
            -- lua
            require("null-ls").builtins.formatting.stylua,
            -- misc
            require("null-ls").builtins.formatting.trim_newlines,
            require("null-ls").builtins.formatting.trim_whitespace,
            -- yaml
            require("null-ls").builtins.diagnostics.yamllint.with({
                condition = function()
                    return vim.fn.executable("yamllint") > 0
                end,
            }),
            -- ansible-lint
            require("null-ls").builtins.diagnostics.ansiblelint.with({
                condition = function()
                    return vim.fn.executable("ansible-lint") > 0
                end,
            }),
        },
        on_attach = on_attach,
    })
end

return M
