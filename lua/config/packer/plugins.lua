local packer_installer = require('config.packer.autoinstaller')
packer_installer.install()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

-- Install plugins here
return packer.startup(function(use)
    -- Packer 
    use "wbthomason/packer.nvim" 

    -- Theme
    use 'navarasu/onedark.nvim'

    -- Automatically set up the configuration after cloning packer.nvim
    packer_installer.setup(packer)
end)
