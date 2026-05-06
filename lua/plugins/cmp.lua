return {
    config = function()
        local cmp = require("cmp")
        local sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "cmdline" },
            { name = "path" },
        }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources(sources),
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(sources),
        })
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(sources),
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
        {
            defer = true,
            src = "https://github.com/hrsh7th/cmp-cmdline",
        },
    },
    src = "https://github.com/hrsh7th/cmp-path",
}
