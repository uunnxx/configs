local lspconfig = require'lspconfig';
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason = require'mason'


vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
})



-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end


mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- Ruby
lspconfig.solargraph.setup{
  cmd = { 'solargraph', 'stdio' },
  filetypes = { 'ruby', 'rakefile' },
  capabilities = capabilities,
  init_options = {
    formatting = true
  },
  -- root_dir = root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      definition = true,
      diagnostics = true,
      completion = true,
      autoformat = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
      hover = true
    }
  }
}


lspconfig.typeprof.setup{
  cmd = { 'typeprof', '--lsp', '--stdio' },
  filetypes = { 'ruby', 'eruby', 'rakefile' },
  -- root_dir = root_pattern("Gemfile", ".git")
}


-- Rust
lspconfig.rust_analyzer.setup{
  -- on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  -- root_dir = root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {}
  }
}

-- JavaScript, TypeScript
lspconfig.tsserver.setup{
  -- on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  init_options = {
    hostInfo = "neovim"
  },
  -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}

-- CSS
require'lspconfig'.cssmodules_ls.setup{
  cmd = { "cssmodules-language-server" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
}

require'lspconfig'.tailwindcss.setup{
  cmd = { "tailwindcss-language-server", "--stdio" },
  init_options = {
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb"
    }
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        },
      validate = true
    }
  }
}


-- C lang
lspconfig.clangd.setup{
  -- on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt"),
}


-- Crystal
lspconfig.crystalline.setup{
  cmd = { "crystalline" },
  filetypes = { "crystal" },
  single_file_support = true,
  capabilities = capabilities
}


-------------------------------------
-- Python
lspconfig.pylsp.setup{}
-- lspconfig.pylsp.setup{
--   single_file_support = true,
--   capabilities = capabilities,
--   settings = {
    -- pylsp = {
      -- plugins = {
      --   pycodestyle = {
      --     ignore = {'W391'},
      --     maxLineLength = 79
      --   },
      --   mypy = {
      --     enabled = true,
      --     live_mode = true,
      --     strict = false,
      --   },
      --   black = {
      --     enabled = true,
      --     line_length = 79,
      --     preview = true
      --   },
      --   autopep8 = {
      --     enabled = true
      --   },
      --   flake8 = {
      --     enabled = true
      --   },
      --   jedi = {
      --     completion = true
      --   },
      --   pylint = {
      --     enabled = true
      --   },
      --   yapf = {
      --     enabled = true
      --   }
      -- }
    -- }
--   }
-- }


-- Elixir
lspconfig.elixirls.setup{
  filetypes = { "elixir", "eelixir", "exs", "ex" },
  settings = {
    dialyzerEnabled = true,
    suggestSpecs = true,
    signatureAfterComplete = true,
  },
  cmd = { "/home/baka/apps/elixir-ls/release/language_server.sh" },
  capabilities = capabilities
}


-- Erlang
lspconfig.erlangls.setup{
  cmd = { "erlang_ls" },
  filetypes = { "erlang" },
  -- root_dir = root_pattern('rebar.config', 'erlang.mk', '.git')
  single_file_support = true,
  capabilities = capabilities
}


-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.lua_ls.setup {
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- Haskell
lspconfig.hls.setup{
  filetypes = { "haskell", "lhaskell"},
  settings = {
    formattingProvider = "ormolu",
  },
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  single_file_support = true,
  capabilities = capabilities
}
