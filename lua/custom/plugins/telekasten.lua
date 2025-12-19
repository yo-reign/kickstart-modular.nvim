return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-telekasten/calendar-vim" },
	config = function()
		require("telekasten").setup({
			home = vim.fn.expand("~/zettelkasten"),
		})

		vim.keymap.set("n", "<leader>zkp", ":Telekasten panel<CR>", { desc = "Open telekasten panel" })
		vim.keymap.set("n", "<leader>zkfg", ":Telekasten search_notes<CR>", { desc = "Grep inside zettelkasten notes" })
		vim.keymap.set(
			"n",
			"<leader>zkn",
			":Telekasten new_templated_note<CR>",
			{ desc = "Create new templated zettelkasten note" }
		)
		vim.keymap.set("n", "<leader>zkff", ":Telekasten find_notes<CR>", { desc = "Find zettelkasten notes" })
		vim.keymap.set(
			"n",
			"<leader>zkfr",
			":Telekasten find_friends<CR>",
			{ desc = "Find related (friend) zettelkasten notes" }
		)
		vim.keymap.set("n", "<leader>zkfl", ":Telekasten follow_link<CR>", { desc = "Follow telekasten link" })
		vim.keymap.set("n", "<leader>zkbl", ":Telekasten show_backlinks<CR>", { desc = "Show telekasten backlinks" })
		vim.keymap.set("n", "<leader>zkt", ":Telekasten show_tags<CR>", { desc = "Show telekasten tags" })
		vim.keymap.set("n", "<leader>zkc", ":Telekasten show_calendar<CR>", { desc = "Show telekasten calendar" })
		vim.keymap.set("n", "<leader>zky", ":Telekasten yank_notelink<CR>", { desc = "Yank telekasten notelink" })
	end,
}
