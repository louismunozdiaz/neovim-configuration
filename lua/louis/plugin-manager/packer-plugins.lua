-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local isModuleLoaded, packer = pcall(require, "packer")

if not isModuleLoaded then
  return
end

-- Install plugins here
return packer.startup(function(use)
    -- Packer 
    use "wbthomason/packer.nvim" 

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    
    -- LSP Config
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
    }

    -- Autocomplete & Snippets
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip'
    }

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Automatically set up the configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    local auto_installer = require "louis.plugin-manager.packer-autoinstaller"
    auto_installer.bootstrap()
end)
