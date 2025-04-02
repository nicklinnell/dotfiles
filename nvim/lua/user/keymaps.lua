local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local illuminate = require("illuminate")
local utils = require("user.utils")

local M = {}

local TERM = os.getenv("TERM")

-- Normal --
nnoremap("<space>", "<nop>", { desc = "Disable space key to reserve it for leader" })

-- Window + better kitty navigation
nnoremap("<C-j>", function()
	if vim.fn.exists(":KittyNavigateDown") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateDown()
	elseif vim.fn.exists(":NvimTmuxNavigateDown") ~= 0 then
		vim.cmd.NvimTmuxNavigateDown()
	else
		vim.cmd.wincmd("j")
	end
end, { desc = "Navigate to window down (Kitty/Tmux fallback)" })

nnoremap("<C-k>", function()
	if vim.fn.exists(":KittyNavigateUp") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateUp()
	elseif vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
		vim.cmd.NvimTmuxNavigateUp()
	else
		vim.cmd.wincmd("k")
	end
end, { desc = "Navigate to window up (Kitty/Tmux fallback)" })

nnoremap("<C-l>", function()
	if vim.fn.exists(":KittyNavigateRight") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateRight()
	elseif vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
		vim.cmd.NvimTmuxNavigateRight()
	else
		vim.cmd.wincmd("l")
	end
end, { desc = "Navigate to window right (Kitty/Tmux fallback)" })

nnoremap("<C-h>", function()
	if vim.fn.exists(":KittyNavigateLeft") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateLeft()
	elseif vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
		vim.cmd.NvimTmuxNavigateLeft()
	else
		vim.cmd.wincmd("h")
	end
end, { desc = "Navigate to window left (Kitty/Tmux fallback)" })

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { desc = "Save with leader key", silent = false })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { desc = "Quit with leader key", silent = false })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { desc = "Save and quit with leader key", silent = false })

-- Map Oil to <leader>e (currently commented out)
-- nnoremap("<leader>e", function()
-- 	require("oil").toggle_float()
-- end)

-- Map nvim-tree to <leader>e
nnoremap("<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle nvim-tree file [E]xplorer" })

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })
nnoremap("<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
nnoremap("{", "{zz", { desc = "Jump to previous paragraph and center" })
nnoremap("}", "}zz", { desc = "Jump to next paragraph and center" })
nnoremap("N", "Nzz", { desc = "Go to previous search result and center" })
nnoremap("n", "nzz", { desc = "Go to next search result and center" })
nnoremap("G", "Gzz", { desc = "Go to end of file and center" })
nnoremap("gg", "ggzz", { desc = "Go to beginning of file and center" })
nnoremap("<C-i>", "<C-i>zz", { desc = "Jump forward in jump list and center" })
nnoremap("<C-o>", "<C-o>zz", { desc = "Jump backward in jump list and center" })
nnoremap("%", "%zz", { desc = "Jump to matching bracket and center" })
nnoremap("*", "*zz", { desc = "Search for word under cursor and center" })
nnoremap("#", "#zz", { desc = "Reverse search for word under cursor and center" })

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Quick find/replace for word under cursor" })

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
	require("spectre").toggle()
end, { desc = "Toggle [S]pectre for global find/replace" })

-- Open Spectre for global find/replace for the word under the cursor in normal mode
-- TODO Fix, currently being overriden by Telescope
nnoremap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "[S]earch current [W]ord" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$", { desc = "Jump to end of line" })
nnoremap("H", "^", { desc = "Jump to beginning of line" })

-- Press 'U' for redo
nnoremap("U", "<C-r>", { desc = "Redo last change" })

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>", { desc = "Turn off search highlight" })

-- Diagnostics
nnoremap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next diagnostic and center cursor" })

nnoremap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous diagnostic and center cursor" })

nnoremap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next error diagnostic and center cursor" })

nnoremap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous error diagnostic and center cursor" })

nnoremap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next warning diagnostic and center cursor" })

nnoremap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous warning diagnostic and center cursor" })

-- Place all diagnostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Navigate to next qflist item
nnoremap("<leader>cn", ":cnext<cr>zz", { desc = "Next quickfix item and center" })

-- Navigate to previous qflist item
nnoremap("<leader>cp", ":cprevious<cr>zz", { desc = "Previous quickfix item and center" })

-- Open the qflist
nnoremap("<leader>co", ":copen<cr>zz", { desc = "Open quickfix list and center" })

-- Close the qflist
nnoremap("<leader>cc", ":cclose<cr>zz", { desc = "Close quickfix list" })

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>", { desc = "Toggle [M]aximizer" })

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=", { desc = "Equalize split window sizes" })

-- Press leader f to format
nnoremap("<leader>f", ":Format<cr>", { desc = "[F]ormat current buffer" })

-- Press leader rw to rotate open windows
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

-- Press gx to open the link under the cursor
nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true, desc = "Open link under cursor" })

-- TSC autocommand keybind to run TypeScripts tsc
nnoremap("<leader>tc", ":TSC<cr>", { desc = "[T]ypeScript [C]ompile" })

-- Harpoon keybinds --
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end, { desc = "[H]arpoon: [O]pen/Toggle quick menu" })

nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end, { desc = "[H]arpoon: [A]dd current file" })

nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end, { desc = "[H]arpoon: [R]emove current file" })

nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end, { desc = "[H]arpoon: [C]lear all marks" })

nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end, { desc = "[H]arpoon: Jump to file 1" })

nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end, { desc = "[H]arpoon: Jump to file 2" })

nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end, { desc = "[H]arpoon: Jump to file 3" })

nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end, { desc = "[H]arpoon: Jump to file 4" })

nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end, { desc = "[H]arpoon: Jump to file 5" })

-- Git keymaps --
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle [G]it [B]lame for current line" })
nnoremap("<leader>gf", function()
	local cmd = {
		"sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
	}

	if not utils.is_git_directory() then
		vim.notify(
			"Current project is not a git directory",
			vim.log.levels.WARN,
			{ title = "Telescope Git Files", git_command = cmd }
		)
	else
		require("telescope.builtin").git_files()
	end
end, { desc = "Search [G]it [F]iles" })

-- Telescope keybinds --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })
nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [C]ommands" })

nnoremap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [S]pelling suggestions" })

-- LSP Keybinds (to be used in ../../after/plugin/lsp.lua for the current buffer)
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap exists
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

-- Symbol Outline keybind
nnoremap("<leader>so", ":SymbolsOutline<cr>", { desc = "Toggle [S]ymbol [O]utline" })

-- Vim Illuminate keybinds
nnoremap("<leader>]", function()
	illuminate.goto_next_reference()
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto next reference" })

nnoremap("<leader>[", function()
	illuminate.goto_prev_reference()
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto previous reference" })

-- Open Copilot panel
nnoremap("<leader>oc", function()
	require("copilot.panel").open({})
end, { desc = "[O]pen [C]opilot panel" })

-- Fugitive: diff changes since last commit
nnoremap("<leader>gv", "<cmd>Gvdiffsplit!<cr>", { desc = "[G]it [V]ertical Diff since last commit" })
nnoremap("<leader>gq", "<cmd>Git difftool --name-only HEAD | copen<cr>", { desc = "[G]it changes to [Q]uickfix list" })

-- nvim-ufo keybinds
nnoremap("zR", require("ufo").openAllFolds, { desc = "Open all folds" })
nnoremap("zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- Insert --
inoremap("jj", "<esc>", { desc = "Map 'jj' to escape in insert mode" })

-- Visual --
vnoremap("<space>", "<nop>", { desc = "Disable space in visual mode" })
vnoremap("L", "$<left>", { desc = "Move to end of line in visual mode" })
vnoremap("H", "^", { desc = "Move to beginning of line in visual mode" })
xnoremap("<leader>p", '"_dP', { desc = "Paste without overwriting register" })
vnoremap("<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vnoremap("<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
xnoremap("<<", function()
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end, { desc = "Indent left and reselect visual block" })
xnoremap(">>", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end, { desc = "Indent right and reselect visual block" })

-- Terminal --
tnoremap("<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
tnoremap("jj", [[<C-\><C-n>]], { desc = "Exit terminal mode with 'jj'" })
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal: move to left window" })
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal: move to lower window" })
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal: move to upper window" })
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal: move to right window" })
tnoremap("<space>", "<space>", { desc = "Re-enable space in terminal mode" })

return M
