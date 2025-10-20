local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason = require('mason')
local navic = require('nvim-navic')


-- This will watch changed files so I don't have to :LspRestart every fucking time when I created a new fucking file
capabilities = {
    workspace = {
        didChangeWatchedFiles = {
            dynamicRegistration = true
        }
    }
}

vim.diagnostic.config({
    float = { source = true },
    -- virtual_text = {
    --     current_line = true
    -- },
    virtual_lines = {
        current_line = true,
    },
    update_in_insert = false,
    serevity_sort = true,
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN]  = ' ',
            [vim.diagnostic.severity.INFO]  = ' ',
            [vim.diagnostic.severity.HINT]  = ' ',
        },
        -- numhl = {
        --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        --     [vim.diagnostic.severity.WARN] = 'WarningMsg',
        -- }
    }
})

-- vim.cmd[[autocmd InsertEnter * lua vim.diagnostic.enable(false)]]
-- vim.cmd[[autocmd InsertLeave * lua vim.diagnostic.enable(true)]]

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



-------------------------------------------------------------------------------
-- Rust
vim.lsp.config.rust_analyzer = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
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
vim.lsp.enable('rust_analyzer')

-------------------------------------------------------------------------------
-- Go
-- go install golang.org/x/tools/gopls@latest
vim.lsp.config.gopls = {
    cmd = { "gopls" }
}
vim.lsp.enable('gopls')


-------------------------------------------------------------------------------
-- C lang
vim.lsp.config.clangd = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
}
vim.lsp.enable('clangd')


-------------------------------------------------------------------------------
-- Python
vim.lsp.config.basedpyright = {
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
                    reportUnusedImport = false,
                    reportUnannotatedClassAttribute = false,
                    reportImplicitOverride = false
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
vim.lsp.enable('basedpyright')


-- pip install pylyzer
-- It's not ready. It can't find virtually installed modules [issue #22]

-- pip install ruff-lsp
vim.lsp.config.ruff = {
    on_attach = on_attach,
}
vim.lsp.enable('ruff')


-------------------------------------------------------------------------------
-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


vim.lsp.config.lua_ls = {
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
vim.lsp.enable('lua_ls')
