local M = {} ---@class Utils.Dap

---@param pattern string
---@param helper string?
---@return string
function M.find_file_or_default(pattern, helper)
    local cwd = vim.fs.normalize(vim.fn.getcwd())
    local latest_file, latest_time = nil, 0 ---@type string?, number

    vim.fs.find(function(_file_name, _path)
        local file_path = vim.fs.joinpath(_path, _file_name)
        if not file_path:match(pattern) then
            return false
        end

        if helper then
            local current, found = file_path, false
            repeat
                current = vim.fs.dirname(current)
                if vim.uv.fs_stat(vim.fs.joinpath(current, helper)) then
                    found = true
                    break
                end
            until current == cwd
            if not found then
                return false
            end
        end

        local stat = vim.uv.fs_stat(file_path)
        if stat and stat.mtime.sec > latest_time then
            latest_file = file_path
            latest_time = stat.mtime.sec
        end

        return false
    end, {
        path = cwd,
        type = "file",
    })

    return latest_file or cwd
end

return M
