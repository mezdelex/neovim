return {
    config = function()
        require("ibl").setup({
            scope = { enabled = false },
        })
    end,
    defer = true,
    src = "https://github.com/lukas-reineke/indent-blankline.nvim",
}
