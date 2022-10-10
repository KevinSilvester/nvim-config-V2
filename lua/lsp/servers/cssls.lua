local M = {}

M.settings = {
   css = {
      lint = {
         unknownAtRules = "ignore",
      },
   },
   scss = {
      lint = {
         unknownAtRules = "ignore",
      },
   },
}

M.on_attach = function(client, bufnr)
   require("lsp.setup").set_lsp_keymaps(bufnr)
   require("lsp.setup").attach_navic(client, bufnr)
   client.server_capabilities.documentFormattingProvider = false
   client.server_capabilities.documentRangeFormattingProvider = false
end

return M
