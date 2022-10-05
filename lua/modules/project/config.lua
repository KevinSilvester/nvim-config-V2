local config = {}

config.project_nvim = function()
   require("project_nvim").setup({
      -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
      detection_methods = { "pattern" },

      -- patterns used to detect root dir, when **"pattern"** is in detection_methods
      patterns = { ".git", "Makefile", "package.json" },
   })
end

config.crates = function()
   require("crates").setup({
      popup = {
         autofocus = true,
         style = "minimal",
         border = "rounded",
         show_version_date = false,
         show_dependency_version = true,
         max_height = 30,
         min_width = 20,
         padding = 1,
      },
      null_ls = {
         enabled = true,
         name = "crates.nvim",
      },
   })
end

config.package_info = function()
   require("package-info").setup({
      colors = {
         up_to_date = "#98be65", -- Text color for up to date dependency virtual text
         outdated = "#d19a66", -- Text color for outdated dependency virtual text
      },
      icons = {
         enable = true, -- Whether to display icons
         style = {
            up_to_date = "|  ", -- Icon for up to date dependencies
            outdated = "|  ", -- Icon for outdated dependencies
         },
      },
      -- display the status of the package in the statusline
      autostart = true, -- Whether to autostart when `package.json` is opened
      hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
      package_manager = "pnpm",
   })
end

return config
