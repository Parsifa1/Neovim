return {
    "3rd/image.nvim",
    -- enabled = false,
    ft = "markdown",
    config = function()
        require("image").setup {
            backend = "kitty",
            integrations = {
                markdown = {
                    only_render_image_at_cursor = true
                }
            }
        }
    end,
}
