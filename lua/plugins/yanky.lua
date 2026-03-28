return {
    config = function()
        require("yanky").setup({
            highlight = { timer = 100 },
            system_clipboard = { clipboard_register = "+" },
        })

        vim.keymap.set("n", "<c-n>", "<plug>(YankyNextEntry)")
        vim.keymap.set("n", "<c-p>", "<plug>(YankyPreviousEntry)")
        vim.keymap.set({ "n", "x" }, "P", "<plug>(YankyPutBefore)")
        vim.keymap.set({ "n", "x" }, "p", "<plug>(YankyPutAfter)")
        vim.keymap.set({ "n", "x" }, "y", "<plug>(YankyYank)")
    end,
    defer = true,
    src = "https://github.com/gbprod/yanky.nvim",
}
