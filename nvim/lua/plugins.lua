vim.cmd [[
packadd packer.nvim
packadd termdebug
packadd matchit
packadd shellmenu
packadd cfilter
]]

return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {
      pickers = {
        find_files = {
          theme = "ivy",
        }
      },
    } end
  }

  -----------------------------------------------------------
  -- UI
  -----------------------------------------------------------

  -- Colorscheme
  use 'uunnxx/gruvbox.nvim'

  -- Statusline
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- use { 'stevearc/dressing.nvim' }
  use { 'stevearc/dressing.nvim' }

  -- Git
  use { 'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Bufferline
  use { 'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup{} end
    }


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
  -- Alternative for fzf & ack


  -----------------------------------------------------------
  -- LSP server and autocompletion
  -----------------------------------------------------------

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'






  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      use 'hrsh7th/cmp-buffer',
      use 'hrsh7th/cmp-path',
      use 'hrsh7th/cmp-nvim-lsp',
      use 'hrsh7th/cmp-nvim-lua',
      use 'hrsh7th/cmp-cmdline',
      use 'hrsh7th/cmp-omni',
      use 'hrsh7th/lspkind-nvim',
      use 'saadparwaiz1/cmp_luasnip'
    }
  }

  -- Snippets plugin
  ------- Configuration isn't complete
  use 'L3MON4D3/LuaSnip'
  use 'dcampos/cmp-snippy'
  use 'dcampos/nvim-snippy'


  -----------------------------------------------------------
  -- PYTHON
  -----------------------------------------------------------
  --- Шапка с импортами приводим в порядок
  use 'fisadev/vim-isort'

  -- LINTER
  use 'dense-analysis/ale'



  -----------------------------------------------------------
  -- Elixir
  -----------------------------------------------------------
  use 'slashmili/alchemist.vim'
  use 'mhinz/vim-mix-format'
  use 'elixir-editors/vim-elixir'



  -----------------------------------------------------------
  -- Crystal
  -----------------------------------------------------------
  use 'vim-crystal/vim-crystal'



  -----------------------------------------------------------
  -- HTML и CSS
  -----------------------------------------------------------
  -- Подсвечивает закрывающий и откры. тэг. Если, где-то что-то не закрыто, то не подсвечивает.
  use 'idanarye/breeze.vim'
  -- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1>
  use 'alvan/vim-closetag'

  -- Подсвечивает #ffffff
  use 'ap/vim-css-color'


  -- 'Автоформатирование' кода для всех языков
  use 'Chiel92/vim-autoformat'
  -- ]p - вставить на строку выше, [p - ниже
  use 'tpope/vim-unimpaired'
  --- popup окошки
  use 'nvim-lua/popup.nvim'
  -- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
  use 'tpope/vim-surround'
  -- Считает кол-во совпадений при поиске
  use 'google/vim-searchindex'
  -- Может повторять через . vimsurround
  use 'tpope/vim-repeat'
  -- Стартовая страница, если просто набрать vim в консоле
  use 'mhinz/vim-startify'

  use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  -- Обрамляет строку в теги по ctrl- y + ,
  use 'mattn/emmet-vim'
  -- Закрывает автоматом скобки
  use 'cohama/lexima.vim'
  -- Линтер, работает для всех языков

end)
