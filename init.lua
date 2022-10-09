local ok, impatient = pcall(require, "impatient")
if ok then
   impatient.enable_profile()
end

local utils = require("core.utils")

-- Create cache dir and subs dir
local ufs = utils.fs
local cache_dir = vim.fn.stdpath("cache")

local createdir = function()
   local data_dir = {
      cache_dir .. "/backup",
      cache_dir .. "/session",
      cache_dir .. "/swap",
      cache_dir .. "/tags",
      cache_dir .. "/undo",
   }

   if not ufs.is_dir(cache_dir) then
      ufs.mkdir(cache_dir)
      for _, v in pairs(data_dir) do
         if not ufs.is_dir(v) then
            ufs.mkdir(v)
         end
      end
   end
end

createdir()

-- load options
require("core.global")
require("core.options")

local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not ok then
   vim.notify("Failed to load colorscheme")
end

-- load autocmds
require("core.autocmds")
require("core.cmds")

-- load plugins
local pack = require("core.pack")
pack.ensure_plugins()
pack.load_compile()

-- load keymaps
require("keymap")

-- require("modules.lsp.config")

-- set colorscheme

-- load lsp
require("lsp")
