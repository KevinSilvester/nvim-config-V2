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
   opt = true
})

plugin({
   "wfxr/minimap.vim",
   run = "cargo install --locked code-minimap",
   event = "BufRead",
})

--[[
   vim-surround
   minimap
   indent-blankline
   vim-commentary
   illuminate
   gitsigns
   autopairs
   comment
   colorizer
]]