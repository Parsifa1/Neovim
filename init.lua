--包导入
require('keymap')
require('plugins')
require('option')

vim.g.mapleader = ' '


-- 全局插件
require('leap').add_default_mappings()

if vim.g.vscode then
    --仅用于vscode的插件
    vim.opt.timeoutlen = 1000
else
    -- 仅用于neovim的插件
    require('lsp')
    require('lualine').setup()
    require('colorscheme')
    require('nvim-tree').setup({ -- 关闭文件时自动关闭
        -- auto_close = true,
        -- 不显示 git 状态图标
        git = {
            enable = false
        },
        require 'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
        require("toggleterm").setup {
            size = 10,
            open_mapping = [[<A-q>]],
            direction = 'float',
            cmd = "powershell -NoLogo",
            start_in_insert = true,
            shell = "pwsh.exe",
            float_opts = {
                autochdir = true,
                border = "curved",
                width = math.ceil(vim.o.columns * 0.8),
                height = math.ceil(vim.o.columns * 0.2)
            }
        }
    })
end
