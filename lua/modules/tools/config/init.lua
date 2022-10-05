local config = {
   telescope = function()
      require("modules.tools.config.telescope")
   end,
   which_key = function()
      require("modules.tools.config.which-key")
   end,
   wilder = function()
      require("modules.tools.config.wilder")
   end,
   diffview = function()
      require("modules.tools.config.diffview")
   end,
   dressing = function()
      require("modules.tools.config.dressing")
   end,
}

return config
