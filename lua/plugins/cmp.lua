return {
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<c-n>"] = cmp.mapping.select_next_item(),
                ["<c-p>"] = cmp.mapping.select_prev_item(),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/hrsh7th/nvim-cmp",
        },
        {
            defer = true,
            src = "https://github.com/hrsh7th/cmp-nvim-lsp",
        },
        {
            defer = true,
            src = "https://github.com/hrsh7th/cmp-buffer",
        },
    },
    src = "https://github.com/hrsh7th/cmp-path",
}
