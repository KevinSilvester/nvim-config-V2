local plugin = require("core.pack").register_plugin
local conf = require("modules.lsp.config")

plugin({
   "neovim/nvim-lspconfig",
})
-- plugin({
--    "folke/lua-dev.nvim",
--    config = conf.lua_dev
--    -- after = "nvim-lspconfig",
--    -- ft = "lua",
-- })
plugin({
   "b0o/schemastore.nvim",
   -- after = "nvim-lspconfig",
   -- ft = { "json", "yaml" },
})
plugin({
   "jose-elias-alvarez/null-ls.nvim",
   after = "nvim-lspconfig",
   config = conf.null_ls,
})
plugin({
   "jose-elias-alvarez/nvim-lsp-ts-utils",
   after = "nvim-lspconfig",
   ft = "typescript",
})
plugin({
   "jose-elias-alvarez/typescript.nvim",
   after = "nvim-lspconfig",
})
plugin({
   "ray-x/lsp_signature.nvim",
   after = "nvim-lspconfig",
   config = conf.lsp_signature,
})
plugin({
   "folke/lsp-colors.nvim",
   after = "nvim-lspconfig",
})
plugin({
   "j-hui/fidget.nvim",
   after = "nvim-lspconfig",
   config = conf.fidget,
})
plugin({
   "simrat39/rust-tools.nvim",
   -- after = "nvim-lspconfig",
   -- ft = "rust",
})
plugin({
   "mfussenegger/nvim-jdtls",
   after = "nvim-lspconfig",
   ft = "java",
})
plugin({
   "williamboman/mason-lspconfig.nvim",
   after = "nvim-lspconfig",
   config = conf.mason_lspconfig,
})
plugin({
   "williamboman/mason.nvim",
   after = "nvim-lspconfig",
   config = conf.mason,
})
-- plugin({
--    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--    after = "nvim-lspconfig",
--    config = conf.lsp_lines,
-- })
plugin({
   "zbirenbaum/copilot.lua",
   after = "nvim-lspconfig",
   event = { "VimEnter" },
   config = conf.copilot,
})
plugin({
   "SmiteshP/nvim-navic",
   after = "nvim-lspconfig",
   config = conf.nvim_navic,
})
plugin({ "lvimuser/lsp-inlayhints.nvim", after = "nvim-lspconfig" })
