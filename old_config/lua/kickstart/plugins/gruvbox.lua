return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		--'folke/tokyonight.nvim',
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			--vim.cmd.colorscheme 'tokyonight-night'

			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					-- SignColumn = { bg = "#1d2021" },
					String = { fg = "#b8bb26" },
				},
				dim_inactive = false,
				transparent_mode = true,
			})

			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd.colorscheme("gruvbox")

			-- You can configure highlights by doing something like:
			--vim.cmd.hi 'Comment gui=none'
		end,
	},
}

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	init = function()
-- 		require("tokyonight").setup({
-- 			style = "night", -- The theme comes in three styles, `storm`, `moon`, and `night`.
-- 			light_style = "day", -- The theme is used when the background is set to light
-- 			transparent = true, -- Enable this to disable setting the background color
-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
-- 			styles = {
-- 				-- Style to be applied to different syntax groups
-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = {},
-- 				variables = {},
-- 			},
-- 			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vi
-- 		})
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }

-- vim: ts=2 sts=2 sw=2 et
