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
   notifications = function()
      require("modules.ui.config.notifications")
   end,
}

return config
