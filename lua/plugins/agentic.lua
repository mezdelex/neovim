return {
    config = function()
        local agentic = require("agentic")

        agentic.setup({
            chat_icons = {
                agent = "",
                user = "",
            },
            diagnostic_icons = {
                error = "",
                hint = "",
                info = "",
                warn = "",
            },
            permission_icons = {
                allow_always = "󱍷",
                allow_once = "",
                reject_always = "",
                reject_once = "󰍶",
            },
            provider = "opencode-acp",
            status_icons = {
                completed = "",
                failed = "",
                in_progress = "",
                pending = "",
            },
        })

        vim.keymap.set("n", "<leader>h", agentic.toggle)
    end,
    defer = true,
    src = "https://github.com/carlos-algms/agentic.nvim",
}
