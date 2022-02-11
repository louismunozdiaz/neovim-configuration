local isModuleLoaded, supportedServers = pcall(require, 'nvim-lsp-installer.servers')

if not isModuleLoaded then
    return
end

local serversToInstall = {
    'tsserver',
    'jdtls',
    'sumneko_lua'
}

for _, serverName in pairs(serversToInstall) do

    local isServerAvailable, server = supportedServers.get_server(serverName)
    if isServerAvailable then
        server:on_ready(function ()
            local opts = {
                on_attach = require('louis.language-server-config.configuration.keybinds').on_attach,
                capabilities = require('louis.language-server-config.configuration.capabilities').capabilities
            }
            server:setup(opts)
        end)
        if not server:is_installed() then
            server:install()
        end
    end

end
