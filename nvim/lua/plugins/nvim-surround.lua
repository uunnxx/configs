-- return {
-- 	"kylechui/nvim-surround",
-- 	version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
-- 	event = "VeryLazy",
-- 	config = function()
-- 		require("nvim-surround").setup({
-- 			-- Configuration here, or leave empty to use defaults
-- 		})
-- 	end,
-- }

return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		vim.g.nvim_surround_no_mappings = true

		vim.keymap.set("n", "m", "<Plug>(nvim-surround-normal)", { desc = "Add surround" })
		-- vim.keymap.set("n", "mm", "<Plug>(nvim-surround-normal-cur)", { desc = "Add surround around line" })
		vim.keymap.set("n", "mS", "<Plug>(nvim-surround-normal-line)", { desc = "Add surround on new lines" })
		vim.keymap.set("n", "mSS", "<Plug>(nvim-surround-normal-cur-line)", { desc = "Add surround current line on new lines" })
		vim.keymap.set("x", "m", "<Plug>(nvim-surround-visual)", { desc = "Add surround visual" })
		-- vim.keymap.set("x", "mm", "<Plug>(nvim-surround-visual-line)", { desc = "Add surround visual on new lines" })
		vim.keymap.set("n", "md", "<Plug>(nvim-surround-delete)", { desc = "Delete surround" })
		vim.keymap.set("n", "mc", "<Plug>(nvim-surround-change)", { desc = "Change surround" })
		vim.keymap.set("n", "mC", "<Plug>(nvim-surround-change-line)", { desc = "Change surround on new lines" })
	end,
}
