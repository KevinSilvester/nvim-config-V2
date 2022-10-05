local plugin = require("core.pack").register_plugin
local conf = require("modules.completion.config")

plugin({
   "neovim/nvim-lspconfig",
   ft = { "lua", "rust", "c", "cpp" },
   config = conf.nvim_lsp,
})

plugin({ "L3MON4D3/LuaSnip", event = "InsertEnter", config = conf.lua_snip })
plugin({ "rafamadriz/friendly-snippets", event = "InsertEnter" })

plugin({
   "hrsh7th/nvim-cmp",
   event = "InsertEnter",
   config = conf.nvim_cmp,
   requires = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      "lukas-reineke/cmp-under-comparator",
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp", event = "CmdlineEnter" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
   },
   after = "LuaSnip",
})
