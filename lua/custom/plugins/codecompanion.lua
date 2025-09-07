return {
	"olimorris/codecompanion.nvim",
	config = function()
		local default_model = "qwen/qwen3-coder"
		local available_models = {
			"qwen/qwen3-coder",
			"deepseek/deepseek-chat-v3.1",
			"z-ai/glm-4.5-air",
			"openai/gpt-5",
			"anthropic/claude-sonnet-4",
		}
		local current_model = default_model

		local function select_model()
			vim.ui.select(available_models, {
				prompt = "Select  Model:",
			}, function(choice)
				if choice then
					current_model = choice
					vim.notify("Selected model: " .. current_model)
				end
			end)
		end

		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "openrouter",
					keymaps = {
						send = {
							modes = { n = "<CR>" },
							description = "Send",
							callback = function(chat)
								chat:apply_model(current_model)
								chat:submit()
							end,
						},
					},
				},
				inline = {
					adapter = "openrouter",
				},
			},
			adapters = {
				http = {
					openrouter = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://openrouter.ai/api",
								api_key = "OPENROUTER_API_KEY",
								chat_url = "/v1/chat/completions",
							},
							schema = {
								model = {
									default = current_model,
								},
							},
						})
					end,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ck", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		vim.keymap.set(
			{ "n", "v" },
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set("v", "<leader>ctx", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>cs", select_model, { desc = "Select Model" })
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
