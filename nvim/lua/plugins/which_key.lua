return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local which_key = require("which-key")

			which_key.setup({
				plugins = {
					marks = true,
					registers = true,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
					presets = {
						operators = true,
						motions = true,
						text_objects = true,
						windows = true,
						nav = true,
						z = true,
						g = true,
					},
				},
				window = {
					border = "rounded",
					padding = { 2, 2, 2, 2 },
				},
				layout = {
					height = { min = 4, max = 25 },
					width = { min = 20, max = 50 },
					spacing = 3,
					align = "center",
				},
				ignore_missing = false,
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
				show_help = true,
				triggers = "auto",
			})

			-- Register all the keymaps that have descriptions
			which_key.register({
				["<leader>"] = {
					f = { name = "Format" },
					g = { name = "Git" },
					h = { name = "Harpoon" },
					l = { name = "LSP" },
					n = { name = "Notifications" },
					o = { name = "Open" },
					r = { name = "Rename/Rotate" },
					s = { name = "Search/Symbols" },
					t = { name = "TypeScript" },
				},
			})
		end,
	},
}
