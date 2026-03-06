return {
	config = function()
		local sections = {
			diagnostics = {
				"diagnostics",
				symbols = {
					error = " ",
					hint = " ",
					info = " ",
					warn = " ",
				},
				update_in_insert = true,
			},
			diff = {
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
			filename = {
				"filename",
				newfile_status = true,
				path = 1,
				symbols = {
					modified = "[]",
					newfile = "[]",
					readonly = "[]",
					unnamed = "[No Name]",
				},
			},
		}

		require("lualine").setup({
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { sections.diff },
				lualine_x = { sections.diagnostics },
				lualine_y = {},
				lualine_z = { sections.filename },
			},
			options = {
				component_separators = {},
				disabled_filetypes = {
					"dap-repl",
					"dapui_breakpoints",
					"dapui_console",
					"dapui_scopes",
					"dapui_stacks",
					"dapui_watches",
					"diff",
					"git",
					"gitsigns-blame",
					"undotree",
					statusline = {},
					winbar = {},
				},
				section_separators = {},
				theme = "everforest",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { sections.diff },
				lualine_x = { sections.diagnostics },
				lualine_y = { "fileformat", "encoding" },
				lualine_z = { sections.filename },
			},
		})
	end,
	defer = true,
	src = "https://github.com/nvim-lualine/lualine.nvim",
}
