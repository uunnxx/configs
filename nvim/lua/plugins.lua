-- vim.cmd [[
-- packadd termdebug
-- packadd matchit
-- packadd shellmenu
-- ]]

vim.g.loaded_synload = 1
vim.g.loaded_matchparen = 1
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2

vim.g.user_emmet_leader_key = "<space><space>"

return require("lazy").setup({
	"nvim-telescope/telescope.nvim",

	-- Diffview
	"sindrets/diffview.nvim",

	{ "tzachar/local-highlight.nvim", opts = {} },

	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },

	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },

	{
		-- Simple winbar/statusline plugin that shows your current code context
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {

			notifier = {
				enabled = true,
				timeout = 3000,
			},
			indent = { enabled = true },
			quickfile = { enabled = true },
			explorer = { enabled = true },
			dashboard = { enabled = true },
			bigfile = { enabled = true },
			scroll = { enabled = true },
			picker = { enabled = true },

			input = { enabled = false },
			scope = { enabled = false },
			words = { enabled = false },
			statuscolumn = { enabled = false },

			styles = {
				notification = {
					-- wo = { wrap = true } -- Wrap notifications
				},
			},
		},
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	-- use {'kdheepak/lazygit.nvim'}

	-- Glow (markdown viewer)
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

	"akinsho/bufferline.nvim",

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Neovim plugin for aligning text
	-- :Align
	"RRethy/nvim-align",

	-- switch and restore fcitx state
	{ "h-hg/fcitx.nvim", lazy = false },

	-- Tagbar
	"majutsushi/tagbar",

	-- Hop alternative for EasyMotion
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "twvxeoqpdygfblzhckisuran" })
		end,
	},

	-- CamelCaseMotion alternative
	"chaoren/vim-wordmotion", -- commented because of neovim slow performance

	---------------------------------------------------------------------------
	-- LSP server and autocompletion
	---------------------------------------------------------------------------

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},

	"neovim/nvim-lspconfig",
	-- lsp installer
	{ "williamboman/mason.nvim" },

	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},

	-- Highlight arguments' definitions and usages, asynchronously, using Treesitter
	{ "m-demare/hlargs.nvim" },

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"gT",
				"<cmd>Trouble<cr>",
				desc = "Trouble",
			},
		},
	},

	---------------------------------------------------------------------------
	-- Autocompletion
	---------------------------------------------------------------------------

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"FelipeLema/cmp-async-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-cmdline",
	"dcampos/nvim-snippy",
	"dcampos/cmp-snippy",
	"SergioRibera/cmp-dotenv",
	"ray-x/cmp-sql",
	{
		"vrslev/cmp-pypi",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "toml",
	},
	"hrsh7th/cmp-calc",

	"onsails/lspkind.nvim",

	-- Text Objects
	-- "kana/vim-textobj-user",
	-- { 'whatyouhide/vim-textobj-erb', ft = {'ruby', 'rb', 'erb'}, },
	-- { "tek/vim-textobj-ruby", ft = {'ruby', 'rb', 'erb'} },
	-- { "nelstrom/vim-textobj-rubyblock", ft = {'ruby', 'rb', 'erb'} },
	-- { "bps/vim-textobj-python", ft = {'python', 'py'} },

	---------------------------------------------------------------------------
	-- FILETYPES
	---------------------------------------------------------------------------

	---------------------------------------------------------------------------
	-- RUBY

	-- { 'vim-ruby/vim-ruby', ft = {'ruby', 'rb', 'erb'} },
	-- { 'tpope/vim-rails', ft = {'ruby', 'rb', 'erb'} },
	-- { 'tpope/vim-rake', ft = {'ruby', 'rb', 'Rakefile', 'rake'} },
	-- { 'tpope/vim-bundler', ft = {'ruby', 'rb', 'erb'} },
	-- { 'slim-template/vim-slim', ft = {'ruby', 'rb', 'erb'} },
	-- { 'stjernstrom/vim-ruby-run', ft = {'ruby', 'rb', 'erb'} },
	-- { 'hallison/vim-ruby-sinatra', ft = {'ruby', 'rb', 'erb'} },

	---------------------------------------------------------------------------
	-- PYTHON
	-- { 'hdima/python-syntax', ft = {'python', 'py'} },
	---------------------------------------------------------------------------
	-- Vlang
	-- { 'cheap-glitch/vim-v', ft = {'vlang', 'v'} },

	---------------------------------------------------------------------------
	-- Elixir
	-- { 'slashmili/alchemist.vim', ft = { "elixir", "eelixir", "exs", "ex" } },
	-- { 'mhinz/vim-mix-format', ft = { "elixir", "eelixir", "exs", "ex" } },
	-- { 'elixir-editors/vim-elixir', ft = { "elixir", "eelixir", "exs", "ex" } },

	---------------------------------------------------------------------------
	-- Crystal
	-- { 'vim-crystal/vim-crystal', ft = {'cr', 'crystal'} },

	---------------------------------------------------------------------------
	-- YAML
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
	},

	---------------------------------------------------------------------------

	-- lua-ls for neovim config
	"folke/neodev.nvim",

	-- Autopair alternative
	-- 'cohama/lexima.vim',

	{ -- configure it with `cmp` and `lsp`
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},

	-- Auto close (x)html tags
	-- { 'alvan/vim-closetag', ft = {'html', 'html5', 'htmldjango', 'xhtml', 'xml'} },
	-- 'AndrewRadev/tagalong.vim'

	-- Vim Table Mode for Markdown
	-- { 'https://github.com/dhruvasagar/vim-table-mode', ft = {'md', 'markdown', 'text'} },

	-- Use `gx` to open github related links as "user/git_repo"
	"gabebw/vim-github-link-opener",

	-- Basic
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file
	{ "stevearc/conform.nvim" },

	-- 'Chiel92/vim-autoformat',
	"tpope/vim-unimpaired",
	-- 'tpope/vim-surround',
	-- 'tpope/vim-repeat',
	-- 'mhinz/vim-startify',

	{
		"mattn/emmet-vim",
		config = function()
			vim.g.user_emmet_install_global = 0
			vim.g.user_emmet_mode = "i"
		end,
		event = "VeryLazy",
		ft = { "html", "css", "erb", "htmldjango", "html5" },
	},

	{ "https://github.com/laytan/cloak.nvim" },
})
