-- Custom components
local function wordCount()
    local filetype = vim.bo.filetype
    if filetype == "md" or filetype == "txt" or filetype == "markdown" or filetype == "lsp_markdown" then
        if vim.fn.wordcount().visual_words == 1 then
            return tostring(vim.fn.wordcount().visual_words) .. " word"
        elseif not (vim.fn.wordcount().visual_words == nil) then
            return tostring(vim.fn.wordcount().visual_words) .. " words"
        else
            return tostring(vim.fn.wordcount().words) .. " words"
        end
    else
        return ""
    end
end

local navic = require('nvim-navic')

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        -- fmt = string.lower,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'searchcount'},
        lualine_c = {'getcwd', 'filename', 'filesize'},

        -- %B hex code
        lualine_x = {'diagnostics', 'encoding', 'fileformat', 'filetype', '%B', wordCount},
        lualine_y = {'progress', 'location'},
        lualine_z = {'hostname'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = { lualine_c = {
        {
            function()
                return navic.get_location()
            end,
            cond = function()
                return navic.is_available()
            end
        }
    }},
    inactive_winbar = {},
    extensions = {
        'quickfix',
        'fzf',
        'lazy',
        'man',
        'nvim-tree',
        'trouble'
    }
}
