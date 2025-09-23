-- ============================================================================
-- Enhanced Neovim Configuration
-- ============================================================================

-- Bootstrap lazy.nvim package manager
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

-- Set leader key early (before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load configuration modules in order
require("options")    -- Load options first
require("keymaps")    -- Load keymaps
require("plugins")    -- Load and configure plugins
require("lsp")        -- Load LSP configuration
