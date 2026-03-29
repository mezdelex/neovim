return {
    config = function()
        local agentic = require("agentic")

        agentic.setup({
            provider = "opencode-acp",
        })

        vim.api.nvim_set_hl(0, "AgenticTitle", {
            bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
            bold = true,
            fg = vim.api.nvim_get_hl(0, { name = "String" }).fg,
        })

        vim.keymap.set("n", "<leader>h", agentic.toggle)
    end,
    defer = true,
    src = "https://github.com/carlos-algms/agentic.nvim",
}
