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
   nvim_colorizer = function()
      require("modules.editor.config.nvim-colorizer")
   end,
   nvim_surround = function()
      require("modules.editor.config.nvim-surround")
   end,
   vim_illuminate = function()
      require("modules.editor.config.vim-illuminate")
   end,
   todo_comments = function()
      require("modules.editor.config.todo-comments")
   end,
}
