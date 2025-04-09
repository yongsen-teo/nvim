return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- Labels for jump points
    labels = "asdfjklqwerzxc",
    label = {
      enabled = true,
      before = true,
      after = false,
      style = "overlay",
    },
    search = {
      -- Search in all windows
      multi_window = false,
      forward = true,
      wrap = true,
      mode = "exact",
      incremental = true,
      max_length = false,
    },
    jump = {
      jumplist = true,
      -- Position of the match to jump to
      pos = "start", -- 'start' | 'end' | 'range'
      history = true,
      register = true,
      nohlsearch = true,
      autojump = false,
    },
    -- Configuration for the prompt
    prompt = {
      enabled = true,
      prefix = { { "⚡", "FlashPromptIcon" } },
    },
    modes = {
      -- Enable labels for character search mode
      char = {
        enabled = true,
        jump_labels = true,
      },
      search = {
        enabled = true,
      },
    },
    -- Configure keys
    -- keys = {
    --   {
    --     "<CR>",
    --     mode = { "n", "o", "x" },
    --     function()
    --       require("flash").jump({
    --         continue = false,
    --       })
    --     end,
    --     desc = "Flash",
    --   },
    --   {
    --     "<C-CR>",
    --     mode = { "n", "o", "x" },
    --     function()
    --       require("flash").jump({
    --         continue = true,
    --       })
    --     end,
    --     desc = "Flash Continue",
    --   },
    -- },
  },
}
