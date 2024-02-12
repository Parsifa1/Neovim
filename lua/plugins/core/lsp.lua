local config = function()
    local lspconfig = require "lspconfig"
    local custom = require "custom"

    -- Customized on_attach function
    custom.set("n", "[d", vim.diagnostic.goto_prev, "goto prev")
    custom.set("n", "]d", vim.diagnostic.goto_next, "goto next")
    custom.set("n", "<leader>q", ":TroubleToggle<CR>", "quickfix list")

    -- use autocmd to automatically sign up lsp
    vim.api.nvim_create_autocmd("LspAttach", {

        desc = "General LSP Attach",
        callback = function(args)
            local bufnr = args.bufnr
            local set = function(keys, func, indesc)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = indesc })
            end
            -- for inlay hints
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(bufnr, true)
            end
            --lsp-builtin
            set("gD", vim.lsp.buf.declaration, "declaration")
            set("gd", vim.lsp.buf.definition, "definition")
            set("K", vim.lsp.buf.hover, "hover")
            set("<C-k>", vim.lsp.buf.signature_help, "LSP: Signature help")
            set("gi", vim.lsp.buf.implementation, "implementation")
            set("<leader>cd", vim.lsp.buf.type_definition, "type definition")
            set("<leader>cn", vim.lsp.buf.rename, "rename")
            set("gr", vim.lsp.buf.references, "references")
            --lspsaga
            set("<leader>gd", ":Lspsaga peek_definition<CR>", "Lsp Definition")
            set("<leader>cr", require("telescope.builtin").lsp_references, "Peek References")
            set("F", ":Lspsaga finder def+ref<CR>", "Finder")
            set("<leader>cl", ":Lspsaga outline<CR>", " OutLine")
            set("<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code Action")
            vim.diagnostic.config {
                virtual_text = {
                    spacing = 4,
                    -- severity = { min = vim.diagnostic.severity.WARN },
                },
                float = {
                    severity_sort = true,
                    source = "if_many",
                },
                severity_sort = true,
                -- Set diagnostic icons
                signs = {
                    text = {
                        ["ERROR"] = custom.icons.diagnostic.Error,
                        ["WARN"] = custom.icons.diagnostic.Warning,
                        ["HINT"] = custom.icons.diagnostic.Hint,
                        ["INFO"] = custom.icons.diagnostic.Information,
                    },
                },
            }
        end,
    })
    -- for neodev
    require("neodev").setup {
        override = function(root_and_library)
            local library = root_and_library.roo_dir
            library.enabled = true
            library.plugins = true
        end,
    }

    -- for lspsaga
    require("lspsaga").setup {
        ui = {
            code_action = "",
        },
        beacon = {
            enable = false,
        },
        outline = {
            layout = "float",
            keys = {
                toggle_or_jump = "<cr>",
            },
        },
        finder = {
            keys = {
                shuttle = "J",
                toggle_or_open = "<cr>",
            },
        },
        symbol_in_winbar = {
            enable = false,
            separator = "  ",
        },
    }

    --for lsp signature
    require("lsp_signature").setup {
        hint_prefix = "🧐 ",
        handler_opts = {
            border = require("custom").border,
        },
    }

    -- for lsp config in mason
    require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        ["clangd"] = function()
            lspconfig.clangd.setup {
                filetypes = { "cpp", "c" },
                cmd = {
                    -- "clangd",
                    -- TODO:测试版clangd
                    "/home/parsifa1/Public/test/build/bin/clangd",
                    "--offset-encoding=utf-16",
                },
            }
        end,
        ["pyright"] = function()
            lspconfig.pyright.setup {
                cmd = { "delance-langserver", "--stdio" },
                settings = {
                    python = {
                        analysis = {
                            inlayHints = {
                                callArgumentNames = "partial",
                                functionReturnTypes = true,
                                pytestParameters = true,
                                variableTypes = true,
                            },
                        },
                    },
                },
            }
        end,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        hint = {
                            enable = true,
                            arrIndex = "Enable",
                            setType = true,
                        },
                        diagnostics = {
                            disable = { "missing-fields", "incomplete-signature-doc" },
                            globals = { "vim" },
                        },
                    },
                },
            }
        end,
        ["typst_lsp"] = function()
            lspconfig.typst_lsp.setup {
                root_dir = function()
                    return vim.fn.getcwd()
                end,
                settings = {
                    exportPdf = "onType",
                },
            }
        end,
    }
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "lukas-reineke/lsp-format.nvim",
        "ray-x/lsp_signature.nvim",
        "folke/neodev.nvim",
        "nvimdev/lspsaga.nvim",
    },
    event = "BufReadPre",
    config = config,
}
