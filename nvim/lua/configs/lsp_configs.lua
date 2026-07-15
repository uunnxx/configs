local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- This will watch changed files so I don't have to :LspRestart every fucking time when I created a new fucking file
capabilities.workspace = { didChangeWatchedFiles = { dynamicRegistration = true } }

-- Global LSP UI and Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local opts = { buffer = bufnr }

		require("lsp_signature").on_attach({ bind = true }, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end

		-- on-demand type check (shows in floating window)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	end,
})


vim.diagnostic.config({
	float = { source = true },
	-- virtual_text = {
	--     current_line = true
	-- },
	virtual_lines = {
		current_line = true,
	},
	update_in_insert = false,
	serevity_sort = true,
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			-- [vim.diagnostic.severity.HINT] = " ",
			-- [vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

-- activate all servers
-- local servers = { "clangd", "zls", "beautysh", "basedpyright", "ruff", "dj", "lua_ls", "ty" }
local servers = { "clangd", "zls", "beautysh", "basedpyright", "ruff", "dj", "lua_ls" }
for _, server_name in ipairs(servers) do
	vim.lsp.config(server_name, {
		capabilities = capabilities,
	})

	vim.lsp.enable(server_name)
end
