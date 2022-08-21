local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    --[[ "https://github.com/wbthomason/packer.nvim", ]]
    "git@github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'folke/twilight.nvim' -- dims inactive portions of the code you're editing.
  use "windwp/nvim-autopairs" -- A super powerful autopair plugin for Neovim that supports multiple characters.
  use "numToStr/Comment.nvim" --  Smart and Powerful commenting plugin

  -- for WSL copy capability
  use "christianfosli/wsl-copy"

  -- Colorshcemes
  use 'folke/tokyonight.nvim' -- A beautiful colorscheme

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in language server client.
  use "hrsh7th/cmp-nvim-lua" -- nvim-cmp source for neovim Lua API.

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --LSP   **NOTE:It's important that you set up the plugins in the following order:
  use { "williamboman/mason.nvim" } -- LSP installer
  use "williamboman/mason-lspconfig.nvim" -- mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use the both plugins together.
  use "neovim/nvim-lspconfig" -- enable LSP

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',  -- provide some basic functionality such as highlighting
     run = ':TSUpdate'
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- work with treesitter

  --[[ Gitsign ]]
  use 'lewis6991/gitsigns.nvim'

  --[[ Nvim-tree ]]
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  --[[ Bufferline ]]
  use 'akinsho/bufferline.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
