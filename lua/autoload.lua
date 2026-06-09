local M = {}

M.requires = {}
M.preloads = {}
M.postloads = {}
M.ignores = {"autoload"}

function M.scan(dirName)
	local files = vim.fn.readdir(dirName)

	for _, file in ipairs(files) do
		local path = dirName .. "/" .. file
		local stat = vim.uv.fs_stat(path)

		if stat.type == "directory" then
			M.scan(path, reqName)
		else
			if string.find(path, "%.lua") then
				table.insert(M.requires, path)
				vim.notify(path)
			end
		end

	end
end

return M
