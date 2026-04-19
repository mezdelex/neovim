return {
	config = function()
		local oil = require("oil")

		require("nvim-web-devicons").setup({
			override = vim.iter({ "yaml", "yml" }):fold({}, function(acc, next)
				acc[next] = {
					color = "#e67e80",
					cterm_color = "174",
					icon = "",
					name = next,
				}
				return acc
			end),
		})

		oil.setup({
			view_options = { show_hidden = true },
		})

		vim.keymap.set("n", "<leader>o", oil.open)
	end,
	dependencies = {
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	},
	src = "https://github.com/stevearc/oil.nvim",
}
