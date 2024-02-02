return {
    "coffebar/neovim-project",
    -- cmd = "Telescope neovim-project",
    event = "VeryLazy",
    opts = {
        last_session_on_startup = false,
        projects = { -- define project roots
            "~/CodeField/Haskell/",
            "~/CodeField/C++",
            "~/CodeField/Python",
            "~/CodeField/Rust/",
            "~/.config/nvim",
            "/mnt/c/Users/Parsifal/AppData/Roaming/Rime",
            "/mnt/c/Users/Parsifal/",
            "/mnt/e/Aldric/Desktop/",
            "~/Desktop/Blog/",
        },
    },
    init = function()
        vim.opt.sessionoptions:append "globals"
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "Shatur/neovim-session-manager" },
    },
}
