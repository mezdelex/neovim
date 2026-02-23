---@private
---@param dir string
---@param latest_file? string
---@param latest_time number
---@return string?, number
local function scan_dir(dir, latest_file, latest_time)
    if not vim.uv.fs_stat(dir) then
        return latest_file, latest_time
    end

    local files = vim.fs.find(function(name)
        if name:match("^System") then
            return false
        end

        return name:match("%.dll$") or name:match("%.exe$")
    end, {
        limit = math.huge,
        path = dir,
        type = "file",
    })

    for _, file in ipairs(files) do
        local stat = vim.uv.fs_stat(file)

        if stat and stat.mtime.sec > latest_time then
            latest_file = file
            latest_time = stat.mtime.sec
        end
    end

    return latest_file, latest_time
end

local M = {} ---@class Utils.Dap

---@param base_paths string[]
---@return string
function M.find_file_or_default(base_paths)
    local cwd = vim.uv.cwd()
    local latest_file, latest_time = nil, 0

    for _, path in ipairs(base_paths) do
        latest_file, latest_time = scan_dir(vim.fs.joinpath(cwd, path), latest_file, latest_time)
    end

    return latest_file or vim.fs.joinpath(cwd, base_paths[1])
end

return M
