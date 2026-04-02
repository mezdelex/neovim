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
