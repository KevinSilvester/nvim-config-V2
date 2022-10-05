local plugin = require("core.pack").register_plugin
local conf = require("modules.tools.config")

plugin({
   "nvim-telescope/telescope.nvim",
   cmd = "Telescope",
   config = conf.telescope,
   opt = true,
   after = { "plenary.nvim", "popup.nvim", "nvim-web-devicons", "nvim-treesitter" },
})

plugin({
   "nvim-telescope/telescope-fzf-native.nvim",
   after = "telescope.nvim",
   run = "make clean && make",
})

plugin({
   "folke/which-key.nvim",
   config = conf.which_key,
})

plugin({ "MunifTanjim/nui.nvim" })

plugin({ "gelguy/wilder.nvim", config = conf.wilder })
