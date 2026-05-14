return {
    config = function()
        local cmp = require("cmp")
        local sources = {
            buffer = { name = "buffer" },
            cmdline = { name = "cmdline" },
            nvim_lsp = { name = "nvim_lsp" },
            path = { name = "path" },
        }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({ sources.nvim_lsp, sources.buffer, sources.path }),
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ sources.cmdline, sources.path }),
        })
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ sources.buffer }),
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
