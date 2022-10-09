local M = {}

local on_attach = function(client, bufnr)
   client.server_capabilities.documentFormattingProvider = false
   local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
   end

   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

M.on_attach = on_attach

M.settings = {
   codeAction = {
      disableRuleComment = {
         enable = true,
         location = "separateLine",
      },
      showDocumentation = {
         enable = true,
      },
   },
   codeActionOnSave = {
      enable = false,
      mode = "all",
   },
   format = false,
   nodePath = "",
   onIgnoredFiles = "off",
   packageManager = "pnpm",
   quiet = false,
   rulesCustomizations = {},
   run = "onType",
   useESLintClass = false,
   validate = "on",
   workingDirectory = {
      mode = "location",
   },
}

return M
