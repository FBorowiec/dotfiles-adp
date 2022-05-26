local M = {}

local enable = { enable = true }
local disable = { enable = false }
local pydocstyle_ignore = {
    'D100',
    'D101',
    'D102',
    'D103',
    'D104',
    'D105',
    'D106',
    'D107',
    'D205',
    'D400',
}


function M.setup()
    local util = require('lspconfig.util')
    require 'lspconfig'.pylsp.setup {
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_dir = function(fname)
            local root_files = {
                '.git',
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'Pipfile',
            }
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
        end,
        settings = {
            -- python = {
            --     analysis = {
            --         autoSearchPaths = true,
            --         diagnosticMode = "workspace",
            --         useLibraryCodeForTypes = true
            --     }
            -- },
            pylsp = {
                plugins = {
                    jedi_completion = {
                        fuzzy = true,
                        include_params = true,
                    },
                    flake8 = {
                        enabled = false,
                        hangClosing = false,
                        maxLineLength = 120,
                    },
                    pyls_flake8 = {
                        enabled = false,
                        hangClosing = false,
                        maxLineLength = 120,
                    },
                    pycodestyle = {
                        hangClosing = false,
                        maxLineLength = 120,
                    },
                    pydocstyle = {
                        enabled = true,
                        convention = 'numpy',
                        ignore = pydocstyle_ignore,
                        addIgnore = pydocstyle_ignore,
                    },
                    pylint = enable,
                    rope = disable,
                    pylsp_rope = disable,
                    pylsp_mypy = enable,
                    pyls_isort = enable,
                    autopep8 = disable,
                    black = enable,
                    python_lsp_black = enable,
                    pyls_black = enable,
                    pylsp_black = enable,
                }
            }
        }
    }
    require 'lspconfig'.bashls.setup {}
end

return M
