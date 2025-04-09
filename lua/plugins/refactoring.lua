return {
  "ThePrimeagen/refactoring.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>R", "", desc = "+refactor", mode = { "n", "v" } },
    -- {
    --   "<leader>rs",
    --   pick,
    --   mode = "v",
    --   desc = "Refactor",
    -- },
    {
      "<leader>Ri",
      function()
        require("refactoring").refactor("Inline Variable")
      end,
      mode = { "n", "v" },
      desc = "Inline Variable",
    },
    {
      "<leader>Rb",
      function()
        require("refactoring").refactor("Extract Block")
      end,
      desc = "Extract Block",
    },
    {
      "<leader>Rf",
      function()
        require("refactoring").refactor("Extract Block To File")
      end,
      desc = "Extract Block To File",
    },
    {
      "<leader>RP",
      function()
        require("refactoring").debug.printf({ below = false })
      end,
      desc = "Debug Print",
    },
    {
      "<leader>Rp",
      function()
        require("refactoring").debug.print_var({ normal = true })
      end,
      desc = "Debug Print Variable",
    },
    {
      "<leader>Rc",
      function()
        require("refactoring").debug.cleanup({})
      end,
      desc = "Debug Cleanup",
    },
    {
      "<leader>Rf",
      function()
        require("refactoring").refactor("Extract Function")
      end,
      mode = "v",
      desc = "Extract Function",
    },
    {
      "<leader>RF",
      function()
        require("refactoring").refactor("Extract Function To File")
      end,
      mode = "v",
      desc = "Extract Function To File",
    },
    {
      "<leader>Rx",
      function()
        require("refactoring").refactor("Extract Variable")
      end,
      mode = "v",
      desc = "Extract Variable",
    },
  },
  opts = {
    prompt_func_return_type = {
      go = false,
      java = false,
      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    prompt_func_param_type = {
      go = false,
      java = false,
      cpp = false,
      c = false,
      h = false,
      hpp = false,
      cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = true, -- shows a message with information about the refactor on success
  },
  config = function(_, opts)
    require("refactoring").setup(opts)
    if LazyVim.has("telescope.nvim") then
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("refactoring")
      end)
    end
  end,
}
