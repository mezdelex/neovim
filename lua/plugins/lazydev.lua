return {
    config = function()
        require("lazydev").setup({
            library = { "blink.lib", "nvim-treesitter-textobjects" },
        })
    end,
    defer = true,
    src = "https://github.com/folke/lazydev.nvim",
}
