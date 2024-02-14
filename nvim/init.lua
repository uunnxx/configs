local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


------------------------------------------------------------------
-- Import files
------------------------------------------------------------------

require('general')
require('plugins')
require('plugins_settings')
require('keymaps')
require('lang_settings')
require('settings')

require('plugin_configs/completion')
require('plugin_configs/gitsigns')
require('plugin_configs/debugging')
require('plugin_configs/lsp_configs')
require('plugin_configs/lualine')
require('plugin_configs/nui')
require('plugin_configs/telescope')
require('plugin_configs/ui')
