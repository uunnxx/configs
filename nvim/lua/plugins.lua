-- vim.cmd [[
-- packadd termdebug
-- packadd matchit
-- packadd shellmenu
-- ]]

vim.g.loaded_synload = 1
vim.g.loaded_matchparen = 1
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2

vim.g.user_emmet_leader_key = '<space><space>'

return require('lazy').setup({
    'nvim-lua/popup.nvim',
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-telescope/telescope-ui-select.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    -- :Telescope env
    "LinArcX/telescope-env.nvim",

    -- Diffview
    "sindrets/diffview.nvim",


    -- (Neo)Vim plugin for automatically highlighting other uses of the word
    -- under the cursor using either LSP, Tree-sitter, or regex matching.
    -- Default keymaps: <a-n> and <a-p> as keymaps to move between references.
    'RRethy/vim-illuminate',

    {
        'tzachar/local-highlight.nvim',
        config = function()
            require('local-highlight').setup({
                disable_file_types = { 'tex' },
                hlgroup = 'MoreMsg',
                cw_hlgroup = nil,
            })
        end
    },


    ---------------------------------------------------------------------------
    -- UI

    -- Colorscheme
    { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },

    -- { 'rebelot/kanagawa.nvim' },
    -- { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
    -- { 'kepano/flexoki-neovim', name = 'flexoki' },
    -- { "rose-pine/neovim", name = "rose-pine" },

    'folke/lsp-colors.nvim',
    'MunifTanjim/nui.nvim',

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    },

    {
        -- Simple winbar/statusline plugin that shows your current code context
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig"
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },


    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },

    {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
    },

    -- Dressing
    { 'stevearc/dressing.nvim', opts = {} },


    -- A lua powered greeter like `vim-startify`
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    };

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    -- use {'kdheepak/lazygit.nvim'}

    -- Glow (markdown viewer)
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
        end
    },


    -- Indent guides for Neovim
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Neovim plugin for aligning text
    -- :Align
    'RRethy/nvim-align',


    -- switch and restore fcitx state
    { 'h-hg/fcitx.nvim', lazy = false },


    ---------------------------------------------------------------------------
    -- Navigation
    ---------------------------------------------------------------------------

    -- File Explorer
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    },

    -- Tagbra
    'majutsushi/tagbar',

    'google/vim-searchindex', -- commented because of neovim slow performance

    -- Hop alternative for EasyMotion
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'twvxeoqpdygfblzhckisuran' }
        end
    },

    -- CamelCaseMotion alternative
    'chaoren/vim-wordmotion', -- commented because of neovim slow performance

    ---------------------------------------------------------------------------
    -- LSP server and autocompletion
    ---------------------------------------------------------------------------

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     dependencies = "nvim-treesitter/nvim-treesitter",
    -- },

    {
        'neovim/nvim-lspconfig',
        -- opts = {
        --     inlay_hints = { enabled = true }
        -- }
    },
    -- lsp installer
    "williamboman/mason.nvim",

    -- Highlight arguments' definitions and usages, asynchronously, using Treesitter
    'm-demare/hlargs.nvim',

    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
        cmd = "Trouble",
        -- config = function()
        --     require("trouble").setup {}
        -- end
        keys = {
            {
                "gT",
                "<cmd>Trouble<cr>",
                desc = 'Trouble'
            },
            {
                "gR",
                "<cmd>Trouble lsp_references toggle<cr>",
                desc = 'LSP References (Trouble)'
            }
        }
    },


    ---------------------------------------------------------------------------
    -- Autocompletion
    ---------------------------------------------------------------------------

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-omni',

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    'onsails/lspkind.nvim',
    'saadparwaiz1/cmp_luasnip',
    'petertriho/cmp-git',
    'uga-rosa/cmp-dictionary', -- dictionary /usr/share/dict/words


    -- Snippets plugin
    -- Snippy users
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
    'honza/vim-snippets',


    -- Text Objects
    "kana/vim-textobj-user",
    { 'whatyouhide/vim-textobj-erb', ft = {'ruby', 'rb', 'erb'}, },
    { "tek/vim-textobj-ruby", ft = {'ruby', 'rb', 'erb'} },
    { "nelstrom/vim-textobj-rubyblock", ft = {'ruby', 'rb', 'erb'} },
    { "bps/vim-textobj-python", ft = {'python', 'py'} },


    ---------------------------------------------------------------------------
    -- FILETYPES
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- RUBY

    { 'vim-ruby/vim-ruby', ft = {'ruby', 'rb', 'erb'} },
    { 'tpope/vim-rails', ft = {'ruby', 'rb', 'erb'} },
    { 'tpope/vim-rake', ft = {'ruby', 'rb', 'Rakefile', 'rake'} },
    { 'tpope/vim-bundler', ft = {'ruby', 'rb', 'erb'} },
    { 'slim-template/vim-slim', ft = {'ruby', 'rb', 'erb'} },
    { 'stjernstrom/vim-ruby-run', ft = {'ruby', 'rb', 'erb'} },
    { 'hallison/vim-ruby-sinatra', ft = {'ruby', 'rb', 'erb'} },


    ---------------------------------------------------------------------------
    -- PYTHON
    { 'hdima/python-syntax', ft = {'python', 'py'} },


    ---------------------------------------------------------------------------
    -- Vlang
    { 'cheap-glitch/vim-v', ft = {'vlang', 'v'} },


    ---------------------------------------------------------------------------
    -- Elixir
    { 'slashmili/alchemist.vim', ft = { "elixir", "eelixir", "exs", "ex" } },
    { 'mhinz/vim-mix-format', ft = { "elixir", "eelixir", "exs", "ex" } },
    { 'elixir-editors/vim-elixir', ft = { "elixir", "eelixir", "exs", "ex" } },


    ---------------------------------------------------------------------------
    -- Crystal
    { 'vim-crystal/vim-crystal', ft = {'cr', 'crystal'} },


    ---------------------------------------------------------------------------
    -- YAML
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
        }
    },

    ---------------------------------------------------------------------------
    -- DEBUGGING

    -- 'mfussenegger/nvim-dap',
    -- 'rcarriga/nvim-dap-ui',
    -- 'mfussenegger/nvim-dap-python',
    -- "jay-babu/mason-nvim-dap.nvim",

    ---------------------------------------------------------------------------

    -- lua-ls for neovim config
    "folke/neodev.nvim",

    -- Autopair alternative
    'cohama/lexima.vim',
    'windwp/nvim-autopairs',

    -- The fastest Neovim colorizer
    -- 'norcalli/nvim-colorizer.lua', -- depreacted
    'NvChad/nvim-colorizer.lua',

    -- Auto close (x)html tags
    { 'alvan/vim-closetag', ft = {'html', 'html5', 'htmldjango', 'xhtml', 'xml'} },
    -- 'AndrewRadev/tagalong.vim'

    -- Vim Table Mode for Markdown
    { 'https://github.com/dhruvasagar/vim-table-mode', ft = {'md', 'markdown', 'text'} },

    -- Use `gx` to open github related links as "user/git_repo"
    'gabebw/vim-github-link-opener',

    -- Basic
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },


    'Chiel92/vim-autoformat',
    'tpope/vim-unimpaired',
    -- 'tpope/vim-surround',
    'tpope/vim-repeat',
    -- 'mhinz/vim-startify',

    {
        'mattn/emmet-vim',
        config = function()
            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_mode='i'
        end,
        event = "VeryLazy",
        ft = {'html', 'css', 'erb', 'htmldjango', 'html5'}

    }
})
