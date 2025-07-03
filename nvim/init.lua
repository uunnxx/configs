local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","


------------------------------------------------------------------
-- Import files
------------------------------------------------------------------

require('general')
require('plugins')
require('plugins_settings')
require('keymaps')
require('lang_settings')
require('settings')

require('plugin_configs.completion')
require('plugin_configs.gitsigns')
require('plugin_configs.debugging')
require('plugin_configs.lsp_configs')
require('plugin_configs.lualine')
-- require('plugin_configs/nui')
require('plugin_configs.telescope')
require('plugin_configs.ui')

require('plugin_configs.cloak')
