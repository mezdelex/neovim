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
    dependencies = {
        { src = "https://github.com/nvim-lua/plenary.nvim" },
    },
    src = "https://github.com/olimorris/codecompanion.nvim",
}
