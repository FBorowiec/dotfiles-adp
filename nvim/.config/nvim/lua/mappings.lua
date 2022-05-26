-- GENERAL ---------------------------------------------------------------------
local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables
map('', 'Q', '', {}) -- disable 'Q'

local options = { noremap = true }

-- Better indenting
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- alias for 'escape' to NORMAL from INSERT
map('i', 'jk', '<Esc>', options)
map('i', 'jj', '<Esc>', options)

-- Move selected line / block of text in visual mode
-- shift + k to move up
map('x', 'K', ':move \'<-2<cr>gv-gv', options)
-- shift + j to move down
map('x', 'J', ':move \'>+1<cr>gv-gv', options)

-- move lines using 'Alt', vscode-like
map('n', '<M-Up>', ':move -2<cr>', options)
map('n', '<M-Down>', ':move +1<cr>', options)

-- Faster writing / quitting
map('n', '<leader>w', ':w<cr>', options)
map('n', '<leader>q', ':q<cr>', options)
map('n', '<leader>Q', ':q!<cr>', options)

-- toggle nohighlight
map('n', '<leader>nh', ':nohlsearch<cr>', options)

-- Make Y behave like other capital letters (C, D)
map('n', 'Y', 'y$', options)

-- deletes visual selection and pastes without changing default register
map('v', 'p', '"_dP', options)

-- go to first file on line
map('n', 'gf', '^f/gf', options)

-- Keeping it centered while iterating through results with n
map('n', 'n', 'nzzzv', options)
map('n', 'N', 'Nzzzv', options)
map('n', 'J', 'mzJ`z', options)

-- Moving text
map('v', 'J', ':m \'>+1<CR>gv=gv', options)
map('v', 'K', ':m \'<-2<CR>gv=gv', options)
map('i', '<C-j>', '<Esc>:m .+1<cr>==', options)
map('i', '<C-k>', '<Esc>:m .-2<cr>==', options)

-- Quickfix and Location list
map('n', '<C-j>', ':cnext<cr>', options)
map('n', '<C-k>', ':cprev<cr>', options)
map('n', '<leader><space>j', ':lnext<cr>', options)
map('n', '<leader><space>k', ':lprev<cr>', options)

-- Close all splits and go to last window
map('n', ';q', '<C-w><C-O>', options)

-- Quick window resize
map('n', '<leader>+', ':exe "resize " . (winheight(0) * 3/2)<cr>', options)
map('n', '<leader>-', ':exe "resize " . (winheight(0) * 2/3)<cr>', options)

-- Make current file executable
map('n', '<leader>x', ':!chmod +x %<cr>', options)

-- FUNCTIONS -------------------------------------------------------------------
-- switch between cpp header and source file
vim.keymap.set('n', '<F2>', vim.fn.SwitchSourceHeader, options)

-- PLUGINS ---------------------------------------------------------------------
-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, options)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, options)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options) -- replaced by telescope version
map('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", options) -- telescope
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
-- vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, options) -- replaced by telescope version
map('n', '<leader>r', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", options) -- telescope
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, options) -- replaced by telescope

-- TELESCOPE FUZZY FINDER ---------------------------------
-- file pickers
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", options)
map('n', '<leader>fb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR><esc>", options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('  : ')})<cr>", options)
map('n', '<leader>fl', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
-- misc
map('n', '<leader><space>t', "<cmd>lua require('telescope.builtin').treesitter()<cr>", options)
map('n', '<leader><space>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map('n', '<leader><space>h', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
map('n', '<leader><space>q', "<cmd>lua require('telescope.builtin').quickfix()<cr>", options)
map('n', '<leader><space>l', "<cmd>lua require('telescope.builtin').loclist()<cr>", options)
map('n', '<leader><space>s', "<cmd>lua require('telescope.builtin').search_history()<cr>", options)
-- git pickers
map('n', '<leader><space>gd', "<cmd>GDiff<cr>", options)
map('n', '<leader><space>gc', "<cmd>lua require('telescope.builtin').git_commits()<cr>", options)
map('n', '<leader><space>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", options)
map('n', '<leader><space>gh', "<cmd>lua require('telescope.builtin').git_stash()<cr>", options)
map('n', '<leader><space>gs', "<cmd>lua require('telescope.builtin').git_status()<cr>", options)
-- vim pickers
map('n', '<leader><space>vo', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
map('n', '<leader><space>vc', "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map('n', '<leader><space>vr', "<cmd>lua require('telescope.builtin').registers()<cr>", options)
map('n', '<leader><space>vt', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", options)

-- NvimTree -----------------------------------------------
map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeRefresh<cr>', options) -- toggle Nvim Tree
vim.keymap.set('n', '<leader>n', require 'config.nvimtree'.nvim_tree_find_file, options)

-- FLOATERM -----------------------------------------------
vim.g.floaterm_keymap_toggle = "<leader>tt" -- toggle terminal
vim.g.floaterm_keymap_prev   = "<leader>tp" -- next terminal
vim.g.floaterm_keymap_next   = "<leader>tn" -- previous terminal
vim.g.floaterm_keymap_new    = "<leader>tf" -- create new terminal window

-- SPECTRE ------------------------------------------------
map('n', '<C-F>', ":lua require('spectre').open()<cr>", options) -- run command :Spectre
map('n', '<C-f>', ":lua require('spectre').open_visual({select_word=true})<cr>", options) -- search current word
map('v', '<C-f>', ":lua require('spectre').open_visual()<cr>", options) -- search current word

-- SEARCH IN CURRENT FILE ---------------------------------
map('n', '<leader>sp', ":lua require('spectre').open_file_search()<cr>", options)

-- HARPOON ------------------------------------------------
map('n', '<S-h>', ":lua require('harpoon.mark').add_file()<cr>", options)
map('n', '<C-h>', ":lua require('harpoon.ui').toggle_quick_menu()<cr>", options)
map('n', '<leader>j', ":lua require('harpoon.ui').nav_next()<cr>", options) -- navigates to next mark
map('n', '<leader>k', ":lua require('harpoon.ui').nav_prev()<cr>", options) -- navigates to previous mark

-- UNDOTREE -----------------------------------------------
map('n', '<leader>u', ':UndotreeToggle<CR>', options)

-- MARKDOWN PREVIEW ---------------------------------------
map('n', '<leader><space>mp', ':MarkdownPreviewToggle<cr>', options)
map('n', '<leader><space>mi', ':call mkdp#util#install()<cr>', options)

-- MAXIMIZER ----------------------------------------------
map('n', '<leader>m', ':MaximizerToggle!<cr>', options)

-- GIT FUGITIVE -------------------------------------------
map('n', '<leader>gj', ':diffget //3<cr>', options)
map('n', '<leader>gf', ':diffget //2<cr>', options)
map('n', '<leader>gs', ':G<cr>', options) -- gv on a file (inside the status menu) to resolve conflicts
map('n', '<leader>gb', ':Git blame<cr>', options)
map('n', '<leader>gd', ':Gdiff<cr>', options)

-- GITSIGNS -----------------------------------------------
-- see config/gitsigns.lua

-- BAZEL --------------------------------------------------
-- vim.api.nvim_create_autocmd("FileType", { pattern = "bzl", callback = function() map('n', 'gd', vim.fn.GoToBazelDefinition, { buffer = 0 }) end }) -- breaks
vim.keymap.set('n', 'gbt', vim.fn.GoToBazelTarget)
vim.keymap.set('n', '<leader>bl', vim.fn.RunBazel)
vim.keymap.set('n', '<leader>bd', require 'config.bazel'.DebugThisTest)
vim.keymap.set('n', '<leader>by', require 'config.bazel'.YankLabel)
vim.keymap.set('n', '<leader>bt', function() vim.fn.RunBazelHere("test " .. vim.g.bazel_config .. " -c opt") end)
vim.keymap.set('n', '<leader>bb', function() vim.fn.RunBazelHere("build " .. vim.g.bazel_config .. " -c opt") end)
vim.keymap.set('n', '<leader>br', function() vim.fn.RunBazelHere("run " .. vim.g.bazel_config .. " -c opt") end)
vim.keymap.set('n', '<leader>bdb', function() vim.fn.RunBazelHere("build " .. vim.g.bazel_config .. " -c dbg --cxxopt=-O0 ") end)

-- DEBUGGING ----------------------------------------------
local dap = require 'telescope'.extensions.dap
vim.keymap.set('n', '<leader>dt', require 'dapui'.toggle)
vim.keymap.set('n', '<leader>db', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', ":lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", options)
vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<F6>', require 'dap'.run_to_cursor)
vim.keymap.set('n', '<leader>df', dap.frames)
vim.keymap.set('n', '<leader>dc', dap.commands)
vim.keymap.set('n', '<leader>de', require 'config.dap'.end_debug_session)
-- vim.keymap.setmap('n', '...', require'config.dap'.set_python_args_from_input)
-- vim.keymap.setmap('n', '...', require'dap'.repl.open)
-- vim.keymap.setmap('n', '...', require('dap.ui.widgets').hover)
-- vim.keymap.setmap('n', '...', require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).toggle)
-- vim.keymap.setmap('n', '...', require'dap'.run_last())
-- vim.keymap.setmap('n', '...', require'dap'..set_breakpoint(nil, nil, vim.fn.input('Log point message: ')))

-- BARBAR -------------------------------------------------
local barbar_opts = { noremap = true, silent = true, nowait = true }
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', barbar_opts)
map('n', '<A-.>', ':BufferNext<CR>', barbar_opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', barbar_opts)
map('n', '<A->>', ':BufferMoveNext<CR>', barbar_opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', barbar_opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', barbar_opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', barbar_opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', barbar_opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', barbar_opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', barbar_opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', barbar_opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', barbar_opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', barbar_opts)
map('n', '<A-0>', ':BufferLast<CR>', barbar_opts)
-- Close commands
map('n', '<A-c>', ':BufferClose<CR>', barbar_opts)
map('n', '<A-d>', ':BufferCloseAllButCurrent<CR>', barbar_opts)
map('n', '<A-l>', ':BufferCloseBuffersLeft<CR>', barbar_opts)
map('n', '<A-r>', ':BufferCloseBuffersRight<CR>', barbar_opts)

-- CHEATSHEET ---------------------------------------------
map('n', '<leader>?', ':Cheatsheet<cr>', options)
