local cmp_nvim_lsp = require("cmp_nvim_lsp")
local key = require("core.keymap")
local buf_nmap = key.buf_nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

local M = {}

---Setup LSP keymaps
---@private
---@param bufnr number The buffer number
M.set_lsp_keymaps = function(bufnr)
   -- stylua: ignore
   buf_nmap(bufnr, {
      { "K",     cmd("lua vim.lsp.buf.hover()"),              opts(noremap, silent) },
      { "D",     cmd("lua vim.lsp.buf.type_definintion()"),   opts(noremap, silent) },
      { "gD",    cmd("lua vim.lsp.buf.declaration()"),        opts(noremap, silent) },
      { "gd",    cmd("lua vim.lsp.buf.definition()"),         opts(noremap, silent) },
      { "gI",    cmd("lua vim.lsp.buf.implementation()"),     opts(noremap, silent) },
      { "gl",    cmd("lua vim.diagnostic.open_float()"),      opts(noremap, silent) },
      { "gr",    cmd("lua vim.lsp.buf.references()"),         opts(noremap, silent) },
      { "gQ",    cmd("lua vim.diagnostic.setqflist()"),       opts(noremap, silent) },
      { "<C-[>", cmd("lua vim.diagnostic.goto_prev({buffer=0})"), opts(noremap, silent) },
      { "<C-]>", cmd("lua vim.diagnostic.goto_next({buffer=0})"), opts(noremap, silent) },
   })
end

---Attach nvim-navic
---@private
---@param client table The LSP client
---@param bufnr number The buffer number
M.attach_navic = function(client, bufnr)
   vim.g.navic_silence = true
   local status_ok, navic = pcall(require, "nvim-navic")
   if status_ok then
      navic.attach(client, bufnr)
      vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
   end
end

M.diagnostics = function()
   local icons = require("modules.ui.icons").diagnostics

   local signs = {
      { name = "DiagnosticSignError", text = icons.Error },
      { name = "DiagnosticSignWarn", text = icons.Warning },
      { name = "DiagnosticSignHint", text = icons.Hint },
      { name = "DiagnosticSignInfo", text = icons.Info },
   }

   for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
   end

   vim.diagnostic.config({
      virtual_text = true, -- show virtual text
      signs = { active = signs }, -- show signs
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
         focusable = true,
         style = "minimal",
         border = "rounded",
         source = "always",
         header = "",
         prefix = "",
      },
   })
end

M.handlers = function()
   local h = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
   }

   for k, v in pairs(h) do
      vim.lsp.handlers[k] = v
   end
end

---Enable completions from lsp
---@return table
-- M.capabilities = function()
--    local c = vim.lsp.protocol.make_client_capabilities()
--    c.textDocument.completion.completionItem.snippetSupport = true
--    c = cmp_nvim_lsp.update_capabilities(c)
--    return c
-- end
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

---After attaching to a buffer, set keymaps, attach nvim-navic and vim-illuminate
---@param client table
---@param bufnr number
M.on_attach = function(client, bufnr)
   M.set_lsp_keymaps(bufnr)
   M.attach_navic(client, bufnr)
   require("illuminate").on_attach(client)

   local format_disable = {
      "sumneko_lua",
      "rust_analyzer",
      "marksman",
      "tsserver",
      "jsonls",
      "cssls",
      "html",
   }

   for _, server in pairs(format_disable) do
      if client.name == server then
         client.server_capabilities.document_formatting = false
      end
   end

   if client.name == "jdtls" then
      vim.lsp.codelens.refresh()
      if JAVA_DAP_ACTIVE then
         require("jdtls").setup_dap({ hotcodereplace = "auto" })
         require("jdtls.dap").setup_dap_main_class_configs()
      end
   end
end

return M
