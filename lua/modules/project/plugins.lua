local plugin = require("core.pack").register_plugin
local conf = require("modules.project.config")

plugin({
   "ahmedkhalf/project.nvim",
   config = conf.project_nvim,
})

plugin({
   "vuki656/package-info.nvim",
   after = "nui.nvim",
   config = conf.package_info,
})

plugin({
   "saecki/crates.nvim",
   requires = { "nvim-lua/plenary.nvim" },
   config = conf.crates,
})
