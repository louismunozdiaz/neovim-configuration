local isModuleLoaded, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not isModuleLoaded then
    return
end

lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}
