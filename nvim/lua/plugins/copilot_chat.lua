local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	-- Keep the original GitHub Copilot plugin for completion
	{
		"github/copilot.vim",
		lazy = false,
	},

	-- Add the CopilotChat plugin
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		build = "make tiktoken",
		dependencies = {
			{ "github/copilot.vim" }, -- Official GitHub Copilot plugin
			{ "nvim-lua/plenary.nvim" }, -- Required dependency
			{ "nvim-telescope/telescope.nvim" }, -- For UI integration
		},
		opts = {
			question_header = "## Nick ",
			answer_header = "## Copilot ",
			error_header = "## Error ",
			separator = "---",
			debug = false, -- Set to true to enable debug logging
			model = "claude-3.7-sonnet", -- Default model to use
			temperature = 0.1, -- Response temperature
			show_user_selection = true, -- Show user selection in chat
			context = "buffers", -- Context mode for chat (defaults to taking content from current buffers)
			prompts = prompts,
			window = {
				width = 0.3, -- Width of the chat window
				height = 0.5, -- Height of the chat window
				border = "rounded", -- Border style for the chat window
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)
		end,
	},
}
