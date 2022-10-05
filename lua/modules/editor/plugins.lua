local plugin = require("core.pack").register_plugin
local conf = require("modules.editor.config")
local utils = require("core.utils")

plugin({
   "nvim-treesitter/nvim-treesitter",
   event = "BufRead",
   run = ":TSUpdate",
   config = conf.nvim_treesitter,
})

plugin({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })

plugin({
   "windwp/nvim-spectre",
   after = { "plenary.nvim", "nvim-web-devicons" },
   config = conf.nvim_spectre,
   opt = true,
})

plugin({
   "wfxr/minimap.vim",
   run = "cargo install --locked code-minimap",
   event = "BufRead",
   config = conf.minimap,
})

plugin({
   "lukas-reineke/indent-blankline.nvim",
   event = "BufRead",
   config = conf.indent_blankline,
})

plugin({
   "windwp/nvim-autopairs",
   event = "InsertEnter",
   config = conf.nvim_autopairs,
})

plugin({
   "numToStr/Comment.nvim",
   event = "BufRead",
   config = conf.comment,
   requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "folke/todo-comments.nvim",
   },
   -- commit = "2c26a00f32b190390b664e56e32fd5347613b9e2"
})

--[[
   vim-surround
   illuminate
   comment
   colorizer
]]
