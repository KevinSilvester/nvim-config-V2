local config = {
   bufferline = function()
      require("modules.ui.bufferline")
   end,
   dashboard = function()
      require("modules.ui.dashboard")
   end,
   sidebar = function()
      require("modules.ui.sidebar")
   end,
}

return config
