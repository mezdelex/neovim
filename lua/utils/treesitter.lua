---@class Utils.Treesitter.TextObject.Move
---@field goto_previous_start fun(query: string, group: string)
---@field goto_previous_end fun(query: string, group: string)
---@field goto_next_start fun(query: string, group: string)
---@field goto_next_end fun(query: string, group: string)

---@class Utils.Treesitter.TextObject.Repeatable
---@field repeat_last_move_opposite fun()
---@field repeat_last_move fun(opts?: TSTextObjects.MoveOpts)
---@field builtin_F_expr fun()
---@field builtin_T_expr fun()
---@field builtin_f_expr fun()
---@field builtin_t_expr fun()

---@class Utils.Treesitter.TextObject.Select
---@field select_textobject fun(query: string, group: string)

---@private
local textobjects = {
	group = "textobjects",
	mode_nox = { "n", "o", "x" }, ---@type string[]
	mode_ox = { "o", "x" }, ---@type string[]
	options = { expr = true }, ---@type vim.keymap.set.Opts
}

local M = {} ---@class Utils.Treesitter

---@param lhs string
---@param to_move Utils.Treesitter.TextObject.Move
---@param query string
M.to_move_mapper = function(lhs, to_move, query)
	vim.keymap.set(textobjects.mode_nox, "[" .. lhs, function()
		to_move.goto_previous_start(query, textobjects.group)
	end)
	vim.keymap.set(textobjects.mode_nox, "[" .. string.upper(lhs), function()
		to_move.goto_previous_end(query, textobjects.group)
	end)
	vim.keymap.set(textobjects.mode_nox, "]" .. lhs, function()
		to_move.goto_next_start(query, textobjects.group)
	end)
	vim.keymap.set(textobjects.mode_nox, "]" .. string.upper(lhs), function()
		to_move.goto_next_end(query, textobjects.group)
	end)
end
---@param to_repeatable Utils.Treesitter.TextObject.Repeatable
M.to_repeatable_mapper = function(to_repeatable)
	vim.keymap.set(textobjects.mode_nox, ",", to_repeatable.repeat_last_move_opposite)
	vim.keymap.set(textobjects.mode_nox, ";", to_repeatable.repeat_last_move)
	vim.keymap.set(textobjects.mode_nox, "F", to_repeatable.builtin_F_expr, textobjects.options)
	vim.keymap.set(textobjects.mode_nox, "T", to_repeatable.builtin_T_expr, textobjects.options)
	vim.keymap.set(textobjects.mode_nox, "f", to_repeatable.builtin_f_expr, textobjects.options)
	vim.keymap.set(textobjects.mode_nox, "t", to_repeatable.builtin_t_expr, textobjects.options)
end
---@param lhs string
---@param to_select Utils.Treesitter.TextObject.Select
---@param query string
M.to_select_mapper = function(lhs, to_select, query)
	vim.keymap.set(textobjects.mode_ox, lhs, function()
		to_select.select_textobject(query, textobjects.group)
	end)
end

return M
