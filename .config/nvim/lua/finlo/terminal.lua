-- all of this augroup stuff is to close the float when it's clicked out of
local augroup = "TerminalCommands"

local Terminal = {}

Terminal.__index = Terminal

function Terminal:new()
	return setmetatable({
		bufnr = nil,
		win_id = nil,
		orientation = nil,
		filetype = "terminal",
	}, self)
end

function Terminal:set_ft()
	local buf = vim.bo[self.bufnr]
	buf.filetype = self.filetype
	buf.buflisted = false
end

function Terminal:close_win()
	if self.closing then
		return
	end

	self.closing = true

	if self.win_id ~= nil and vim.api.nvim_win_is_valid(self.win_id) then
		vim.api.nvim_win_close(self.win_id, true)
	end

	self.win_id = nil
	self.orientation = nil

	self.closing = false
end

--[[
-- look into this later
bufnr = vim.api.nvim_create_buf(false, true)
win_id = vim.api.nvim_open_win(bufnr, true, {...})
term_chan_id = vim.api.nvim_open_term(bufnr)
--]]

function Terminal:open(orientation)
	if orientation ~= "horizontal" and orientation ~= "vertical" and orientation ~= "float" then
		return
	end

	if self.win_id ~= nil and vim.api.nvim_win_is_valid(self.win_id) == false then
		-- the window was closed forcefully and we can reopen it
		self.win_id = nil
		self.orientation = nil
	elseif orientation == self.orientation then
		-- same orientation means toggle this baby off
		self:close_win()
		return
	elseif self.win_id ~= nil and vim.api.nvim_win_is_valid(self.win_id) then
		-- different orientation is open, so close it and reopen
		self:close_win()
	else
	end

	if orientation == "horizontal" then
		vim.cmd("split")

		self.win_id = vim.api.nvim_get_current_win()
		self.orientation = "horizontal"
	elseif orientation == "vertical" then
		vim.cmd("vsplit")

		self.win_id = vim.api.nvim_get_current_win()
		self.orientation = "vertical"
	elseif orientation == "float" then
		local width = math.ceil(math.min(vim.o.columns, math.max(80, vim.o.columns - 20)))
		local height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines - 10)))

		local row = math.ceil(vim.o.lines - height) * 0.5 - 1
		local col = math.ceil(vim.o.columns - width) * 0.5 - 1

		self.win_id = vim.api.nvim_open_win(0, true, {
			relative = "editor",
			row = row,
			col = col,
			width = width,
			height = height,
			style = "minimal", -- might change this... I kinda like the line numbers
			border = "rounded",
		})

		self.orientation = "float"
	end

	if self.bufnr == nil then
		vim.cmd("terminal")
		vim.cmd("startinsert")
		self.bufnr = vim.api.nvim_get_current_buf()

		if self.orientation == "float" then
			-- needs to be called after the float is connected to a buffer
			vim.api.nvim_win_set_option(self.win_id, "winhl", "Normal:MyHighlight")
		end
	else
		vim.api.nvim_win_set_buf(self.win_id, self.bufnr)

		if self.orientation == "float" then
			-- needs to be called after the float is connected to a buffer
			vim.api.nvim_win_set_option(self.win_id, "winhl", "Normal:MyHighlight")
		end
	end

	if vim.bo[self.bufnr] ~= self.filetype then
		self:set_ft()
	end
end

local term = Terminal:new()

local function handle_term_leave()
	if term.orientation == "float" then
        -- close that float!
		term:close_win()
	end
end

local function setup_autocommands()
	vim.api.nvim_create_augroup(augroup, { clear = true })
	local terminal_pattern = { "term://*" }

	vim.api.nvim_create_autocmd("WinLeave", {
		pattern = terminal_pattern,
		group = augroup,
		callback = handle_term_leave,
	})
end

setup_autocommands()

vim.keymap.set("n", "<leader>th", function()
	-- I want to open a terminal in a horizontal split
	term:open("horizontal")
end)

vim.keymap.set("n", "<leader>tv", function()
	term:open("vertical")
end)

vim.keymap.set("n", "<leader>tt", function()
	term:open("float")
end)

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "terminal",
	callback = function(args)
		vim.keymap.set("n", "q", function()
			term:close_win()
		end, { buffer = args.buf, noremap = false })
	end,
})
