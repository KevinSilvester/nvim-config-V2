local utils = require("core.utils")
local cache_dir = vim.fn.stdpath("cache")


-------------
-- General --
-------------
vim.opt.laststatus = 3                 -- always show status line and only on the last window
vim.opt.fileformats = "unix,mac,dos"   -- use unix EOL format
vim.opt.title = true
vim.opt.showmode = false               -- don't show the current mode
vim.opt.clipboard = "unnamedplus"      -- allow neovim to access system clipboard
vim.opt.cursorline = true              -- highlight the current line
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.virtualedit = "block"
vim.opt.encoding = "utf-8"
vim.opt.viewoptions = "folds,cursor,curdir,slash,unix"
vim.opt.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site/parsers")


------------------
-- Line Numbers --
------------------
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.ruler = true


-----------------
-- Indentation --
-----------------
vim.opt.expandtab = true      -- convert tabs to spaces
vim.opt.shiftwidth = 3        -- number of spaces inserted for indentation
vim.opt.tabstop = 3           -- number of spaces '\t' is worth
vim.opt.softtabstop = 3       -- number of spaces tab/backspace key press is worth
vim.opt.showtabline = 0       -- always show tabline
vim.opt.smartindent = true    -- indent next line based on code style/synctax and indet on current line
vim.opt.smarttab = true
vim.opt.shiftround = true


----------------------
-- Sessions/History --
----------------------
vim.opt.sessionoptions = "curdir,help,tabpages,winsize"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.directory = cache_dir .. "swag/"
vim.opt.undodir = cache_dir .. "undo/"
vim.opt.backupdir = cache_dir .. "backup/"
vim.opt.viewdir = cache_dir .. "view/"
vim.opt.spellfile = cache_dir .. "spell/en.uft-8.add"
vim.opt.history = 2000
vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"


------------
-- Timing --
------------
vim.opt.timeoutlen = 500      -- time to wait for a mapped sequence to complete.
vim.opt.ttimeoutlen = 10      -- time to wait for key code sequence to complete
vim.opt.updatetime = 250      -- write to swap file if nothing is typed. Aslo time for CursorHold
vim.opt.redrawtime = 1500     -- time to redraw the display


----------------
-- Completion --
----------------
vim.opt.complete = ".,w,b,u,k"
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp


------------
-- Search --
------------
vim.opt.ignorecase = true                                      -- ignore case when searching
if utils.executable("rg") then
   vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"  -- command to when running search
   vim.opt.grepformat = "%f:%l:%c:%m"                          -- scanf-like string used format ':grep' command output
end


---------------
-- Behaviors --
---------------
vim.opt.breakat = [[\ \	;:,!?/.+-]]          -- characters that might cause a linbreak if linebreak is on
vim.opt.whichwrap:append("h,l,<,>,[,],~")    -- allow keys to move cursor left/right to move to previous line
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = "useopen"
vim.opt.diffopt = "filler,iwhite,internal,algorithm:patience"
vim.opt.jumpoptions = "stack"
vim.opt.shortmess:append("Ic")
vim.opt.iskeyword:append("-")
vim.opt.foldlevelstart = 99
vim.opt.smartcase = true
vim.opt.formatoptions = "1jcroql"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


----------------
-- Appearance --
----------------
vim.opt.guifont = { "JetBrainsMono NF", ":h9" }
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.winwidth = 30
vim.opt.winminwidth = 10
vim.opt.pumheight = 10
vim.opt.helpheight = 20
vim.opt.previewheight = 12
vim.opt.showcmd = false
vim.opt.signcolumn = "yes"                   -- always show the sign column, otherwise it would shift the text each time
vim.opt.conceallevel = 0                     -- so that `` is visible in mardkown files
vim.opt.fillchars:append({ eob = " " })      -- hide '~' at the end of the buffer
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"


----------------
-- File Types --
----------------
if vim.opt.filetype == "python" then
   vim.opt.shiftwidth = 4
   vim.opt.tabstop = 4
   vim.opt.softtabstop = 4
end

if vim.opt.filetype == "yaml" then
   vim.opt.shiftwidth = 3
   vim.opt.tabstop = 3
   vim.opt.softtabstop = 3
end


-----------
-- Shell --
-----------
if vim.g.is_win then
   -- ref: https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#windows
   local powershell_options = {
      shell = utils.executable("pwsh") and "pwsh" or "powershell",
      shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      shellquote = "",
      shellxquote = "",
   }

   for option, value in pairs(powershell_options) do
      vim.opt[option] = value
   end
else
   vim.opt.shell = "fish"
end


------------------------
-- For Neovim Nightly --
------------------------
if utils.is_nightly() then
   vim.opt.cmdwinheight = 5
   vim.opt.equalalways = false
   vim.opt.display = "lastline"
   vim.opt.showbreak = "???  "
   vim.opt.listchars = "tab:????,nbsp:+,trail:??,extends:???,precedes:???"
   vim.opt.pumblend = 10
   vim.opt.winblend = 10
end
