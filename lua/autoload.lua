local M = {}

function M.scan(dirName, noDirs)
	local home = os.getenv("HOME")
	local path = home .. "/.config/nvim/lua" .. (dirName or "")
	local files = vim.split(vim.fn.glob(path .. "/*"), "\n")
	local names = {}
	for _, file in ipairs(files) do
		if vim.fn.isdirectory(file) == 1 or noDirs then
			local startIndex, endIndex = string.find(file, "/[A-z%.]+$")
			if startIndex and endIndex then
				local name = string.sub(file, startIndex + 1, endIndex + 1)
				table.insert(names, name)
			end
		end
	end
	return names
end

function M.load()
	local dirs = M.scan()
	for _, dir in ipairs(dirs) do
		local files = M.scan("/" .. dir, true)
		for _, file in ipairs(files) do
			file, _ = string.gsub(file, "%.lua", "")
			require(dir .. "." .. file)
		end
	end
end

return M
