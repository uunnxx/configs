return {
	"olrtg/nvim-emmet",
    lazy = false,
	config = function()
		vim.keymap.set({ "n", "v" }, "<space><space><leader>", require("nvim-emmet").wrap_with_abbreviation)
	end,
}
