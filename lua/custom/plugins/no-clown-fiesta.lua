return {
	"aktersnurra/no-clown-fiesta.nvim",
	priority = 1000,
	config = function()
		local no_clown = require("no-clown-fiesta")
		no_clown.setup({
			transparent = true,
		})
	end,
}
