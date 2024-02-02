---@diagnostic disable: unused-local
return {
    "folke/edgy.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
        bottom = {
            {
                ft = "toggleterm",
                title = " main",
                size = { height = 0.5 },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
        },
    },
}
