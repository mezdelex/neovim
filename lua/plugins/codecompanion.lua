return {
    config = function()
        local codecompanion = require("codecompanion")

        codecompanion.setup({
            interactions = {
                chat = { adapter = os.getenv("CODECOMPANION_ADAPTER") },
            },
        })
        vim.cmd("Copilot disable")

        vim.keymap.set("n", "<leader>h", codecompanion.toggle)
    end,
    defer = true,
    dependencies = {
        { src = "https://github.com/github/copilot.vim" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },
    },
    src = "https://github.com/olimorris/codecompanion.nvim",
}
