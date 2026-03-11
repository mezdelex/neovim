return {
    config = function()
        local codecompanion = require("codecompanion")

        codecompanion.setup({
            interactions = {
                chat = { adapter = "ollama" },
            },
        })

        vim.keymap.set("n", "<leader>h", codecompanion.toggle)
    end,
    defer = true,
    src = "https://github.com/olimorris/codecompanion.nvim",
}
