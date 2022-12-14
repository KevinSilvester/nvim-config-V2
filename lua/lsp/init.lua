local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
   return
end

local typescript_ok, typescript = pcall(require, "typescript")
if not typescript_ok then
   return
end

local setup = require("lsp.setup")
setup.handlers()
setup.diagnostics()

local default_opts = {
   on_attach = setup.on_attach,
   capabilities = setup.capabilities,
}

for _, server in ipairs(vim.g.lsp_servers) do
   if server == "cssls" then
      lspconfig.cssls.setup({
         capabilities = setup.capabilities,
         on_attach = require("lsp.servers.cssls").on_attach,
         settings = require("lsp.servers.cssls").settings,
      })
      goto continue
   end

   if server == "emmet_ls" then
      lspconfig.emmet_ls.setup({
         capabilities = setup.capabilities,
         on_attach = setup.on_attach,
         cmd = require("lsp.servers.emmet_ls").cmd,
         filetypes = require("lsp.servers.emmet_ls").filetypes,
      })
      goto continue
   end

   if server == "eslint" then
      lspconfig.eslint.setup({
         capabilities = setup.capabilities,
         on_attach = require("lsp.servers.eslint").on_attach,
         settings = require("lsp.servers.eslint").settings,
      })
      goto continue
   end

   if server == "jsonls" then
      lspconfig.jsonls.setup({
         capabilities = setup.capabilities,
         on_attach = setup.on_attach,
         settings = require("lsp.servers.jsonls").settings,
         setup = require("lsp.servers.jsonls").setup,
      })
      goto continue
   end

   if server == "powershell_es" then
      lspconfig.powershell_es.setup({
         capabilities = setup.capabilities,
         on_attach = setup.on_attach,
         cmd = require("lsp.servers.powershell_es").cmd,
         bundle_path = require("lsp.servers.powershell_es").bundle_path,
      })
      goto continue
   end

   if server == "pyright" then
      lspconfig.pyright.setup({
         capabilities = setup.capabilities,
         on_attach = setup.on_attach,
         settings = require("lsp.servers.pyright").settings,
      })
      goto continue
   end

   if server == "rust_analyzer" then
      local rust_tools_ok, rust_tools = pcall(require, "rust-tools")
      if rust_tools_ok then
         local rust_opts = require("lsp.servers.rust-tools")
         rust_tools.setup(rust_opts)
      end
      goto continue
   end

   if server == "sumneko_lua" then
      lspconfig.sumneko_lua.setup({
         capabilities = setup.capabilities,
         on_attach = setup.on_attach,
         settings = require("lsp.servers.sumneko_lua").settings,
      })
      goto continue
   end

   if server == "tailwindcss" then
      lspconfig.tailwindcss.setup({
         capabilities = require("lsp.servers.tailwindcss").capabilities,
         filetypes = require("lsp.servers.tailwindcss").filetypes,
         init_options = require("lsp.servers.tailwindcss").init_options,
         on_attach = require("lsp.servers.tailwindcss").on_attach,
         settings = require("lsp.servers.tailwindcss").settings,
      })
      goto continue
   end

   if server == "tsserver" then
      typescript.setup({
         disable_commands = false, -- prevent the plugin from creating Vim commands
         debug = false, -- enable debug logging for commands
         -- LSP Config options
         server = {
            capabilities = require("lsp.servers.tsserver").capabilities,
            handlers = require("lsp.servers.tsserver").handlers,
            on_attach = require("lsp.servers.tsserver").on_attach,
            settings = require("lsp.servers.tsserver").settings,
         },
      })
      goto continue
   end

   if server == "vuels" then
      lspconfig.vuels.setup({
         filetypes = require("lsp.servers.vuels").filetypes,
         on_attach = setup.on_attach,
         init_options = require("lsp.servers.vuels").init_options,
      })
      goto continue
   end

   if server == "yamlls" then
      lspconfig.yamlls.setup({
         capabilities = setup.capabilities,
         on_attach = setup.on_attach,
         settings = require("lsp.servers.yamlls").settings,
      })
      goto continue
   end

   if server == "jdtls" then
      goto continue
   end

   lspconfig[server].setup(default_opts)
   ::continue::
end

return {}
