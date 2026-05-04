return {
    config = function()
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
    data = {
        build = "cargo +nightly build --release",
        conflicts = { "blink_cmp_fuzzy.dll" },
    },
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/saghen/blink.indent",
        },
        {
            data = {
                build = "cargo +nightly build --release",
                conflicts = "blink_pairs.dll",
            },
            defer = true,
            src = "https://github.com/saghen/blink.pairs",
        },
    },
    src = "https://github.com/saghen/blink.cmp",
    version = "v1",
}
