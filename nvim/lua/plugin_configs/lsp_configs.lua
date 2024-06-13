local lspconfig = require'lspconfig';
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason = require'mason'
local navic = require'nvim-navic'


vim.diagnostic.config({
    float = { source = "always" },
    virtual_text = false,
    update_in_insert = false,
    signs = true,
    underline = true,

    virtual_lines = {
        -- To show virtual lines only for the current line's diagnostics:
        only_current_line = true,
        -- If you don't want to highlight the entire diagnostic line, use:
        highlight_whole_line = false
    }
})


vim.cmd[[autocmd InsertEnter * lua vim.diagnostic.disable()]]
vim.cmd[[autocmd InsertLeave * lua vim.diagnostic.enable()]]
-- vim.cmd[[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Uncomment the line below
-- vim.cmd[[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    if client.name == 'ruff_lsp' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end



-------------------------------------------------------------------------------
-- Mason
mason.setup({
    ui = {
        icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ﮊ",
        },
    },
    keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        heck_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
    },
    max_concurrent_installers = 10
})


-- require("mason-nvim-dap").setup({
--     ensure_installed = { "python", "delve" },
--     handlers = {
--     function(config)
--       -- all sources with no handler get passed here
--
--       -- Keep original functionality
--         require('mason-nvim-dap').default_setup(config)
--     end,
--     python = function(config)
--         config.adapters = {
--             type = "executable",
--             command = "/home/baka/.asdf/shims/python",
--             args = {
--                 "-m",
--                 "debugpy.adapter",
--             },
--         }
--         require('mason-nvim-dap').default_setup(config) -- don't forget this!
--     end,
-- },
-- })

-------------------------------------------------------------------------------
-- Ruby
lspconfig.solargraph.setup{
    on_attach = on_attach,
    capabilities = capabilities,
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
            --   hover = true
        }
    }
}


-- lspconfig.typeprof.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'typeprof', '--lsp', '--stdio' },
--     filetypes = { 'ruby', 'eruby', 'rakefile' },
--     -- root_dir = root_pattern("Gemfile", ".git")
-- }


-- lspconfig.sorbet.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'srb', 'tc', '--lsp' },
--     filetypes = { 'ruby', 'eruby', 'rakefile' },
--     -- root_dir = root_pattern("Gemfile", ".git")
-- }


lspconfig.standardrb.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'standardrb', '--lsp' },
    filetypes = { 'ruby', 'eruby', 'rakefile' },
    -- root_dir = root_pattern("Gemfile", ".git")
}


-- lspconfig.rubocop.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'rubocop', '--lsp' },
--     filetypes = { 'ruby', 'eruby', 'rakefile' },
--     -- root_dir = root_pattern("Gemfile", ".git")
-- }


-------------------------------------------------------------------------------
-- Rust
lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = { group = "module", },
                prefix = "self",
            },
            cargo = { buildScripts = { enable = true, }, },
            procMacro = { enable = true },
        }
    }
}


-------------------------------------------------------------------------------
-- Go
-- go install github.com/nametake/golangci-lint-langserver@latest
-- go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
lspconfig.golangci_lint_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {'golangci-lint-langserver'},
    filetypes = {'go', 'gomod'},
    init_options = {
        command = { 'golangci-lint', 'run', '--out-format', 'json' }
    }
}

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup{}



-------------------------------------------------------------------------------
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
    init_options = { hostInfo = "neovim" },
    -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}



-------------------------------------------------------------------------------
-- FRONT
lspconfig.cssmodules_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "cssmodules-language-server" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
}

-- lspconfig.tailwindcss.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "tailwindcss-language-server", "--stdio" },
--     init_options = { userLanguages = { eelixir = "html-eex", eruby = "erb" } },
--     settings = {
--         tailwindCSS = {
--             classAttributes = { "class", "className", "classList", "ngClass" },
--             lint = {
--                 cssConflict = "warning",
--                 invalidApply = "error",
--                 invalidConfigPath = "error",
--                 invalidScreen = "error",
--                 invalidTailwindDirective = "error",
--                 invalidVariant = "error",
--                 recommendedVariantOrder = "warning"
--             },
--             validate = true
--         }
--     }
-- }

-- lspconfig.html.setup{
--     capabilities = capabilities,
--     filetypes = { "javascript", "html", "htmldjango", "css" },
--     embeddedLanguages = {
--         css = true,
--         javascript = true,
--     },
--     provideFormatter = true
-- }

-- lspconfig.emmet_ls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
--     init_options = {
--         html = {
--             -- options = {
--             -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--             -- ["bem.enabled"] = true,
--         },
--     },
-- })



-------------------------------------------------------------------------------
-- C lang
lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt"),
}



-------------------------------------------------------------------------------
-- Crystal
lspconfig.crystalline.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "crystalline" },
    filetypes = { "crystal", "cr" },
    single_file_support = true
}



-------------------------------------------------------------------------------
-- Python
lspconfig.pyright.setup{
    on_attach = on_attach,
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true
        },
        python = {
            analysis = {
                -- Ignore all files fro analysis to exclusively use Ruff for linting
                ignore = { '*' }
            }
        }

    }
}

-- pylsp is TOOOO SLOW
-- lspconfig.pylsp.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     single_file_support = true,
--     settings = {
--         pylsp = {
--             plugins = {
--                 -- pycodestyle = {
--                 --     ignore = {
--                 --         'F401',
--                 --         'E501',
--                 --         'W391',
--                 --         'C0103', 'C0114', 'C0116',
--                 --     },
--                 -- },
--                 mypy = { enabled = true, live_mode = true, strict = false },
--                 black = { enabled = true, preview = true },
--                 -- autopep8 = { enabled = true },
--                 -- flake8 = { enabled = false },
--                 -- jedi = { completion = true },
--                 yapf = { enabled = true }
--             }
--         }
--     }
-- }


-- pip install pylyzer
-- It's not ready. It can't find virtually installed modules [issue #22]
-- lspconfig.pylyzer.setup{}

-- pip install ruff-lsp
lspconfig.ruff_lsp.setup{
    on_attach = on_attach,
}



-------------------------------------------------------------------------------
-- Elixir
lspconfig.elixirls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "elixir", "eelixir", "exs", "ex" },
    settings = {
        dialyzerEnabled = true,
        suggestSpecs = true,
        signatureAfterComplete = true,
    },
    cmd = { "/home/baka/apps/elixir_ls_binary/language_server.sh" }
}



-------------------------------------------------------------------------------
-- Erlang
lspconfig.erlangls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "erlang_ls" },
    filetypes = { "erlang" },
    -- root_dir = root_pattern('rebar.config', 'erlang.mk', '.git'),
    single_file_support = true
}



-------------------------------------------------------------------------------
-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = { globals = { "vim" }, },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}



-------------------------------------------------------------------------------
-- Haskell
lspconfig.hls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "haskell", "lhaskell" },
    settings = { formattingProvider = "ormolu" },
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    single_file_support = true
}



-------------------------------------------------------------------------------
-- LSP Lines
vim.keymap.set(
  "",
  "<leader>l",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)
