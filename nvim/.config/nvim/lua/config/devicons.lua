local M = {}

function M.setup()
    vim.cmd([[
        if empty(glob("~/.local/share/fonts/ubuntu-mono-powerline-ttf"))
            echo "Installing powerline fonts..\n"
            silent !mkdir -p ~/.fonts/ubuntu-mono-powerline-ttf
            execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline Bold Italic.ttf"'
            execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline Bold.ttf"'
            execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline Italic.ttf"'
            execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline.ttf"'
            execute 'silent !fc-cache -vf'
        endif
    ]])
    require 'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {
            zsh = {
                icon = "",
                color = "#81A1C1",
                name = "zsh",
                cterm_color = "39"
            },
            ['zshrc'] = {
                icon = "",
                color = "#81A1C1",
                name = "zshrc",
                cterm_color = "39"
            },
            ['inputrc'] = {
                icon = "",
                color = "#81A1C1",
                name = "inputrc",
                cterm_color = "39"
            },
            ['.gitattributes'] = {
                icon = '',
                color = '#BF616A',
                name = 'gitattributes',
                cterm_color = "203"
            },
            ['.gitconfig'] = {
                icon = '',
                color = '#BF616A',
                name = 'gitconfig',
                cterm_color = "203"
            },
            gitconfig = {
                icon = '',
                color = '#BF616A',
                name = 'gitconfig',
                cterm_color = "203"
            },
            ['.gitignore'] = {
                icon = '',
                color = '#BF616A',
                name = 'gitignore',
                cterm_color = "203"
            },
            gitignore = {
                icon = '',
                color = '#BF616A',
                name = 'gitignore',
                cterm_color = "203"
            },
            ['.lfsconfig'] = {
                icon = '',
                color = '#BF616A',
                name = 'lfsconfig',
                cterm_color = "203"
            },
            ['.gitlint'] = {
                icon = '',
                color = '#BF616A',
                name = 'gitlint',
                cterm_color = "203"
            },
            ['TODO'] = {
                icon = '',
                color = '#B48EAD',
                name = 'TODO',
                cterm_color = "183"
            },
            ['BUILD'] = {
                icon = '',
                color = '#A3BE8C',
                name = 'BUILD',
                cterm_color = "2"
            },
            ['WORKSPACE'] = {
                icon = '',
                color = '#A3BE8C',
                name = 'WORKSPACE',
                cterm_color = "2"
            },
            ['.bazeliskrc'] = {
                icon = '',
                color = '#A3BE8C',
                name = 'bazeliskrc',
                cterm_color = "2"
            },
            ['.bazelrc'] = {
                icon = '',
                color = '#A3BE8C',
                name = 'bazelrc',
                cterm_color = "2"
            },
            bazelrc = {
                icon = '',
                color = '#A3BE8C',
                name = 'bazelrc',
                cterm_color = "2"
            },
            bzl = {
                icon = '',
                color = '#A3BE8C',
                name = 'bzl',
                cterm_color = "2"
            },
            ['.bazelversion'] = {
                icon = '',
                color = '#A3BE8C',
                name = 'bazelversion',
                cterm_color = "2"
            },
            ['.bazelignore'] = {
                icon = '',
                color = '#A3BE8C',
                name = 'bazelversion',
                cterm_color = "2"
            },
            txt = {
                icon = '',
                color = '#88C0D0',
                name = 'txt',
                cterm_color = "14"
            },
            ['version'] = {
                icon = '',
                color = '#B48EAD',
                name = 'version',
                cterm_color = "183"
            },
            config = {
                icon = '',
                color = '#6D8086',
                name = 'config',
                cterm_color = "8"
            },
            ['.coveragerc'] = {
                icon = '',
                color = '#6D8086',
                name = 'coveragerc',
                cterm_color = "8"
            },
            ['.pylintrc'] = {
                icon = '',
                color = '#6D8086',
                name = 'pylintrc',
                cterm_color = "8"
            },
            ['Jenkinsfile'] = {
                icon = '',
                color = '#ECEFF4',
                name = 'Jenkinsfile',
                cterm_color = "15"
            },
            fcdl = {
                icon = 'ﲩ',
                color = '#ECEFF4',
                name = 'fcdl',
                cterm_color = "15"
            },
            ['.clang-format'] = {
                icon = '',
                color = '#ECEFF4',
                name = 'ClangFormat',
                cterm_color = "15"
            },
            ['.clang-tidy'] = {
                icon = '',
                color = '#ECEFF4',
                name = 'ClangTidy',
                cterm_color = "15"
            },
            ['.clang-tidy-minimal'] = {
                icon = '',
                color = '#ECEFF4',
                name = 'ClangTidyMinimal',
                cterm_color = "15"
            },
            msg = {
                icon = '',
                color = '#ECEFF4',
                name = 'msg',
                cterm_color = "15"
            },
            csv = {
                icon = '',
                color = '#A3BE8C',
                name = 'csv',
                cterm_color = "155"
            },
            xlsx = {
                icon = '',
                color = '#A3BE8C',
                name = 'xlsx',
                cterm_color = "155"
            }
        };
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
    }
end

return M
