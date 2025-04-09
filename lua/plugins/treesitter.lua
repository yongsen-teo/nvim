return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<C-e>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "bash",
        "fish",
        "dockerfile",
        "ninja",
        "lua",
        "gitignore",
        "python",
        "markdown",
        "markdown_inline",
        "javascript",
        "typescript",
        "html",
        "css",
        "yaml",
        "xml",
      },
      auto_install = false, -- Set to false to disable auto-installation
      -- Add the incremental_selection configuration
      incremental_selection = {
        keymaps = {
          init_selection = "<C-e>", -- Use your preferred key here
          node_incremental = "<C-e>", -- Use your preferred key here
          node_decremental = "<bs>", -- Keep as is
          scope_incremental = false, -- Keep as is
        },
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = true, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
