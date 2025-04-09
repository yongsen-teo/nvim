return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    keywords = {
      BUG = { icon = "", color = "error" },
      FIXME = { icon = "", color = "error" },
      HACK = { icon = "", color = "info" },
      NOTE = { icon = "❦", color = "info" },
      TODO = { icon = "★", color = "actionItem" },
      WARN = { icon = "󰀦", color = "warning" },
      WARNING = { icon = "󰀦", color = "warning" },
    },
    colors = {
      actionItem = { "ActionItem", "#ffd700" },
      default = { "Identifier", "#37f499" },
      error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#f16c75" },
      info = { "LspDiagnosticsDefaultInformation", "#ebfafa" },
      warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#f7c67f" },
    },
  },
}
--   "folke/todo-comments.nvim",
--   vscode = false,
--   dependencies = { "nvim-lua/plenary.nvim" },
--   opts = {
--     signs = true, -- show icons in the signs column
--     merge_keywords = false, -- use only these
--     keywords = {
--       BUG = { icon = "", color = "error" },
--       FIXME = { icon = "", color = "error" },
--       HACK = { icon = "", color = "info" },
--       NOTE = { icon = "❦", color = "info" },
--       TODO = { icon = "★", color = "actionItem" },
--       WARN = { icon = "󰀦", color = "warning" },
--       WARNING = { icon = "󰀦", color = "warning" },
--     },
--     colors = {
--       actionItem = { "ActionItem", "#f1fc79" },
--       default = { "Identifier", "#37f499" },
--       error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#f16c75" },
--       info = { "LspDiagnosticsDefaultInformation", "#ebfafa" },
--       warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#f7c67f" },
--     },
--     highlight = {
--       keyword = "bg",
--       pattern = [[.*<(KEYWORDS)\s*]],
--     },
--     search = {
--       command = "rg",
--       args = {
--         "--color=never",
--         "--no-heading",
--         "--with-filename",
--         "--line-number",
--         "--column",
--       },
--       pattern = [[\b(KEYWORDS)\b]],
--     },
--   },
--   keys = {
--     {
--       "<leader>st",
--       function()
--         require("todo-comments.fzf").todo({ keywords = { "TODO" } })
--       end,
--       desc = "TODO List",
--     },
--     {
--       "<leader>sT",
--       function()
--         require("todo-comments.fzf").todo({ keywords = { "TODO", "FIXME", "FIX" } })
--       end,
--       desc = "TODO/FIX/ List",
--     },
--   },
-- }
