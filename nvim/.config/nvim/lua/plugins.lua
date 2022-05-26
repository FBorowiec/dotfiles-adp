local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerSync', group = packer_group, pattern = 'plugins.lua' })

-- Check "awesome-neovim plugins" on: https://github.com/rockerBOO/awesome-neovim/blob/main/README.md
return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- general
    use { 'inkarkat/vim-ReplaceWithRegister' } -- replace text with the contents of a register
    use { 'mbbill/undotree' } -- undotree
    use { 'tpope/vim-commentary' } -- smart commenting with 'gcc'
    use { 'machakann/vim-highlightedyank', config = function() require 'config.highlightedyank'.setup() end } -- highlight yanked section
    use { 'APZelos/blamer.nvim', config = function() require 'config.blamer'.setup() end } -- git blame
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    -- cmp
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/nvim-cmp', config = function() require 'config.cmp'.setup() end }
    use { 'alexander-born/cmp-bazel' }

    -- lsp
    use { 'folke/trouble.nvim', config = function() require 'trouble'.setup() end }
    use { 'neovim/nvim-lspconfig', config = function() require 'config.nvim-lspconfig'.setup() end }
    use { 'williamboman/nvim-lsp-installer', config = function() require 'config.nvim-lsp'.setup() end }
    use { 'ray-x/lsp_signature.nvim', config = function() require 'lsp_signature'.setup({ hint_enable = false }) end }
    use { 'aymericbeaumet/vim-symlink' }
    use { 'onsails/lspkind-nvim', config = function() require 'lspkind'.init() end }

    -- telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope.nvim', config = function() require 'config.telescope'.setup() end }

    -- colorschemes
    use { 'ChristianChiarulli/nvcode-color-schemes.vim' } -- VS Code-like colorscheme
    use { 'joshdick/onedark.vim' } -- Atom-like colorschemej
    use { 'morhetz/gruvbox' } -- gruuuuuuuuuuuuuuuuvbox colorscheme
    use { 'sainnhe/gruvbox-material' } -- gruuuuuuuuuuuuuuuuvbox material
    use { 'arcticicestudio/nord-vim', config = function() require 'config.nord'.setup() end } -- the one and only

    -- appearance
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require 'indent_blankline'.setup { filetype = { 'cpp', 'python', 'json', 'bzl' } } end } -- adds indentation guides to all lines
    use { 'nvim-lualine/lualine.nvim', config = function() require 'config.lualine'.setup() end } -- bottom status line
    use { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end } -- colorize color hexes
    use {
        'romgrk/barbar.nvim', -- show buffers in tab line
        event = { 'VimEnter' },
        setup = require('config.barbar').setup,
        config = require('config.barbar').config,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- startscreen alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.opts)
        end
    }

    -- filetree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require 'config.nvimtree'.setup() end
    }

    -- markdown
    use { 'davidgranstrom/nvim-markdown-preview' }

    -- git
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }
    use { 'lewis6991/gitsigns.nvim', config = function() require 'config.gitsigns'.setup() end }
    use { 'rhysd/conflict-marker.vim' }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require 'config.treesitter'.setup() end }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'nvim-treesitter/playground' }

    -- null-ls for autoformat
    use { 'jose-elias-alvarez/null-ls.nvim', config = function() require 'config.null-ls'.setup() end }

    -- terminal
    use { 'voldikss/vim-floaterm', config = function() require 'config.floaterm'.setup() end }

    -- debugging
    use { 'szw/vim-maximizer' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'mfussenegger/nvim-dap', config = function() require 'config.dap'.setup() end }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'theHamsta/nvim-dap-virtual-text', config = function() require 'nvim-dap-virtual-text'.setup() end }
    -- use {'Pocco81/DAPInstall.nvim', config = function() require("dap-install").setup() end }

    -- Harpoon for most recent files editing
    use { 'ThePrimeagen/harpoon', config = function() require 'config.harpoon'.setup() end }

    -- bazel
    use { 'google/vim-maktaba' }
    use { 'bazelbuild/vim-bazel' }
    use { 'alexander-born/bazel-vim', config = function() require 'config.bazel'.setup() end }

    -- find and replace
    use {
        'nvim-pack/nvim-spectre', config = function() require 'config.spectre'.setup() end,
        requires = { 'nvim-lua/plenary.nvim', opt = true }
    }

    -- which key
    use { 'folke/which-key.nvim', config = function() require 'config.which-key' end }

    -- github copilot
    use { 'github/copilot.vim' }

    -- miscenallaneous
    use { 'airblade/vim-rooter', config = function() require 'config.rooter'.setup() end } -- change vim root folder automatically
    use { 'luukvbaal/stabilize.nvim', config = function() require 'stabilize'.setup() end } -- stabilize window when opening new ones
    use { 'sudormrfbin/cheatsheet.nvim' }
    use { 'lewis6991/spellsitter.nvim' }

    -- appearance - devicons - needs to be last
    use { 'kyazdani42/nvim-web-devicons', config = function() require 'config.devicons'.setup() end } -- dev icons
end)
