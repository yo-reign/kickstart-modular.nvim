return {
	"https://git.sr.ht/~swaits/colorsaver.nvim",
	lazy = true,
	event = "VimEnter",
	dependencies = {
		"chriskempson/base16-vim",
		"slugbyte/lackluster.nvim",
	},
	opts = {
		-- log_level: Sets the logging level for the module's output.
		-- Acceptable values are "debug", "info", "warn", "error".
		log_level = "warn",

		-- debounce_ms: Sets the debounce time in milliseconds for file watching.
		-- Accepts any integer greater than or equal to 50. If experiencing issues,
		-- consider increasing this value.
		debounce_ms = 100,

		-- filename: The name of the file where the colorscheme will be saved.
		-- Note that the file is always stored in the "data" directory, which is
		-- usually ~/.local/share/nvim/
		filename = "colorsaver",

		-- auto_load: If true, any colorscheme changes from one instance of nvim
		-- will be automatically loaded by all other instances of nvim.
		auto_load = true,
	},
}
