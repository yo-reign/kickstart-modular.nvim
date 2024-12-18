return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<S-Tab>",
			},
			color = {
				suggestion_color = "#83a598",
				cterm = 109,
			},
			log_level = "off", -- set to 'off' to disable logging
		})
	end,
}
