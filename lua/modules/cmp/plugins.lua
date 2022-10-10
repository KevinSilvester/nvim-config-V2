local plugin = require("core.pack").register_plugin
local conf = require("modules.cmp.config")

-- plugin({
--    "neovim/nvim-lspconfig",
--    ft = { "lua", "rust", "c", "cpp" },
--    config = conf.nvim_lsp,
-- })

plugin({ "L3MON4D3/LuaSnip", config = conf.lua_snip })
plugin({ "rafamadriz/friendly-snippets" })

plugin({
   "hrsh7th/nvim-cmp",
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
      {
         "zbirenbaum/copilot-cmp",
         after = { "copilot.lua" },
         config = function()
            require("copilot_cmp").setup()
         end,
      },
   },
   after = "LuaSnip",
})

-- plugin({
--    "zbirenbaum/copilot-cmp",
--    after = { "copilot.lua" },
--    config = function()
--       require("copilot_cmp").setup()
--    end,
-- })

-- plugin({ "hrsh7th/cmp-nvim-lsp" })
-- plugin({ "hrsh7th/cmp-path" })
-- plugin({ "hrsh7th/cmp-buffer" })
-- plugin({ "hrsh7th/cmp-nvim-lsp-signature-help" })
-- plugin({ "hrsh7th/cmp-nvim-lua" })
-- plugin({ "saadparwaiz1/cmp_luasnip" })
-- plugin({ "lukas-reineke/cmp-under-comparator" })
-- plugin({ "hrsh7th/cmp-cmdline" })
plugin({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
