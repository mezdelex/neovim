return {
    config = function()
        local agentic = require("agentic")
        local sequence = { "", "", "", "" }
        local spinner = vim.fn.mapnew(vim.fn.range(38), function(_, i)
            return sequence[i % #sequence + 1]
        end)

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
            spinner_chars = {
                busy = spinner,
                generating = spinner,
                searching = spinner,
                thinking = spinner,
            },
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
