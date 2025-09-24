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

-- Disable providers we don't need (reduces startup time and warnings)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Load configuration modules in order
local config_dir = vim.fn.stdpath("config")
vim.opt.runtimepath:prepend(config_dir)

-- Add the config directory to package.path for proper module loading
package.path = package.path .. ";" .. config_dir .. "/?.lua"

require("options") -- Load options first
require("keymaps") -- Load keymaps
require("plugins") -- Load and configure plugins
require("lsp")     -- Load LSP configuration
