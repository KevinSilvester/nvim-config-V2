return {
   nvim_treesitter = function()
      require("modules.editor.config.nvim-treesitter")
   end,
   nvim_spectre = function()
      require("modules.editor.config.nvim-spectre")
   end,
   minimap = function()
      require("modules.editor.config.minimap")
   end,
   indent_blankline = function()
      require("modules.editor.config.indent-blankline")
   end,
   nvim_autopairs = function()
      require("modules.editor.config.nvim-autopairs")
   end,
   comment = function()
      require("modules.editor.config.comment")
   end,
}
