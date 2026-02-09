return {
    config = function()
        local options = { remap = true }
        local textobjects = {
            ci = "@class.inner",
            co = "@class.outer",
            fi = "@function.inner",
            fo = "@function.outer",
            ii = "@conditional.inner",
            io = "@conditional.outer",
            li = "@loop.inner",
            lo = "@loop.outer",
        }
        local to_move = require("nvim-treesitter-textobjects.move")
        local to_repeatable = require("nvim-treesitter-textobjects.repeatable_move")
        local to_select = require("nvim-treesitter-textobjects.select")
        local utils_ts = require("utils.treesitter")

        require("nvim-treesitter").install({
            "angular",
            "bash",
            "c_sharp",
            "css",
            "dockerfile",
            "dtd",
            "go",
            "helm",
            "html",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "powershell",
            "proto",
            "python",
            "rust",
            "scheme",
            "scss",
            "sql",
            "terraform",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
        })

        utils_ts.to_move_mapper("c", to_move, textobjects.co)
        utils_ts.to_move_mapper("f", to_move, textobjects.fo)
        utils_ts.to_move_mapper("i", to_move, textobjects.io)
        utils_ts.to_move_mapper("l", to_move, textobjects.lo)
        utils_ts.to_repeatable_mapper(to_repeatable)
        utils_ts.to_select_mapper("ac", to_select, textobjects.co)
        utils_ts.to_select_mapper("af", to_select, textobjects.fo)
        utils_ts.to_select_mapper("ai", to_select, textobjects.io)
        utils_ts.to_select_mapper("al", to_select, textobjects.lo)
        utils_ts.to_select_mapper("ic", to_select, textobjects.ci)
        utils_ts.to_select_mapper("if", to_select, textobjects.fi)
        utils_ts.to_select_mapper("ii", to_select, textobjects.ii)
        utils_ts.to_select_mapper("il", to_select, textobjects.li)
        vim.keymap.set("n", "<a-/>", "gcc", options)
        vim.keymap.set("x", "<a-/>", "gc", options)
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
            version = "main",
        },
    },
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
}
