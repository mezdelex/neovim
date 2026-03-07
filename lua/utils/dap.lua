local M = {} ---@class Utils.Dap

---@param base_paths string[]
---@return string
function M.find_file_or_default(base_paths)
    local cwd = vim.uv.cwd()
    local latest_file, latest_time = nil, 0

    ---@private
    ---@param _dir string
    local function scan_dir(_dir)
        if not vim.uv.fs_stat(_dir) then
            return
        end

        local files = vim.fs.find(function(_name, _path)
            if _path:match("System") then
                return false
            end

            return _name:match("%.dll$") or _name:match("%.exe$")
        end, {
            limit = math.huge,
            path = _dir,
            type = "file",
        })

        for _, file in ipairs(files) do
            local stat = vim.uv.fs_stat(file)

            if stat and stat.mtime.sec > latest_time then
                latest_file = file
                latest_time = stat.mtime.sec
            end
        end
    end

    for _, path in ipairs(base_paths) do
        scan_dir(vim.fs.joinpath(cwd, path))
    end

    return latest_file or vim.fs.joinpath(cwd, base_paths[1])
end

return M
