return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- Your configuration with defaults goes here
			-- No special config needed as the plugin has good defaults
		},
		config = function()
			local wk = require("which-key")
			wk.setup()

			-- Register leader key groups using the new recommended spec format
			wk.register({
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "format" },
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "harpoon" },
				{ "<leader>l", group = "lsp" },
				{ "<leader>n", group = "notifications" },
				{ "<leader>o", group = "open" },
				{ "<leader>q", group = "quit/quickfix" },
				{ "<leader>r", group = "rename/rotate" },
				{ "<leader>s", group = "search/symbols" },
				{ "<leader>t", group = "typescript" },
			})
		end,
	},
}
