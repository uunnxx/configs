return {
	"Aasim-A/scrollEOF.nvim",
	event = { "CursorMoved", "WinScrolled" },
	opts = {
		pattern = "*",
		-- Whether or not scrollEOF should be enabled in insert mode
		insert_mode = true,
		-- Whether or not scrollEOF should be enabled in floating windows
		floating = true,
		-- List of filetypes to disable scrollEOF for.
		disabled_filetypes = { "terminal" },
		-- List of modes to disable scrollEOF for. see https://neovim.io/doc/user/builtin.html#mode()
		disabled_modes = { "t", "nt" },
	},
}
