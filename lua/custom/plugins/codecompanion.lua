return {
	"olimorris/codecompanion.nvim",
	config = function()
		local default_model = "z-ai/glm-4.6:exacto"
		local available_models = {
			"x-ai/grok-code-fast-1",
			"z-ai/glm-4.6:exacto",
			"qwen/qwen3-coder",
			"openai/gpt-5-mini",
			"deepseek/deepseek-chat-v3.1",
			"anthropic/claude-haiku-4.5",
			"openai/gpt-5",
			"anthropic/claude-sonnet-4.5",
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
				history = {
					enabled = true,
					opts = {
						-- Keymap to open history from chat buffer (default: gh)
						keymap = "gh",
						-- Keymap to save the current chat manually (when auto_save is disabled)
						save_chat_keymap = "sc",
						-- Save all chats by default (disable to save only manually using 'sc')
						auto_save = true,
						-- Number of days after which chats are automatically deleted (0 to disable)
						expiration_days = 30,
						-- Picker interface (auto resolved to a valid picker)
						picker = "telescope", --- ("telescope", "snacks", "fzf-lua", or "default")
						---Optional filter function to control which chats are shown when browsing
						chat_filter = nil, -- function(chat_data) return boolean end
						-- Customize picker keymaps (optional)
						picker_keymaps = {
							rename = { n = "r", i = "<M-r>" },
							delete = { n = "d", i = "<M-d>" },
							duplicate = { n = "<C-y>", i = "<C-y>" },
						},
						---Automatically generate titles for new chats
						auto_generate_title = true,
						title_generation_opts = {
							---Adapter for generating titles (defaults to current chat adapter)
							adapter = nil, -- "copilot"
							---Model for generating titles (defaults to current chat model)
							model = nil, -- "gpt-4o"
							---Number of user prompts after which to refresh the title (0 to disable)
							refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
							---Maximum number of times to refresh the title (default: 3)
							max_refreshes = 3,
							format_title = function(original_title)
								-- this can be a custom function that applies some custom
								-- formatting to the title.
								return original_title
							end,
						},
						---On exiting and entering neovim, loads the last chat on opening chat
						continue_last_chat = false,
						---When chat is cleared with `gx` delete the chat from history
						delete_on_clearing_chat = false,
						---Directory path to save the chats
						dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
						---Enable detailed logging for history extension
						enable_logging = false,

						-- Summary system
						summary = {
							-- Keymap to generate summary for current chat (default: "gcs")
							create_summary_keymap = "gcs",
							-- Keymap to browse summaries (default: "gbs")
							browse_summaries_keymap = "gbs",

							generation_opts = {
								adapter = nil, -- defaults to current chat adapter
								model = nil, -- defaults to current chat model
								context_size = 90000, -- max tokens that the model supports
								include_references = true, -- include slash command content
								include_tool_outputs = true, -- include tool execution results
								-- custom system prompt (string or function)
								system_prompt = [[
								You a proffesional coding assistant trained on perfomant styles from the  likes of people like Case Muratori, Jonathan Blow, John Carmack, and many others.
								who focus on performance and code quality. They all are great at writing performant code and they all write some type of data oriented design (DOD) code.
								At the same time don't try to be too clever, keep things simple and readable when they can be.
								]],
								format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
							},
						},

						-- Memory system (requires VectorCode CLI)
						memory = {
							-- Automatically index summaries when they are generated
							auto_create_memories_on_summary_generation = true,
							-- Path to the VectorCode executable
							vectorcode_exe = "vectorcode",
							-- Tool configuration
							tool_opts = {
								-- Default number of memories to retrieve
								default_num = 10,
							},
							-- Enable notifications for indexing progress
							notify = true,
							-- Index all existing memories on startup
							-- (requires VectorCode 0.6.12+ for efficient incremental indexing)
							index_on_startup = false,
						},
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
		"ravitemer/codecompanion-history.nvim",
	},
}
