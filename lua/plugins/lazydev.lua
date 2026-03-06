return {
	config = function()
		require("lazydev").setup({
			library = { "nvim-treesitter-textobjects" },
		})
	end,
	defer = true,
	src = "https://github.com/folke/lazydev.nvim",
}
