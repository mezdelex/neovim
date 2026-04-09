---@class Utils.Dap.Adapter
---@field type string

---@class Utils.Dap.Adapter.CodeLLDB.Executable
---@field args string[]
---@field command string

---@class Utils.Dap.Adapter.CodeLLDB : Utils.Dap.Adapter
---@field executable Utils.Dap.Adapter.CodeLLDB.Executable
---@field port string

---@class Utils.Dap.Adapter.CoreCLR : Utils.Dap.Adapter
---@field args string[]
---@field command string

---@class Utils.Dap.Configuration
---@field name string
---@field program fun()
---@field request string
---@field type string

---@class Utils.Dap.Configuration.Rust.Cargo
---@field args string[]

---@class Utils.Dap.Configuration.Rust.SetupCommand
---@field text string

---@class Utils.Dap.Configuration.Rust : Utils.Dap.Configuration
---@field cargo Utils.Dap.Configuration.Rust.Cargo
---@field setupCommands Utils.Dap.Configuration.Rust.SetupCommand[]

---@class Utils.Dap.Configuration.Dotnet.Env
---@field name string
---@field value string

---@class Utils.Dap.Configuration.Dotnet : Utils.Dap.Configuration
---@field environment Utils.Dap.Configuration.Dotnet.Env[]

local M = {} ---@class Utils.Dap

---@param pattern string
---@param filter boolean?
---@return string[]
function M.find_files(pattern, filter)
    local cwd = vim.fs.normalize(vim.fn.getcwd())

    return vim.fs.find(function(_file_name, _path)
        local file_path = vim.fs.joinpath(_path, _file_name)
        if not file_path:match(pattern) then
            return false
        end

        if filter and not vim.uv.fs_stat(vim.fs.joinpath(_path, vim.fn.fnamemodify(_file_name, ":r") .. ".exe")) then
            return false
        end

        return true
    end, {
        limit = math.huge,
        path = cwd,
        type = "file",
    })
end

return M
