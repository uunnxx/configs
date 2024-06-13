local telescope = require('telescope')
local actions = require('telescope.actions')
local themes = require('telescope.themes')
local trouble = require("trouble.sources.telescope")


-- INFO @etrnal70

local default_ivy = {
    theme = 'ivy',
    -- layout_config = { heigth = 13 }
}

telescope.setup({
    defaults = {
        -- layout_strategy = "flex",
        layout_config = {
            flex = {
                flip_columns = 130,
            },
            horizontal = {
                mirror = false,
                width = 0.8,
            },
            vertical = {
                mirror = false,
            },
        },
        path_display = { "truncate" },
        prompt_prefix = "::  ",
        selection_caret = "- ",
        wrap_results = true,
        file_ignore_patterns = {
            ".git/*",
            "__pycache__/*",
            ".pytest_cache/*",
            ".venv/*",
            "node_modules/*",
            "scratch/.*",
            "sessions/*",
            "go/pkg/*",
        },
        mappings = {
            i = {
                ["<S-Tab>"] = actions.move_selection_previous,
                ["<Tab>"] = actions.move_selection_next,
                ["<ESC>"] = actions.close,
                ["<c-o>"] = actions.toggle_selection,
                ["<c-O>"] = actions.toggle_all,
                ["<c-s-t>"] = trouble.open_with_trouble
            },
            n = { ["<c-s-t>"] = trouble.open_with_trouble },
        },
    },
    pickers = {
        commands = {
            theme = "ivy",
            layout_config = { height = 8 },
        },
        find_files = {
            previewer = false,
            layout_strategy = "horizontal",
            -- layout_strategy = "flex",
            layout_config = {
                flex = {
                    flip_columns = 130,
                },
                horizontal = {
                    mirror = false,
                    width = 0.8,
                },
                vertical = {
                    mirror = false,
                    preview_height = 0.65,
                },
            },
        },
        diagnostics = default_ivy,
        lsp_code_actions = {
            initial_mode = "normal",
            theme = "cursor",
            layout_config = { width = 55 },
        },
        lsp_definitions = default_ivy,
        lsp_implementations = default_ivy,
        lsp_references = default_ivy,
        lsp_type_definitions = default_ivy,
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = false,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            ["ui-select"] = { themes.get_dropdown {} },
        }
    },
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension('env')
telescope.load_extension('ui-select')
-- telescope.load_extension('dap')
