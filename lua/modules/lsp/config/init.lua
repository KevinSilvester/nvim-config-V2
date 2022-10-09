local config = {
   null_ls = function()
      require("modules.lsp.config.null-ls")
   end,

   mason = function()
      require("modules.lsp.config.mason")
   end,

   mason_lspconfig = function()
      require("modules.lsp.config.mason-lspconfig")
   end,

   lsp_signature = function()
      require("modules.lsp.config.lsp-signature")
   end,

   fidget = function()
      require("modules.lsp.config.fidget")
   end,

   copilot = function()
      vim.defer_fn(function()
         require("modules.lsp.config.copilot")
      end, 100)
   end,

   lsp_lines = function()
      require("modules.lsp.config.lsp_lines")
   end,

   nvim_navic = function()
      require("modules.lsp.config.nvim-navic")
   end,

   lua_dev = function()
      require("modules.lsp.config.lua-dev")
   end,
}

return config

-- require("modules.lsp.config.lsp-signature")
-- require("modules.lsp.config.mason")
-- require("modules.lsp.config.null-ls")
-- require("modules.lsp.config.fidget")
