return {
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "angularls",
                "basedpyright",
                "bashls",
                "buf_ls",
                "cssls",
                "docker_compose_language_service",
                "docker_language_server",
                "dockerls",
                "gopls",
                "helm_ls",
                "html",
                "jsonls",
                "lemminx",
                "lua_ls",
                "marksman",
                "powershell_es",
                "ruff",
                "rust_analyzer",
                "sqlls",
                "terraformls",
                "tombi",
                "ts_ls",
                "vimls",
                "vue_ls",
                "yamlls",
            },
        })

        vim.diagnostic.config({
            float = {
                focus = false,
                scope = "cursor",
            },
            jump = { on_jump = vim.diagnostic.open_float },
            signs = {
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                },
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.WARN] = "",
                },
            },
            update_in_insert = true,
            virtual_text = true,
        })

        vim.keymap.set("n", "<leader>R", "<cmd>Roslyn restart<cr>")
    end,
    defer = true,
    dependencies = {
        { src = "https://github.com/mezdelex/roslyn.nvim" },
        { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
        { src = "https://github.com/williamboman/mason.nvim" },
    },
    src = "https://github.com/neovim/nvim-lspconfig",
}
