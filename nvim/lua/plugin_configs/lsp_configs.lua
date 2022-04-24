local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = 'i',
          update_server = 'u',
          update_all_servers = 'U',
          uninstall_server = 'X'
        }
    },
    max_concurrent_installers = 6
})

local lspconfig = require'lspconfig';


---------------------------------------- BEGIN REF.

require'nvim-treesitter.configs'.setup {
  highlight = {
      enable = true
  },
}



---------------------------------------- END REF.


-- Ruby
lspconfig.solargraph.setup{
  cmd = { 'solargraph', 'stdio' },
  filetypes = { 'ruby', 'rakefile' },
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
  on_attach = on_attach,
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
  on_attach = on_attach,
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

-- C lang
lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt"),
}

-- Crystal
lspconfig.crystalline.setup{
  cmd = { "crystalline" },
  filetypes = { "crystal" },
  single_file_support = true
}

-- Python
lspconfig.pylsp.setup{
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = true
}


-- Elixir
lspconfig.elixirls.setup{
  filetypes = { "elixir", "eelixir", "exs", "ex" },
  settings = {
    dialyzerEnabled = true,
    suggestSpecs = true,
    signatureAfterComplete = true,
  },
  cmd = { "/home/baka/apps/elixir-ls/release/language_server.sh" };
}


-- Erlang
lspconfig.erlangls.setup{
  cmd = { "erlang_ls" },
  filetypes = { "erlang" },
  -- root_dir = root_pattern('rebar.config', 'erlang.mk', '.git')
  single_file_support = true
}


-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      }
    }
  }
}

-- Haskell
lspconfig.hls.setup{
  filetypes = { "haskell", "lhaskell"},
  settings = {
    formattingProvider = "ormolu",
  },
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  single_file_support = true
}

-- Don't use this shitty lsp! Crashes every fucking time when I open markdown file.
-- -- Grammarly
-- lspconfig.grammarly.setup{
--   cmd = { "unofficial-grammarly-language-server", "--stdio" },
--   filetypes = { "markdown", "text", "txt" },
--   -- root_dir = util.find_git_ancestor,
--   single_file_support = true
-- }

