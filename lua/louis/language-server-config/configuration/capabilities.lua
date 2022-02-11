local M = {}

local isModuleFound, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not isModuleFound then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities) 

return M
