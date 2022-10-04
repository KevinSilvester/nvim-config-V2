local config = {
   telescope = function()
      require("modules.tools.telescope")
   end,
   which_key = function()
      require("modules.tools.which-key")
   end,
   wilder = function()
      require("modules.tools.wilder")
   end,
}

return config
