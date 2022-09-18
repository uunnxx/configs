vim.cmd [[packadd packer.nvim]]

vim.cmd [[
packadd termdebug
packadd matchit
packadd shellmenu
]]


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }



  -----------------------------------------------------------
  -- UI
  -----------------------------------------------------------
  -- Colorscheme
  use 'uunnxx/gruvbox.nvim'

  use 'MunifTanjim/nui.nvim'


  -- Statusline
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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


  use 'arjunmahishi/run-code.nvim'

---------- Comment
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
    config = function() require'nvim-tree'.setup {} end
  }

  -- Tagbra
  use 'majutsushi/tagbar'

  use 'google/vim-searchindex'

  -- Hop alternative for EasyMotion
  -- use {
  --   'phaazon/hop.nvim',
  --   branch = 'v1', -- optional but strongly recommended
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --   end
  -- }


  -----------------------------------------------------------
  -- LSP server and autocompletion
  -----------------------------------------------------------
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

-- Highlight arguments' definitions and usages, asynchronously, using Treesitter
  use 'm-demare/hlargs.nvim'



  -- LINTER
  use 'dense-analysis/ale'


  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-omni'
  use 'hrsh7th/lspkind-nvim'
  use 'saadparwaiz1/cmp_luasnip'


  -- Performance
  use 'lewis6991/impatient.nvim'

  -- Snippets plugin
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'honza/vim-snippets'

  -- Shade is a Neovim plugin that dims your inactive windows, making it easier to see the active window at a glance.
  -- use 'sunjon/shade.nvim'



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
    'https://github.com/whatyouhide/vim-textobj-erb',
    ft = {'ruby', 'rb', 'erb', 'erb'},
  }
  use {
    'stjernstrom/vim-ruby-run',
    ft = {'ruby', 'rb', 'erb'}
  }
  use {
    'hallison/vim-ruby-sinatra',
    ft = {'ruby', 'rb', 'erb'}
  }


  -----------------------------------------------------------
  -- PYTHON
  -----------------------------------------------------------
  -- Vim plugin to sort python imports using
  use {
    'fisadev/vim-isort',
    ft = {'py', 'python'}
  }
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

  use {
    'mattn/emmet-vim',
    ft = {'html', 'html5', 'css3', 'css', 'javascript', 'js'}
  }

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
-- 'turbio/bracey.vim'


-- Vim Table Mode for Markdown
  use {
    'https://github.com/dhruvasagar/vim-table-mode',
    -- ft = {'md', 'markdown', 'ruby', 'rb'}
  }

  use 'gabebw/vim-github-link-opener'


--------------------------------------- REF |
  -- 'Автоформатирование' кода для всех языков
  use 'Chiel92/vim-autoformat'
  -- ]p - вставить на строку выше, [p - ниже
  use 'tpope/vim-unimpaired'
  -- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
  use 'tpope/vim-surround'
  -- Может повторять через . vimsurround
  use 'tpope/vim-repeat'
  -- Стартовая страница, если просто набрать vim в консоле
  use 'mhinz/vim-startify'

--------------------------------------- REF |
end)

