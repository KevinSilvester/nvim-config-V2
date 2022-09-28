local plugin = require("core.pack").register_plugin
local conf = require("modules.tools.config")

plugin({
   "nvim-telescope/telescope.nvim",
   cmd = "Telescope",
   config = conf.telescope,
   requires = {
      { "nvim-lua/popup.nvim", opt = true },
      { "nvim-lua/plenary.nvim", opt = true },
      { "nvim-telescope/telescope-fzy-native.nvim", opt = true },
   },
})

plugin({
   "nvim-telescope/telescope-fzf-native.nvim",
   after = "telescope.nvim",
   run = "make",
})

plugin({
   "MunifTanjim/nui.nvim",
   commit = "e9889bbd9919544697d497537acacd9c67d0de99",
})
