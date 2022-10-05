local config = {
   bufferline = function()
      require("modules.ui.config.bufferline")
   end,
   dashboard = function()
      require("modules.ui.config.dashboard")
   end,
   sidebar = function()
      require("modules.ui.config.sidebar")
   end,
}

return config
