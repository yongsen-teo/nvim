return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      ---@return string
      CustomOilBar = function()
        local path = vim.fn.expand("%")
        path = path:gsub("oil://", "")
        return "  " .. vim.fn.fnamemodify(path, ":.")
      end
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        win_options = {
          winbar = "%{v:lua.CustomOilBar()}",
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            local folder_skip = {
              "dev-tools.locks",
              "dune.lock",
              "_build",
              ".DS_Store",
              "node_modules/",
              ".vite/",
              "build/",
              "*.lock",
              -- Fix the patterns for Python cache files
              "__pycache__", -- Match the exact directory name
              "%.pyc$", -- Use Lua pattern for .pyc files ($ for end of string)
            }
            return vim.tbl_contains(folder_skip, name)
          end,
        },
        delete_to_trash = true,
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 90,
          max_height = 0,
          -- border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
      })

      -- Open parent directory in current window
      vim.keymap.set(
        "n",
        "-",
        "<CMD>Oil<CR>",
        { desc = "Open parent directory" }
      )

      -- Open parent directory in floating window
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end,
  },
}
