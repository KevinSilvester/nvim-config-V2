local plugin = require("core.pack").register_plugin
local conf = require("modules.cmp.config")

-- plugin({
--    "neovim/nvim-lspconfig",
--    ft = { "lua", "rust", "c", "cpp" },
--    config = conf.nvim_lsp,
-- })

-- plugin({"hrsh7th/nvim-cmp", })
-- plugin({ "hrsh7th/cmp-nvim-lsp" , requires = { {"hrsh7th/nvim-cmp", }}})
-- -- plugin({ "hrsh7th/cmp-path" , requires = { {"hrsh7th/nvim-cmp", }}})
-- -- plugin({ "hrsh7th/cmp-buffer" , requires = { {"hrsh7th/nvim-cmp", }}})
-- -- plugin({ "hrsh7th/cmp-nvim-lsp-document-symbol" , requires = { {"hrsh7th/nvim-cmp", }}})

-- plugin({ "L3MON4D3/LuaSnip" })
-- plugin({ "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp"  }})
-- plugin({ "rafamadriz/friendly-snippets" })

-- plugin({
--    "hrsh7th/nvim-cmp",
--    requires = {
--       -- { "hrsh7th/cmp-nvim-lsp" },
--       -- { "hrsh7th/cmp-path" },
--       -- { "hrsh7th/cmp-nvim-lsp-document-symbol" }
--       -- { "hrsh7th/cmp-buffer",},
--       -- { "hrsh7th/cmp-nvim-lsp-signature-help",},
--       -- { "hrsh7th/cmp-nvim-lua",},
--    --    { "saadparwaiz1/cmp_luasnip",},
--    --    "lukas-reineke/cmp-under-comparator",
--    --    { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
--    --    { "hrsh7th/cmp-nvim-lsp-document-symbol",},
--    --    {
--    --       "zbirenbaum/copilot-cmp",
--    --       after = { "copilot.lua" },
--    --       config = function()
--    --          require("copilot_cmp").setup()
--    --       end,
--    --    },
--    },
--    after = "LuaSnip",
-- })

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
-- plugin({ "hrsh7th/cmp-nvim-lsp-document-symbol" })

plugin({
   'hrsh7th/nvim-cmp',
   event = 'InsertEnter',
   config = conf.nvim_cmp,
   requires = {
     { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
     { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
     { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
     { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
   },
 })

 plugin({ 'L3MON4D3/LuaSnip', config = conf.lua_snip })