-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
--vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
--vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
--vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
--vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- NOTE: instead of the above, we will control navigation with plugin: zellij.lua

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- CUSTOM --
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>", { desc = "[T]oggle [S]pell check" })

-- Mapping <leader>y to yank into the system clipboard:
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Move between diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Toggle between gruvbox and tokyonight colorschemes
vim.keymap.set("n", "<leader>tc", function()
	if vim.g.colors_name == "gruvbox" then
		vim.cmd("colorscheme tokyonight")
	else
		vim.cmd("colorscheme gruvbox")
	end
end, { desc = "Toggle between Gruvbox and Tokyonight colorschemes" })

-- Save buffer (without formatting)
vim.keymap.set("n", "<leader>bw", ":noautocmd write<CR>", { desc = "Save buffer (without formatting)" })

-- Toggle between 2 and 4 tab settings
vim.keymap.set("n", "<leader>tt", function()
	if vim.bo.shiftwidth == 2 then
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
	else
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end
	print("Tab settings: shiftwidth=" .. vim.bo.shiftwidth .. ", tabstop=" .. vim.bo.tabstop)
end, { desc = "[T]oggle [T]ab size" })

-- vim: ts=2 sts=2 sw=2 et
