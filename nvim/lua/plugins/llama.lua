return {
	"ggml-org/llama.vim",
	init = function()
		vim.g.llama_config = {
			endpoint_fim = "http://127.0.0.1:8012/infill",
			endpoint_inst = "http://127.0.0.1:8012/v1/chat/completions",
			auto_fim = false,
			show_info = false,
			n_prefix = 256, -- Lines of prefix context
			n_suffix = 64, -- Lines of suffix context
			-- stop_strings = {
			-- 	"\nclass",
			-- 	"\ndef",
			-- 	"assert",
			-- 	"<|file_sep|>",
			-- 	"<|endoftext|>",
			-- 	"<|im_end|>",
			-- },
			-- custom keymaps
			keymap_fim_trigger = "<leader>llf",
			keymap_fim_accept_line = "<C-Space>",
			keymap_fim_accept_full = "<S-Space>",
			keymap_fim_accept_word = "<leader>ll]",

			keymap_inst_trigger = "<space>li",
			keymap_inst_retry = "<space>lr",
			keymap_inst_continue = "<space>lc",
			keymap_inst_accept = "<C-Space>",
			keymap_inst_cancel = "<Esc>",
		}
	end,
}
