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
            no_name_title = "[unnamed]",
        })
    end,
    defer = true,
    src = "https://github.com/romgrk/barbar.nvim",
}
