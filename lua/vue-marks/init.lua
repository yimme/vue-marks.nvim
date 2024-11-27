-- lua/vue-marks/init.lua

local M = {}

function M.setup(opts)
	opts = opts or {}

	local function mark_vue_tags()
		local current_pos = vim.api.nvim_win_get_cursor(0)

		local script_line = vim.fn.search("<script", "nw")
		if script_line > 0 then
			vim.api.nvim_buf_set_mark(0, "s", script_line, 0, {})
		end

		local template_line = vim.fn.search("<template", "nw")
		if template_line > 0 then
			vim.api.nvim_buf_set_mark(0, "t", template_line, 0, {})
		end

		local style_line = vim.fn.search("<style", "nw")
		if style_line > 0 then
			vim.api.nvim_buf_set_mark(0, "c", style_line, 0, {})
		end

		vim.api.nvim_win_set_cursor(0, current_pos)
	end

	vim.api.nvim_create_user_command("VueMarkTags", mark_vue_tags, {})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "vue",
		callback = mark_vue_tags,
	})
end

return M
