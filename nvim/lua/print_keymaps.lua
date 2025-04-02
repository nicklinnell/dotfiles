local modes = { n = "Normal", v = "Visual", i = "Insert", t = "Terminal", x = "Visual Block" }

local function print_maps(mode)
	local maps = vim.api.nvim_get_keymap(mode)
	for _, map in ipairs(maps) do
		if map.desc and map.desc ~= "" then
			print(string.format("[%s] %s → %s", modes[mode], map.lhs, map.desc))
		end
	end
end

for _, mode in pairs({ "n", "v", "i", "t", "x" }) do
	print_maps(mode)
end
