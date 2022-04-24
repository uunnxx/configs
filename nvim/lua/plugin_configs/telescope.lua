local tele = require('telescope')
local actions = require('telescope.actions')
local themes = require('telescope.themes')




-- INFO @etrnal70

local default_ivy = {
  theme = 'ivy',
  layout_config = { heigth = 13 }
}

tele.setup({
  defaults = {
    layout_strategy = "flex",
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
    prompt_prefix = "➤  ",
    selection_caret = "• ",
    wrap_results = true,
    file_ignore_patterns = {
      "__pycache__/*",
      "__init__.py",
      "%.env",
      "node_modules/*",
      "scratch/.*",
      "sessions/*",
      "%.dll",
      "go/pkg/*",
    },
    mappings = {
      i = {
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<Tab>"] = actions.move_selection_next,
        ["<esc>"] = actions.close,
        ["<C-o>"] = actions.toggle_selection,
        ["<C-O>"] = actions.toggle_all,
      },
    },
  },
  extensions = {
    ["fzf"] = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["ui-select"] = themes.get_dropdown({
      initial_mode = "normal",
      layout_config = {
        height = 7,
        width = 45,
      },
    }),
  },
  pickers = {
    commands = {
      theme = "ivy",
      layout_config = { height = 8 },
    },
    find_files = {
      layout_strategy = "flex",
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
  },
})
















-- INFO  Mine
-- require('telescope').setup = {
--   defaults = {
--     pickers = {
--       find_files = {
--         theme = "ivy",
--       },
--       live_grep = {
--         theme = 'ivy'
--       },
--       buffers = {
--         theme = 'ivy'
--       },
--       help_tags = {
--         theme = 'ivy'
--       },
--     },
--     mappings = {
--       n = {
--         ["q"] = actions.close
--       },
--       i = {
--         ["<esc>"] = actions.close
--       }
--     },
--     vimgrep_arguments = {
--        "rg",
--        "--color=never",
--        "--no-heading",
--        "--with-filename",
--        "--line-number",
--        "--column",
--        "--smart-case",
--     },
--     extensions = {
--       fzf = {
--         fuzzy = true,                    -- false will only do exact matching
--         override_generic_sorter = true,  -- override the generic sorter
--         override_file_sorter = true,     -- override the file sorter
--         case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--       }
--     },
--     prompt_prefix = "   ",
--     selection_caret = "  ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "ascending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       horizontal = {
--         prompt_position = "top",
--         preview_width = 0.55,
--         results_width = 0.8,
--       },
--       vertical = {
--         mirror = false,
--       },
--       height = 0.80,
--       preview_cutoff = 120,
--     },
--     borderchars = {
--       { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
--       prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
--       results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
--       preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
--     },
--     file_sorter = require("telescope.sorters").get_fuzzy_file,
--     file_ignore_patterns = { "node_modules" },
--     generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--     path_display = { "truncate" },
--     color_devicons = true,
--     use_less = true,
--     set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--   }
-- }






-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')
