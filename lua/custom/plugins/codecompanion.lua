return {
	"olimorris/codecompanion.nvim",
	config = function()
		local default_model = "qwen/qwen3-coder"
		local available_models = {
			"qwen/qwen3-coder",
			"x-ai/grok-code-fast-1",
			"deepseek/deepseek-chat-v3.1",
			"openai/gpt-5",
			"anthropic/claude-sonnet-4",
			"anthropic/claude-opus-4.1",
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
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						-- MCP Tools
						make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
						show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
						add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
						show_result_in_chat = true, -- Show tool results directly in chat buffer
						format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
						-- MCP Resources
						make_vars = true, -- Convert MCP resources to #variables for prompts
						-- MCP Prompts
						make_slash_commands = true, -- Add MCP prompts as /slash commands
					},
				},
			},
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
		"ravitemer/mcphub.nvim",
	},
}
