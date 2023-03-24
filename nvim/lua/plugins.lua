vim.cmd [[packadd packer.nvim]]

vim.cmd [[
packadd termdebug
packadd matchit
packadd shellmenu
]]


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }


  -- (Neo)Vim plugin for automatically highlighting other uses of the word
  -- under the cursor using either LSP, Tree-sitter, or regex matching.
  -- Default keymaps: <a-n> and <a-p> as keymaps to move between references.
  use 'RRethy/vim-illuminate'


  -----------------------------------------------------------
  -- UI
  -----------------------------------------------------------
  -- Colorscheme
  use 'uunnxx/gruvbox.nvim'
  -- use "ellisonleao/gruvbox.nvim"

  use 'folke/lsp-colors.nvim'

  use 'MunifTanjim/nui.nvim'

  use 'nvim-tree/nvim-web-devicons'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

-- use { 'stevearc/dressing.nvim' }

-- Git
use { 'lewis6991/gitsigns.nvim',
requires = 'nvim-lua/plenary.nvim'
  }
  -- use {'kdheepak/lazygit.nvim'}

  -- Bufferline
  use { 'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require("bufferline").setup{} end
  }


  -- Indent guides for Neovim
  use 'lukas-reineke/indent-blankline.nvim'

  -- Comment
  use { 'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}

-- Neovim plugin for aligning text
-- :Align
use 'RRethy/nvim-align'


-- switch and restore fcitx state
use 'h-hg/fcitx.nvim'

-----------------------------------------------------------
-- Navigation
-----------------------------------------------------------
-- File Explorer
use { 'kyazdani42/nvim-tree.lua',
requires = 'kyazdani42/nvim-web-devicons',
tag = 'nightly'
-- config = function() require'nvim-tree'.setup {} end
  }

  -- Tagbra
  use 'majutsushi/tagbar'

  use 'google/vim-searchindex'

  -- Hop alternative for EasyMotion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'twvxeoqpdygfblzhckisuran' }
    end
  }


  -----------------------------------------------------------
  -- LSP server and autocompletion
  -----------------------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'neovim/nvim-lspconfig'
  -- lsp installer
  use { "williamboman/mason.nvim" }

  -- Highlight arguments' definitions and usages, asynchronously, using Treesitter
  use 'm-demare/hlargs.nvim'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }


  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-omni'
  use 'onsails/lspkind.nvim'
  use 'saadparwaiz1/cmp_luasnip'


  -- Performance
  use 'lewis6991/impatient.nvim'

  -- Snippets plugin
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'honza/vim-snippets'


  -----------------------------------------------------------
  ----------------------FILETYPES----------------------------
  -----------------------------------------------------------

  -----------------------------------------------------------
  -- RUBY
  -----------------------------------------------------------

  use {
    'vim-ruby/vim-ruby',
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    'tpope/vim-rails',
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    'tpope/vim-rake',
    ft = {'ruby', 'rb', 'Rakefile', 'rake'}
  }
  use {
    'tpope/vim-bundler',
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    'slim-template/vim-slim',
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    'stjernstrom/vim-ruby-run',
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    'hallison/vim-ruby-sinatra',
    ft = {'ruby', 'rb', 'erb'}
  }


  -- Text Objects
  use "kana/vim-textobj-user"
  use {
    'whatyouhide/vim-textobj-erb',
    ft = {'ruby', 'rb', 'erb'},
  }
  use {
    "tek/vim-textobj-ruby",
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    "nelstrom/vim-textobj-rubyblock",
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    "bps/vim-textobj-python",
    ft = {'python', 'py'}
  }


  -----------------------------------------------------------
  -- PYTHON
  -----------------------------------------------------------
  use {
    'hdima/python-syntax',
    ft = {'python', 'py'}
  }




  -----------------------------------------------------------
  -- Elixir
  -----------------------------------------------------------
  use {
    'slashmili/alchemist.vim',
    ft = { "elixir", "eelixir", "exs", "ex" }
  }
  use {
    'mhinz/vim-mix-format',
    ft = { "elixir", "eelixir", "exs", "ex" }
  }
  use {
    'elixir-editors/vim-elixir',
    ft = { "elixir", "eelixir", "exs", "ex" }
  }



  -----------------------------------------------------------
  -- Crystal
  -----------------------------------------------------------
  use {
    'vim-crystal/vim-crystal',
    ft = {'cr', 'crystal'}
  }



  -----------------------------------------------------------
  -- HTML и CSS
  -----------------------------------------------------------

  -- Autopair alternative
  use 'cohama/lexima.vim'
  -- use 'windwp/nvim-autopairs'

  -- The fastest Neovim colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Auto close (x)html tags
  use {
    'alvan/vim-closetag',
    ft = {'html', 'html5', 'xhtml', 'xml'}
  }

  -- 'AndrewRadev/tagalong.vim'


  -- Vim Table Mode for Markdown
  use {
    'https://github.com/dhruvasagar/vim-table-mode',
    ft = {'md', 'markdown', 'text'}
  }

  -- Use `gx` to open github related links as "user/git_repo"
  use 'gabebw/vim-github-link-opener'


  -- Basic
  use 'Chiel92/vim-autoformat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'mhinz/vim-startify'

end)

