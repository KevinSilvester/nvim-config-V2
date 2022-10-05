local npairs = require("nvim-autopairs")
local npairs_cmp = require("nvim-autopairs.completion.cmp")

npairs.setup({
   check_ts = true, -- treesitter integration
   disable_filetype = { "TelescopePrompt" },
})

local cmp = require("cmp")

cmp.event:on("confirm_done", npairs_cmp.on_confirm_done())
