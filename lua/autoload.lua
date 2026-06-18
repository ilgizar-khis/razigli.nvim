local M = {}

M.require = {}
M.preload = {}
M.postload = {}
M.ignore = { ["autoload"] = true }

function M.scan(dirName)
	local files = vim.fn.readdir(dirName)

	for _, file in ipairs(files) do
		local path = dirName .. "/" .. file
		local stat = vim.uv.fs_stat(path)

		if stat.type == "directory" then
			M.scan(path)
		else
			if string.find(path, "%.lua") then
				table.insert(M.require, path)
			end
		end
	end
end

function M.parse(file, path)
	file = string.match(file, path .. "/(.+)%.lua")
	file = string.gsub(file, "/", "%.")
	return file
end

function M.load()
	local filePath = debug.getinfo(1, "S").source:sub(2)
	local path = string.match(filePath, "(.+)/autoload.lua")
	M.scan(path)

	for file, enabled in pairs(M.preload) do
		if enabled then
			require(file)
		end
	end

	for _, file in ipairs(M.require) do
		file = M.parse(file, path)
		if M.preload[file] or M.postload[file] or M.ignore[file] then
			goto continue
		end
		require(file)
		::continue::
	end

	for file, enabled in pairs(M.postload) do
		if enabled then
			require(file)
		end
	end
end

return M
