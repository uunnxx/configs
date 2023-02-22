vim.cmd[[
:luafile ~/.config/nvim/init.lua
:luafile ~/.config/nvim/lua/plugins.lua

:luafile ~/.config/nvim/lua/general.lua
:luafile ~/.config/nvim/lua/keymaps.lua
:luafile ~/.config/nvim/lua/plugin_settings.lua
:luafile ~/.config/nvim/lua/settings.lua

:luafile ~/.config/nvim/lua/plugin_configs/completion.lua
:luafile ~/.config/nvim/lua/plugin_configs/gitsigns.lua
:luafile ~/.config/nvim/lua/plugin_configs/lsp_configs.lua
:luafile ~/.config/nvim/lua/plugin_configs/lualine.lua
:luafile ~/.config/nvim/lua/plugin_configs/telescope.lua
:luafile ~/.config/nvim/lua/plugin_configs/ui.lua

]]
