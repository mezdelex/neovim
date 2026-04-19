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
					unnamed = "[unnamed]",
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
					"AgenticChat",
					"AgenticCode",
					"AgenticDiagnostics",
					"AgenticFiles",
					"AgenticTodos",
					"dap-view",
					"diff",
					"git",
					"gitsigns-blame",
					"nvim-undotree",
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
