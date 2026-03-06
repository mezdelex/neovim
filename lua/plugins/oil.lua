return {
	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = { show_hidden = true },
		})

		vim.keymap.set("n", "<leader>o", oil.open)
	end,
	dependencies = {
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
	},
	src = "https://github.com/stevearc/oil.nvim",
}
