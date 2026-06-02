return {
    config = function()
        require("blink.cmp").build():pwait()
        require("blink.pairs").build():pwait()

        require("blink.indent").setup({
            scope = {
                highlights = { "BlinkIndentScope" },
            },
        })
        require("blink.pairs").setup({
            highlights = { enabled = false },
        })
        require("blink.cmp").setup({
            completion = {
                documentation = { auto_show = true },
            },
            keymap = { preset = "enter" },
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
