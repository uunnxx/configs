-----------------------------------------------------------
-- User Interface
-----------------------------------------------------------

-- local g    = vim.g               -- global variables
local cmd  = vim.cmd             -- execute Vim commands

local colors = require('gruvbox').palette
local config = require('gruvbox').config

require("gruvbox").setup({
    overrides = {
        GruvboxRedSign = { bg = "NONE" },
        GruvboxYellowSign = { bg = "NONE" },
        GruvboxGreenSign = { bg = "NONE" },
        GruvboxAquaSign = { bg = "NONE" },
        Normal = { bg = "NONE" },
        QuickFixLine = { bg = "NONE" },
        CursorLineSign = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
        SignColumn = { bg = "NONE" },

        -- LspReferenceRead = { bg = "NONE" },
        -- LspReferenceText = { bg = "NONE" },
        -- LspReferenceWrite = { bg = "NONE" },
        -- LspCodeLens = { bg = "NONE" },

        DiagnosticSignError = {
            bg = "NONE",
            fg = colors.bright_red,
            bold = config.bold,
            reverse = config.invert_signs
        },
        DiagnosticSignWarn = {
            bg = "NONE",
            fg = colors.bright_yellow,
            bold = config.bold,
            reverse = config.invert_signs
        },
        DiagnosticSignInfo = {
            bg = "NONE",
            fg = colors.bright_blue,
            bold = config.bold,
            reverse = config.invert_signs
        },
    },
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    -- palette_overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})


vim.o.background = "dark"
cmd'colorscheme gruvbox'


require("bufferline").setup({
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        numbers = "none",
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            -- style = 'icon' | 'underline' | 'none',
            style = 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                -- text_align = "left" | "center" | "right"
                text_align = "left",
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
        move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
        -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        separator_style = "thick",
        enforce_regular_tabs = false,
        auto_toggle_bufferline = true,
        -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        sort_by = 'insert_after_current',
        pick = {
            alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
        },
    }
})


-- Highlight ERROR NOTE BUG INFO HACK CHANGED CHANGES WARNING FIXME README TODO IDEA CONCEPT
-- Colors located in ~/.nvim/plugged/gruvbox/colors/gruvbox.vim
-- Line 576 to Line 579

cmd[[
    autocmd Syntax * call matchadd('Todo', '\W\zs\(CONCEPT\|TODOS\|TODO\|FIXME\|CHANGED\|CHANGES\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|README\|SYNTAX\)')
    autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|WARNING\|BUG\|SECURITY WARNING\)')

    autocmd Filetype python,ruby,c,cpp,elixir,rust match Error /\s\+$/
    " match Error /\s\+$/
]]

-- Disable number in terminal
cmd[[autocmd TermOpen * setlocal nonumber norelativenumber]]
