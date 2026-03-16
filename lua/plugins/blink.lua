return {
    config = function()
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
        build = "cargo build --release",
        conflicts = { "blink_cmp_fuzzy.dll" },
    },
    defer = true,
    dependencies = {
        {
            data = {
                build = "cargo build --release",
                conflicts = "blink_pairs.dll",
            },
            defer = true,
            src = "https://github.com/saghen/blink.pairs",
        },
    },
    src = "https://github.com/saghen/blink.cmp",
}
