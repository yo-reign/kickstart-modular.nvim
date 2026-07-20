return {
	"yo-reign/nvim-flashcards",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		{
			"3rd/image.nvim",
			build = false, -- magick_cli uses the Homebrew ImageMagick executable
			opts = {
				backend = "kitty", -- Ghostty supports the Kitty graphics protocol
				processor = "magick_cli",
				-- Flashcards uses image.nvim's direct API and owns float cleanup.
				integrations = {
					markdown = { enabled = false },
				},
			},
		},
	},
	config = function()
		require("flashcards").setup({
			directories = { "~/notes/" },
			db_path = "~/notes/assets/",
			media = {
				enabled = true,
				roots = { "~/notes/" },
				images = {
					fit = "contain",
					fit_modes = { "contain", "cover", "stretch" },
				},
			},
			ui = {
				keymaps = {
					cycle_image_fit = "i",
				},
			},
			fsrs = {
				target_correctness = 0.95,
			},
		})

		vim.keymap.set("n", "<leader>fcb", ":FlashcardsBrowse<CR>", { desc = "Browse flashcards" })
		vim.keymap.set("n", "<leader>fct", ":FlashcardsTags<CR>", { desc = "Browse flashcard tags" })
		vim.keymap.set("n", "<leader>fcd", ":FlashcardsDue<CR>", { desc = "Browse due flashcards" })
		vim.keymap.set("n", "<leader>fcr", ":FlashcardsReview<CR>", { desc = "Review flashcards" })
		vim.keymap.set("n", "<leader>fcs", ":FlashcardsScan<CR>", { desc = "Scan for new flashcards" })
		vim.keymap.set("n", "<leader>fcS", ":FlashcardsStats<CR>", { desc = "Show flashcard stats" })
		vim.keymap.set("n", "<leader>fco", ":FlashcardsOrphans<CR>", { desc = "Manage orphaned cards" })
	end,
}
