return {
    'goolord/alpha-nvim',
    config = function ()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            return
        end

        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {

            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢤⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣷⣿⣚⡵⣄⣴⣾⣿⣦⡀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣾⣻⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣧⣯⣿⣿⣿⡇⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⠔⣿⢿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⣀⣠⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⢰⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣟⣿⣷⣿⣿⣿⣿⣿⢻⣿⣿⡟⠁⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⣽⢧⣿⣿⢿⣿⣿⢿⣿⣿⣿⣿⣿⢹⡇⠈⢻⣿⣾⣿⣿⣿⣿⣼⠙⠻⣷⡄⠀⠀]],
            [[⠀⠀⠀⠀⠀⢸⢿⡿⣶⣿⣾⣿⣃⣌⣻⣽⣿⣿⠧⠳⢺⣿⣿⡿⢻⣿⣿⣿⣿⡖⠂⠐⢉⡗⠀⠀]],
            [[⠀⠀⠀⠀⠀⠚⠸⡇⣿⣯⣿⡿⠍⢿⣿⠏⠁⠉⠁⠀⠀⠉⢉⢀⣿⣿⣿⡿⣿⣿⣣⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠸⣦⢣⣿⣷⣿⡿⣦⡁⠀⠀⠀⠀⠀⠀⠀⠀⢾⡾⣻⣟⣿⣷⣿⡿⢿⣆⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠀⢈⣾⢿⣿⣿⣿⣿⣌⠂⠀⠀⠀⣀⠀⠀⠀⢀⡾⣿⡃⣿⡿⡿⠃⠀⣿⠀⠀⠀⠀]],
            [[⠀⠀⠀⠰⣤⣴⡿⠏⣿⣿⣿⣿⡿⣟⣶⠤⣄⢻⠏⣂⢠⠔⣻⣿⡟⣧⣿⡟⠣⣄⣴⠟⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⢻⣿⠀⠀⠿⠟⣟⠉⣰⣟⠶⡄⡌⠸⠿⣰⣏⠜⣻⣟⡸⠍⠸⠇⠀⠀⠀⠈⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠀⠉⠢⠀⠀⠈⠜⠀⠈⡉⠀⣻⠄⣰⢋⢯⠝⡊⠑⣛⠀⠁⢰⣤⣀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⡰⣷⣷⡀⠀⠀⠀⢀⠀⠀⠂⠃⠰⢀⡯⡕⠚⡆⠹⡁⣮⣄⡀⣸⣿⣿⣿⣆⠀⠀⠀⠀⠠]],
            [[⠀⢀⣜⣶⣿⣿⣮⣀⠀⠐⣽⠊⠀⠀⢀⠀⠃⣥⠷⠀⠹⠐⢚⡁⢞⣻⣿⣿⣿⣿⣿⣶⡀⠀⢀⡀]],
            [[⢀⣾⡿⣽⣾⣿⣿⣿⣷⣦⣹⠄⠀⠀⡄⠀⠀⣯⠻⡆⠘⢃⣞⣇⢈⣿⣿⣿⢿⣿⣻⠟⠀⠀⡐⠀]],


        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("w", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e C:\\Users\\Parsifal\\AppData\\Local\\nvim\\init.lua<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        local function footer()
            return "Don't Stop Until You are Proud..."
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        require("alpha").setup(dashboard.config)
        -- require'alpha'.setup(require'alpha.themes.dashboard'.config)

    end
}
