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
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip'
    }

    -- Automatically set up the configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    local auto_installer = require "packer-autoinstaller"
    auto_installer.bootstrap()
end)
