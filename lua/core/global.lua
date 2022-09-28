local utils = require("core.utils")

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_win = (vim.loop.os_uname().sysname == "Widnows_NT") and true or false
vim.g.is_linux = (vim.loop.os_uname().sysname == "Linux") and true or false
vim.g.is_mac = (vim.loop.os_uname().sysname == "Darwin") and true or false
vim.g.catppuccin_flavour = "mocha"
vim.g.material_style = "deep ocean"


------------------------------------------------------------------------
--                      PATH environment variable                     --
------------------------------------------------------------------------
vim.env.PATH = vim.env.PATH
   .. (vim.g.is_win and ";" or ":")
   .. vim.fn.stdpath("data")
   .. "/mason/bin"


------------------------------------------------------------------------
--                          filetype loader                           --
------------------------------------------------------------------------
if vim.version().minor < 8 then
   vim.g.did_load_filetypes = 0
   vim.g.do_filetype_lua = 1
end


------------------------------------------------------------------------
--                          clipboard in WSL                          --
------------------------------------------------------------------------
if vim.fn.has("wsl") then
   vim.g.clipboard = {
      copy = {
         ["+"] = "win32yank.exe -i --crlf",
         ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
         ["+"] = "win32yank.exe -o --lf",
         ["*"] = "win32yank.exe -o --lf",
      },
   }
end

if vim.g.is_mac then
   vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = {
         ["+"] = "pbcopy",
         ["*"] = "pbcopy",
      },
      paste = {
         ["+"] = "pbpaste",
         ["*"] = "pbpaste",
      },
      cache_enabled = 0,
   }
   vim.g.python_host_prog = "/usr/bin/python"
   vim.g.python3_host_prog = "/usr/local/bin/python3"
end


------------------------------------------------------------------------
--                          neovide options                           --
------------------------------------------------------------------------
if vim.fn.exists("g:neovide") then
   vim.g.neovide_refresh_rate = 60
   vim.g.neovide_transparancey = 1
   vim.g.neovide_fullscreen = false
   vim.g.neovide_remember_window_size = true
end


------------------------------------------------------------------------
--                          minimap options                           --
------------------------------------------------------------------------
vim.g.minimap_width = 20
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0
vim.g.minimap_highlight_range = 0
vim.g.minimap_git_colors = 1

