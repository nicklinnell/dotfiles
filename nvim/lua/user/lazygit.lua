vim.g.lazygit_floating_window_use_plenary = 0

-- Set Neovim command for opening files in a new tab
vim.g.lazygit_config = {
	os = {
		edit = "nvim --cmd 'tabnew {{filename}}'",
		open = "nvim --cmd 'tabnew {{filename}}'",
	},
}
