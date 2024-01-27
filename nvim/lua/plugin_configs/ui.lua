-----------------------------------------------------------
-- User Interface
-----------------------------------------------------------

local g    = vim.g               -- global variables
local cmd  = vim.cmd             -- execute Vim commands

local colors = require('gruvbox.palette')
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
    undercurl = true,
    underline = true,
    bold = true,
    italic = false,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})

-- Kanagawa
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})


vim.o.background = "dark"
cmd'colorscheme kanagawa'
-- cmd'colorscheme kanagawa'


-- Transparency background
cmd [[
    highlight! Normal ctermbg=none guibg=none
    highlight! QuickFixLine ctermbg=none guibg=none
    highlight! CursorLineSign ctermbg=none guibg=none
    highlight! CursorLineNr ctermbg=none guibg=none
    highlight! SignColumn ctermbg=none guibg=none
]]

cmd [[
    highlight! NonText guifg=#ccc guibg=none
    highlight! SpecialKey guifg=#ccc ctermfg=none
    highlight! WhiteSpace guifg=#ccc ctermfg=none
]]


-- Highlight ERROR NOTE BUG INFO HACK CHANGED CHANGES WARNING FIXME README TODO IDEA CONCEPT
-- Colors located in ~/.nvim/plugged/gruvbox/colors/gruvbox.vim
-- Line 576 to Line 579

cmd[[
    autocmd Syntax * call matchadd('Todo', '\W\zs\(CONCEPT\|TODO\|FIXME\|CHANGED\|CHANGES\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|README\|SYNTAX\)')
    autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|WARNING\|BUG\|SECURITY WARNING\)')

    autocmd Filetype python,ruby,c,cpp,elixir,rust match Error /\s\+$/
    " match Error /\s\+$/
]]


-- Disable number in terminal
cmd[[autocmd TermOpen * setlocal nonumber norelativenumber]]

-- cmp.nvim
cmd[[
    highlight! PmenuSel guibg=#1d2021 guifg=NONE
    highlight! Pmenu guifg=#C5CDD9 guibg=#22252A
    highlight! CmpItemAbbrDeprecated guifg=#7E8294 guibg=NONE
    highlight! CmpItemAbbrMatch guifg=#82AAFF guibg=NONE
    highlight! CmpItemAbbrMatchFuzzy guifg=#82AAFF guibg=NONE
    highlight! CmpItemMenu guifg=#d3869b guibg=NONE
    highlight! CmpItemKindField guifg=#EED8DA guibg=#B5585F
    highlight! CmpItemKindProperty guifg=#EED8DA guibg=#B5585F
    highlight! CmpItemKindEvent guifg=#EED8DA guibg=#B5585F
    highlight! CmpItemKindText guifg=#ffffff guibg=#b8bb26
    highlight! CmpItemKindEnum guifg=#ffffff guibg=#b8bb26
    highlight! CmpItemKindKeyword guifg=#ffffff guibg=#b8bb26
    highlight! CmpItemKindConstant guifg=#FFE082 guibg=#D4BB6C
    highlight! CmpItemKindConstructor guifg=#FFE082 guibg=#D4BB6C
    highlight! CmpItemKindReference guifg=#FFE082 guibg=#D4BB6C
    highlight! CmpItemKindFunction guifg=#ffffff guibg=#d3869b
    highlight! CmpItemKindStruct guifg=#ffffff guibg=#d3869b
    highlight! CmpItemKindClass guifg=#ffffff guibg=#d3869b
    highlight! CmpItemKindModule guifg=#ffffff guibg=#d3869b
    highlight! CmpItemKindOperator guifg=#ffffff guibg=#d3869b
    highlight! CmpItemKindVariable guifg=#C5CDD9 guibg=#7E8294
    highlight! CmpItemKindFile guifg=#C5CDD9 guibg=#7E8294
    highlight! CmpItemKindUnit guifg=#F5EBD9 guibg=#D4A959
    highlight! CmpItemKindSnippet guifg=#F5EBD9 guibg=#D4A959
    highlight! CmpItemKindFolder guifg=#F5EBD9 guibg=#D4A959
    highlight! CmpItemKindMethod guifg=#DDE5F5 guibg=#6C8ED4
    highlight! CmpItemKindValue guifg=#DDE5F5 guibg=#6C8ED4
    highlight! CmpItemKindEnumMember guifg=#DDE5F5 guibg=#6C8ED4
    highlight! CmpItemKindInterface guifg=#D8EEEB guibg=#58B5A8
    highlight! CmpItemKindColor guifg=#D8EEEB guibg=#58B5A8
    highlight! CmpItemKindTypeParameter guifg=#D8EEEB guibg=#58B5A8
]]
