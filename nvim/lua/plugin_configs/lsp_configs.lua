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
-- Reformat this section with mappings

local on_attach = function(client, bufnr)
  require('completion').on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

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


-- Grammarly
lspconfig.grammarly.setup{
  cmd = { "unofficial-grammarly-language-server", "--stdio" },
  filetypes = { "markdown", "text", "txt" },
  -- root_dir = util.find_git_ancestor,
  single_file_support = true
}

