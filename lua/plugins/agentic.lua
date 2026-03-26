return {
    config = function()
        local agentic = require("agentic")

        agentic.setup({
            provider = "opencode-acp",
        })

        vim.keymap.set("n", "<leader>h", agentic.toggle)
    end,
    defer = true,
    src = "https://github.com/carlos-algms/agentic.nvim",
}
