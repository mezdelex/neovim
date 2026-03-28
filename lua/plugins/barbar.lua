return {
    config = function()
        require("barbar").setup({
            animation = false,
            clickable = false,
            icons = {
                button = false,
                inactive = {
                    separator = { left = "" },
                },
                separator = { left = "" },
                separator_at_end = false,
            },
        })
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/nvim-tree/nvim-web-devicons",
        },
    },
    src = "https://github.com/romgrk/barbar.nvim",
}
