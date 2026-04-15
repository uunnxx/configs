local M = {}

M.commands = {}

function M.add_command(cmd)
	table.insert(M.commands, cmd)
end

function M.show_commands()
	-- 1. Calculate max lengths for clean column alignment
	local max_name, max_keys = 0, 0
	for _, cmd in ipairs(M.commands) do
		max_name = math.max(max_name, #cmd.name)
		max_keys = math.max(max_keys, cmd.keys ~= "" and #cmd.keys or 0)
	end

	local name_fmt = "%-" .. (max_name + 10) .. "s"
	local keys_fmt = "%-" .. (max_keys + 10) .. "s"

	local items = {}
	for _, cmd in ipairs(M.commands) do
		-- 2. Build a searchable string from all relevant fields
		local search_parts = { cmd.name }
		if cmd.keys and cmd.keys ~= "" then
			table.insert(search_parts, cmd.keys)
		end

		-- if type(cmd.action) == "string" then
		-- 	table.insert(search_parts, cmd.action)
		-- end

		table.insert(items, {
			text = table.concat(search_parts, " "), -- 🔍 Used by Snacks for fuzzy matching
			name = cmd.name,
			keys = cmd.keys or "",
			action = cmd.action,
		})
	end

	Snacks.picker({
		title = "COMMAND PALETTE",
		sort_lastused = true,
		layout = { preset = "default", preview = false },
		sort = { fields = { "name" } },
		items = items,

		format = function(item)
			local keys_display = item.keys ~= "" and item.keys or "  "
			local action_display = type(item.action) == "string" and item.action or "<function>"
			return {
				{ string.format(name_fmt, item.name), "SnacksPickerLabel" },
				{ string.format(keys_fmt, keys_display), "SnacksPickerComment" },
				{ action_display, "SnacksPickerComment" },
			}
		end,

		confirm = function(picker, item)
			picker:close()
			vim.schedule(function()
				local action = item.action
				if type(action) == "string" then
					if action:sub(1, 1) == ":" then
						vim.cmd(action:sub(2))
					else
						vim.api.nvim_input(vim.api.nvim_replace_termcodes(action, true, true, true))
					end
				elseif type(action) == "function" then
					action()
				end
			end)
		end,
	})
end

return M
