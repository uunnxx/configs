local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason = require('mason')
local navic = require('nvim-navic')

-- require('mason-lspconfig').setup()

vim.diagnostic.config({
    float = { source = true },
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


vim.cmd [[autocmd InsertEnter * lua vim.diagnostic.disable()]]
vim.cmd [[autocmd InsertLeave * lua vim.diagnostic.enable()]]
-- vim.cmd[[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Uncomment the line below
-- vim.cmd[[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- if client.name == 'ruff' then
    --     -- Disable hover in favor of Pyright
    --     client.server_capabilities.hoverProvider = false
    -- end
    require('lsp_signature').on_attach({
        bind = true,
        floating_window_above_cur_line = true,
        handler_opts = {
            border = 'rounded'
        },
        hint_prefix = {
            above = "↙ ",  -- when the hint is on the line above the current line
            current = "← ",  -- when the hint is on the same line
            below = "↖ "  -- when the hint is on the line below the current line
        }
    })

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- press 2 times to focus float window
end



-------------------------------------------------------------------------------
-- Mason
mason.setup({
    ui = {
        icons = {
            -- package_pending = ' ',
            -- package_installed = ' ',
            -- package_uninstalled = ' ﮊ',
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        },
        check_outdated_packages_on_open = false,
        border = 'none',
        backdrop = 0,

    },
    keymaps = {
        toggle_server_expand = '<CR>',
        install_server = 'i',
        update_server = 'u',
        check_server_version = 'c',
        update_all_servers = 'U',
        check_outdated_servers = 'C',
        uninstall_package = 'X',
        cancel_installation = '<C-c>',
    },
    max_concurrent_installers = 10
})


-- require('mason-lspconfig').setup_handlers {
--     function(server_name)
--         require('lspconfig')[server_name].setup {}
--     end
-- }


-------------------------------------------------------------------------------
-- Ruby
-- lspconfig.solargraph.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'solargraph', 'stdio' },
--     filetypes = { 'ruby', 'rakefile' },
--     init_options = {
--         formatting = true
--     },
--     -- root_dir = root_pattern('Gemfile', '.git'),
--     settings = {
--         solargraph = {
--             definition = true,
--             diagnostics = true,
--             completion = true,
--             autoformat = true,
--             folding = true,
--             references = true,
--             rename = true,
--             symbols = true,
--             --   hover = true
--         }
--     }
-- }


-- lspconfig.standardrb.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'standardrb', '--lsp' },
--     filetypes = { 'ruby', 'eruby', 'rakefile' },
--     -- root_dir = root_pattern('Gemfile', '.git')
-- }


-------------------------------------------------------------------------------
-- Rust
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_dir = lspconfig.util.root_pattern('Cargo.toml', 'rust-project.json'),
    settings = {
        ['rust-analyzer'] = {
            imports = {
                granularity = { group = 'module', },
                prefix = 'self',
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
lspconfig.golangci_lint_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'golangci-lint-langserver' },
    filetypes = { 'go', 'gomod' },
    init_options = {
        command = { 'golangci-lint', 'run', '--out-format', 'json' }
    }
}

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup {}



-------------------------------------------------------------------------------
-- JavaScript, TypeScript
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx'
    },
    init_options = { hostInfo = 'neovim' },
    -- root_dir = root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')
}



-------------------------------------------------------------------------------
-- FRONT
-- lspconfig.cssmodules_ls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'cssmodules-language-server' },
--     filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
-- }

-- lspconfig.tailwindcss.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'tailwindcss-language-server', '--stdio' },
--     init_options = { userLanguages = { eelixir = 'html-eex', eruby = 'erb' } },
--     settings = {
--         tailwindCSS = {
--             classAttributes = { 'class', 'className', 'classList', 'ngClass' },
--             lint = {
--                 cssConflict = 'warning',
--                 invalidApply = 'error',
--                 invalidConfigPath = 'error',
--                 invalidScreen = 'error',
--                 invalidTailwindDirective = 'error',
--                 invalidVariant = 'error',
--                 recommendedVariantOrder = 'warning'
--             },
--             validate = true
--         }
--     }
-- }

-- lspconfig.html.setup{
--     capabilities = capabilities,
--     filetypes = { 'javascript', 'html', 'htmldjango', 'css' },
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
--             -- ['bem.enabled'] = true,
--         },
--     },
-- })



-------------------------------------------------------------------------------
-- C lang
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    -- root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt'),
}



-------------------------------------------------------------------------------
-- Crystal
lspconfig.crystalline.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'crystalline' },
    filetypes = { 'crystal', 'cr' },
    single_file_support = true
}



-------------------------------------------------------------------------------
-- Python
lspconfig.basedpyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        basedpyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "all",
                diagnosticSeverityOverrides = {
                    reportAny = false,
                    reportExplicitAny = false,
                    reportMissingTypeArgument = false,
                    reportMissingParameterType = false,
                    reportMissingTypeStubs = false,
                    reportUnknownArgumentType = false,
                    reportUnknownMemberType = false,
                    reportUnknownParameterType = false,
                    reportUnknownVariableType = false,
                    reportUnknownLambdaType = false,
                    reportUnusedCallResult = false,
                    reportUnusedVariable = false,
                    reportUnannotatedClassAttribute = false
                },
                inlayHints = {
                    callArgumentNames = true,
                }
            }
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' }
            }
        }

    }
}



-- pip install pylyzer
-- It's not ready. It can't find virtually installed modules [issue #22]
-- lspconfig.pylyzer.setup{}

-- pip install ruff-lsp
lspconfig.ruff.setup {
    on_attach = on_attach,
}


-------------------------------------------------------------------------------
-- Elixir
-- lspconfig.elixirls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { 'elixir', 'eelixir', 'exs', 'ex' },
--     settings = {
--         dialyzerEnabled = true,
--         suggestSpecs = true,
--         signatureAfterComplete = true,
--     },
--     cmd = { '/home/baka/apps/elixir_ls_binary/language_server.sh' }
-- }



-------------------------------------------------------------------------------
-- Erlang
-- lspconfig.erlangls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'erlang_ls' },
--     filetypes = { 'erlang' },
--     -- root_dir = root_pattern('rebar.config', 'erlang.mk', '.git'),
--     single_file_support = true
-- }


-------------------------------------------------------------------------------
-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' }, },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}



-------------------------------------------------------------------------------
-- Haskell
-- lspconfig.hls.setup {
--    on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { 'haskell', 'lhaskell' },
--     settings = { formattingProvider = 'ormolu' },
--     cmd = { 'haskell-language-server-wrapper', '--lsp' },
--     single_file_support = true
-- }



-------------------------------------------------------------------------------
-- LSP Lines
vim.keymap.set(
    '',
    '<leader>l',
    require('lsp_lines').toggle,
    { desc = 'Toggle lsp_lines' }
)
