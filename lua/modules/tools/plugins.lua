local plugin = require("core.pack").register_plugin
local conf = require("modules.tools.config")

plugin({
   "nvim-telescope/telescope.nvim",
   cmd = "Telescope",
   opt = true,
   config = conf.telescope,
   after = { "plenary.nvim", "popup.nvim", "nvim-web-devicons", "nvim-treesitter", "nvim-notify" },
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

plugin({
   "sindrets/diffview.nvim",
   after = "plenary.nvim",
   opt = true,
   cmd = "DiffviewOpen",
   config = conf.diffview,
})

plugin({
   "stevearc/dressing.nvim",
   after = "nui.nvim",
   config = conf.dressing,
})

plugin({
   "akinsho/toggleterm.nvim",
   opt = true,
   cmd = "ToggleTerm",
   keys = "<C-b>",
   config = conf.toggleterm,
})
