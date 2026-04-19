return {
	config = function()
		local everforest = require("everforest")

		everforest.setup({
			disable_italic_comments = true,
			italics = false,
		})

		everforest.load()
	end,
	src = "https://github.com/neanias/everforest-nvim",
}
