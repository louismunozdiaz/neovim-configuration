local M = {}

-- Shortcut to call vim functions
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

local function install_packer()
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer; close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

function M.bootstrap()
    if fn.empty(fn.glob(install_path)) > 0 then
        install_packer()
    end
end

return M
