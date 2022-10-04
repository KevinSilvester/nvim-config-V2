local plugin = require("core.pack").register_plugin
local conf = require("modules.ui.config")

plugin({ "glepnir/zephyr-nvim" })
plugin({ "folke/tokyonight.nvim" })
plugin({ "lunarvim/darkplus.nvim" })
plugin({ "lunarvim/onedarker.nvim" })
plugin({ "rebelot/kanagawa.nvim" })
plugin({ "marko-cerovac/material.nvim" })
plugin({ "olimorris/onedarkpro.nvim" })

plugin({
   "goolord/alpha-nvim",
   config = conf.dashboard,
   requires = "kyazdani42/nvim-web-devicons",
})

plugin({
   "feline-nvim/feline.nvim",
   requires = "kyazdani42/nvim-web-devicons",
})

plugin({
   "kyazdani42/nvim-tree.lua",
   config = conf.sidebar,
   requires = "kyazdani42/nvim-web-devicons",
})

plugin({
   "akinsho/nvim-bufferline.lua",
   config = conf.bufferline,
   requires = "kyazdani42/nvim-web-devicons",
})
