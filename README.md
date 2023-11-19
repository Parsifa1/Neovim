# my-neovim

我的个人Noevim配置，使用Lazy.nvim作为包管理器，力求高度可定制。

全lua配置，尽量清晰易懂，使用最新的neovim-nightly构建。

![example](https://raw.githubusercontent.com/Parsifa1/graph/master/image.png)

# Data Structure

```
.
├── init.lua
├── lazy-lock.json
├── LICENSE
├── lua
│   ├── custom.lua
│   ├── keymap.lua
│   ├── option.lua
│   ├── plugin.lua
│   ├── plugins
│   │   ├── core
│   │   │   ├── cmp-buffer.lua
│   │   │   ├── cmp-cmdline.lua
│   │   │   ├── cmp-nvim-lsp.lua
│   │   │   ├── cmp-path.lua
│   │   │   ├── conform.lua
│   │   │   ├── lsp-format.lua
│   │   │   ├── lsp_signature.lua
│   │   │   ├── luasnip.lua
│   │   │   ├── mason-installer.lua
│   │   │   ├── Mason.lua
│   │   │   ├── neodev.lua
│   │   │   ├── nvim-cmp.lua
│   │   │   └── nvim-lspconfig.lua
│   │   ├── dap
│   │   │   ├── dap.lua
│   │   │   ├── dap-ui.lua
│   │   │   ├── dap-virtual-text.lua
│   │   │   └── mason-dap.lua
│   │   ├── edit
│   │   │   ├── comment.lua
│   │   │   ├── flash.lua
│   │   │   ├── treesitter-textobjects.lua
│   │   │   ├── vim-repeat.lua
│   │   │   ├── vim-surround.lua
│   │   │   └── vim-targets.lua
│   │   ├── git
│   │   │   ├── flog.lua
│   │   │   ├── fugitive.lua
│   │   │   ├── gist.lua
│   │   │   ├── git-conflict.lua
│   │   │   ├── gitlinker.lua
│   │   │   └── neogit.lua
│   │   ├── others
│   │   │   ├── filetype.lua
│   │   │   ├── fzf-native.lua
│   │   │   ├── markdown-preview.lua
│   │   │   ├── node_modules
│   │   │   ├── yanky.lua
│   │   │   └── yarn.lock
│   │   ├── theme
│   │   │   ├── catppuccin.lua
│   │   │   ├── everforest.lua
│   │   │   └── onedark.lua
│   │   ├── tools
│   │   │   ├── aerial.lua
│   │   │   ├── asynctasks.lua
│   │   │   ├── compatitest.lua
│   │   │   ├── copilot.lua
│   │   │   ├── neo-tree.lua
│   │   │   ├── nvim-autopairs.lua
│   │   │   ├── suda.lua
│   │   │   ├── telescope.lua
│   │   │   ├── treesitter.lua
│   │   │   ├── trouble.lua
│   │   │   └── which-key.lua
│   │   └── ui
│   │       ├── alpha.lua
│   │       ├── blankline.lua
│   │       ├── colorscheme.lua
│   │       ├── dropbar.lua
│   │       ├── edgy.lua
│   │       ├── lualine.lua
│   │       ├── noice.lua
│   │       ├── nvim-notify.lua
│   │       └── toggleterm.lua
│   └── snippets
│       └── cpp.lua
├── README.md
└── tasks.ini

13 directories, 67 files
```
