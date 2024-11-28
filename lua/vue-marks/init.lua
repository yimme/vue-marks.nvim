-- lua/vue-marks/init.lua

local M = {}

local default_config = {
	marks = {
		script = "s",
		template = "t",
		style = "c",
	},
	auto_mark = true,
}

function M.setup(opts)
	local config = vim.tbl_deep_extend("force", default_config, opts or {})

	local function mark_vue_tags()
		local current_pos = vim.api.nvim_win_get_cursor(0)

		local script_line = vim.fn.search("<script", "nw")
		if script_line > 0 then
			vim.api.nvim_buf_set_mark(0, config.marks.script, script_line, 0, {})
		end

		local template_line = vim.fn.search("<template", "nw")
		if template_line > 0 then
			vim.api.nvim_buf_set_mark(0, config.marks.template, template_line, 0, {})
		end

		local style_line = vim.fn.search("<style", "nw")
		if style_line > 0 then
			vim.api.nvim_buf_set_mark(0, config.marks.style, style_line, 0, {})
		end

		vim.api.nvim_win_set_cursor(0, current_pos)
	end

	vim.api.nvim_create_user_command("VueMarkTags", mark_vue_tags, {})

	if config.auto_mark then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "vue",
			callback = mark_vue_tags,
		})
	end
end

return M
