vim.keymap.set("n", "<CR>", function()
	local changed = false
	if not vim.opt_local.splitright:get() then
		vim.opt_local.splitright = true
		changed = true
	end
	vim.cmd("Rest run")
	if changed then
		vim.opt_local.splitright = false
	end
end, {
	buffer = 0,
	desc = "запуск Rest run из ftplugin",
})
