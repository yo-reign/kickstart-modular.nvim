return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-telekasten/calendar-vim" },
	config = function()
		require("telekasten").setup({
			home = vim.fn.expand("~/zettelkasten"),
		})
	end,
}
