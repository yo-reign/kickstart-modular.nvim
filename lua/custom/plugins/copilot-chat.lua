return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = false, -- Enable debug logging
			proxy = nil, -- [protocol://]host[:port] Use this proxy
			allow_insecure = false, -- Allow insecure server connections

			--system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
			model = "o3-mini", -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
			temperature = 0.1, -- GPT temperature

			question_header = "## User ", -- Header to use for user questions
			answer_header = "## Copilot ", -- Header to use for AI answers
			error_header = "## Error ", -- Header to use for errors
			separator = "───", -- Separator to use in chat

			show_folds = true, -- Shows folds for sections in chat
			show_help = true, -- Shows help message as virtual lines when waiting for user input
			auto_follow_cursor = true, -- Auto-follow cursor in chat
			auto_insert_mode = true, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
			clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
			highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

			context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
			callback = nil, -- Callback to use when ask response is received

			-- default window options
			window = {
				layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
				width = 0.4, -- fractional width of parent, or absolute width in columns when > 1
				height = 0.4, -- fractional height of parent, or absolute height in rows when > 1
				-- Options below only apply to floating windows
				relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
				border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				row = nil, -- row position of the window, default is centered
				col = nil, -- column position of the window, default is centered
				title = "Copilot Chat", -- title of chat window
				footer = nil, -- footer of chat window
				zindex = 1, -- determines if window is on top or below other floating windows
			},

			-- default mappings
			mappings = {
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<Tab>",
				},
				close = {
					normal = "q",
					insert = "<C-c>",
				},
				reset = {
					normal = "<C-l>",
					insert = "<C-l>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-m>",
				},
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},
				yank_diff = {
					normal = "gy",
				},
				show_diff = {
					normal = "gd",
				},
				show_info = {
					normal = "gp",
				},
				show_context = {
					normal = "gs",
				},
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
		config = function(_, opts)
			require("CopilotChat").setup(opts)

			vim.keymap.set("n", "<leader>cc", "<cmd>:CopilotChatToggle<CR>")
			vim.keymap.set("v", "<leader>cc", "<cmd>:CopilotChatToggle<CR>")
			vim.keymap.set("v", "<leader>ce", "<cmd>:CopilotChatExplain<CR>")
			vim.keymap.set("v", "<leader>cd", "<cmd>:CopilotChatDocs<CR>")
			vim.keymap.set("v", "<leader>cf", "<cmd>:CopilotChatFix<CR>")
		end,
	},
}
