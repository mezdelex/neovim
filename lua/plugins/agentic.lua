return {
    config = function()
        local agentic = require("agentic")

        agentic.setup({
            acp_providers = {
                ["cline-acp"] = {
                    args = { "-Command", "cline --acp" },
                    command = "pwsh",
                },
            },
            provider = os.getenv("ACP_PROVIDER"),
        })

        vim.keymap.set("n", "<leader>h", agentic.toggle)
    end,
    defer = true,
    src = "https://github.com/carlos-algms/agentic.nvim",
}
