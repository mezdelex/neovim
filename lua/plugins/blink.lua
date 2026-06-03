return {
    config = function()
        local cmp = require("blink.cmp")
        local pairs = require("blink.pairs")

        cmp.build():pwait()
        pairs.build():pwait()

        require("blink.indent").setup({
            scope = {
                highlights = { "BlinkIndentScope" },
            },
        })
        cmp.setup({
            completion = {
                documentation = { auto_show = true },
            },
            keymap = { preset = "enter" },
        })
        pairs.setup({
            highlights = { enabled = false },
        })
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/saghen/blink.lib",
        },
        {
            defer = true,
            src = "https://github.com/saghen/blink.indent",
        },
        {
            defer = true,
            src = "https://github.com/saghen/blink.pairs",
        },
    },
    src = "https://github.com/saghen/blink.cmp",
}
