-- pip install ruff-lsp
return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
	init_options = {
		settings = {
			lint = {
				severity = {
					F401 = "hint",
					E402 = 4,
				},
				-- ignore = { 'F401' },
				ignore = { 'E402' },
				enabled = true,
			},
			format = { enabled = true },
		},
	},
}
