local map = vim.keymap.set



-------------------------------------------------------------------------------
-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "elixir",
        "graphql",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    },
    sync_install = false,
    -- auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true }
}



-------------------------------------------------------------------------------
-- Highlight arguments' definitions and usages, asynchronously, using Treesitter
require('hlargs').setup()



-------------------------------------------------------------------------------
-- Performance related
require('impatient').enable_profile()



-------------------------------------------------------------------------------
-- Hop.nvim
local hop = require('hop')
local directions = require('hop.hint').HintDirection

map('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
map('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
map('', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
map('', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, {remap=true})



-------------------------------------------------------------------------------
-- Trouble
require("trouble").setup {
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}


-------------------------------------------------------------------------------
-- Nvim-Tree
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    -- view = {
        -- adaptive_size = true,
    -- },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = true,
    }
})



-------------------------------------------------------------------------------
-- Surround
-- Sv or S{ for a variable
-- Sb       for a block
-- Si       for an if statement
-- Sw       for a with statement
-- Sc       for a comment
-- Sf       for a for statement
-- S%       for other template tags

vim.cmd[[
    let b:surround_{char2nr("v")} = "{{ \r }}"
    let b:surround_{char2nr("{")} = "{{ \r }}"
    let b:surround_{char2nr("%")} = "{% \r %}"
    let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
    let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
    let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
    let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
    let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
]]



-------------------------------------------------------------------------------
-- Indent Blankline


local highlight = {
    "ibl1",
    "ibl2",
    "ibl3",
    "ibl4",
    "ibl5",
    "ibl6",
    "ibl7",
    'CursorColumn',
    'Whitespace'
}


local hooks = require('ibl.hooks')

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, 'ibl1', { fg = '#444444' })
    vim.api.nvim_set_hl(0, 'ibl2', { fg = '#444444' })
    vim.api.nvim_set_hl(0, 'ibl3', { fg = '#444444' })
    vim.api.nvim_set_hl(0, 'ibl4', { fg = '#444444' })
    vim.api.nvim_set_hl(0, 'ibl5', { fg = '#444444' })
    vim.api.nvim_set_hl(0, 'ibl6', { fg = '#444444' })
    vim.api.nvim_set_hl(0, 'ibl7', { fg = '#444444' })
end)


require'ibl'.setup {
    indent = {
        highlight = highlight,
        char = "░",
        tab_char = "░"
    },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = {
        enabled = true,
        char = "░",
        show_start = false,
        show_end = false,
        show_exact_scope = true
    },
    exclude = {
        filetypes = { 'lua' }
    }
}



-------------------------------------------------------------------------------
-- Colorizer
require'colorizer'.setup()



-------------------------------------------------------------------------------
-- Autopairs
require("nvim-autopairs").setup({})



-------------------------------------------------------------------------------
-- Neodev
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})



-------------------------------------------------------------------------------
-- Debugging
-- require('dapui').setup({})
-- require('dap-python').setup()



-------------------------------------------------------------------------------
-- Emmet
-- leader key + ,
vim.cmd[[
    let g:user_emmet_mode='i'
    let g:user_emmet_leader_key='<space><space>'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,htmldjango,erb EmmetInstall
]]
