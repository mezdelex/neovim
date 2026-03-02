return {
    config = function()
        local null = require("null-ls")

        require("mason-null-ls").setup({
            ensure_installed = {
                "csharpier",
                "prettier",
                "shfmt",
                "sql-formatter",
                "stylua",
            },
        })

        null.setup({
            sources = {
                null.builtins.formatting.csharpier,
                null.builtins.formatting.prettier,
                null.builtins.formatting.shfmt,
                null.builtins.formatting.sql_formatter,
                null.builtins.formatting.stylua,
            },
        })
    end,
    defer = true,
    dependencies = {
        { src = "https://github.com/jay-babu/mason-null-ls.nvim" },
    },
    src = "https://github.com/nvimtools/none-ls.nvim",
}
