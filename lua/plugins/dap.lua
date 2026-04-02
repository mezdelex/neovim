return {
    config = function()
        local dap = require("dap")
        local dap_ui = require("dap.ui")
        local dotnet_envs = { "Development", "Local", "Production", "Test" }
        local rust_args = {
            { "build" },
            { "test", "--no-run" },
        }
        local utils_dap = require("utils.dap")

        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb", "coreclr", "delve", "python" },
        })

        require("dap-go").setup()
        require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe")
        dap.adapters.codelldb = {
            executable = {
                args = { "--port", "${port}" },
                command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe",
            },
            port = "${port}",
            type = "server",
        }
        dap.configurations.rust = vim.tbl_map(function(_args)
            return {
                cargo = { args = _args },
                name = string.upper(_args[1]),
                program = function()
                    return dap_ui.pick_one(utils_dap.find_files("target/debug/.*%.exe"))
                end,
                request = "launch",
                setupCommands = {
                    { text = '-interpreter-exec console "settings set target.x86-disassembly-flavor none"' },
                },
                type = "codelldb",
            }
        end, rust_args)
        dap.adapters.coreclr = {
            args = { "--interpreter=vscode" },
            command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
            type = "executable",
        }
        dap.configurations.cs = vim.tbl_map(function(_env)
            local config = {
                env = { ASPNETCORE_URLS = "https://localhost:5100;http://localhost:5000" },
                name = string.upper(_env),
                program = function()
                    return dap_ui.pick_one(utils_dap.find_files("bin/Debug/.*%.dll", true))
                end,
                request = "launch",
                type = "coreclr",
            }
            if _env ~= dotnet_envs[3] then
                config.env.ASPNETCORE_ENVIRONMENT = _env
            end

            return config
        end, dotnet_envs)
        require("dap-view").setup({
            auto_toggle = true,
        })

        vim.fn.sign_define("DapBreakpoint", {
            linehl = "debugBreakpoint",
            numhl = "debugBreakpoint",
            text = "",
            texthl = "debugBreakpoint",
        })
        vim.fn.sign_define("DapStopped", {
            linehl = "debugPC",
            numhl = "debugPC",
            text = "",
            texthl = "debugPC",
        })

        vim.keymap.set("n", "<c-h>", dap.step_back)
        vim.keymap.set("n", "<c-j>", dap.step_into)
        vim.keymap.set("n", "<c-k>", dap.step_out)
        vim.keymap.set("n", "<c-l>", dap.step_over)
        vim.keymap.set("n", "<leader>B", dap.terminate)
        vim.keymap.set("n", "<leader>b", dap.continue)
        vim.keymap.set("n", "gb", dap.toggle_breakpoint)
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/igorlfs/nvim-dap-view",
        },
        {
            defer = true,
            src = "https://github.com/jay-babu/mason-nvim-dap.nvim",
        },
        {
            defer = true,
            src = "https://github.com/leoluz/nvim-dap-go",
        },
        {
            defer = true,
            src = "https://github.com/mfussenegger/nvim-dap-python",
        },
        {
            defer = true,
            src = "https://github.com/williamboman/mason.nvim",
        },
    },
    src = "https://github.com/mfussenegger/nvim-dap",
}
