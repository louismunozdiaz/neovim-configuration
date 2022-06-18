local packer_module = {}

-- Shortcut to call vim functions
local fn = vim.fn

-- Automatically install packer

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

function packer_module.install()
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
end

function packer_module.setup(packer)
    if packer_bootstrap then
        packer.sync()
    end
end

return packer_module
