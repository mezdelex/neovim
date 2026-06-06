return {
    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                layout_config = {
                    height = vim.o.lines,
                    width = vim.o.columns,
                },
                layout_strategy = "vertical",
                path_display = { "truncate" },
            },
        })
        telescope.load_extension("egrepify")
        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>F", telescope.extensions.egrepify.egrepify)
        vim.keymap.set("n", "<leader>d", builtin.diagnostics)
        vim.keymap.set("n", "<leader>f", builtin.fd)
        vim.keymap.set("n", "<leader>j", builtin.buffers)
        vim.keymap.set("n", "<leader>q", builtin.quickfix)
        vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
        vim.keymap.set({ "n", "x" }, "gs", builtin.grep_string)
    end,
    dependencies = {
        {
            data = { build = "make" },
            src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        },
        { src = "https://github.com/fdschmidt93/telescope-egrepify.nvim" },
    },
    src = "https://github.com/nvim-telescope/telescope.nvim",
}
