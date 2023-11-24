return {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- enabled = false,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    opts = {
        cmdline = { view = "cmdline" },
        lsp = {
            progress = { enabled = false },
            hover = { enabled = false },
            signature = { enabled = false },
        },
        routes = {
            {
                filter = { event = "msg_show", find = "[w]" },
                opts = { skip = true },
            },
            {
                filter = { min_height = 10 },
                view = "split",
            },
            {
                filter = { event = "msg_show", find = "attempt to index local 'tree'" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", find = "Invalid 'window': Expected Lua number" },
                opts = { skip = true },
            },
        },
    },
}
