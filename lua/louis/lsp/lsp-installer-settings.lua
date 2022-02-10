-- Get an instance of the installer settings
local installer_found, lsp_installer = pcall(require, 'nvim-lsp-installer')

-- Terminate of there was a problem
if not installer_found then
    return
end

-- Custom settings
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
