local dbui_connections = vim.fn.expand(".dbui_connections.lua")
if vim.fn.filereadable(dbui_connections) == 1 then
	dofile(dbui_connections)
end
