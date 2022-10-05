vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

require("nvim-treesitter.configs").setup({
   ensure_installed = "all",
   auto_install = true,
   sync_install = false,
   ignore_install = { "phpdoc" },
   highlight = {
      enable = true,
   },
   indent = {
      enable = true,
      disable = { "python", "css" },
   },
   textobjects = {
      select = {
         enable = true,
         keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
         },
      },
   },
   parser_install_dir = vim.fn.stdpath("data") .. "/site/parsers",
})
