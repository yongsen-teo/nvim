return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      mini = {
        backend = "mini",
        relative = "editor",
        align = "message-right",
        timeout = 500,
        position = {
          row = -1,
          col = -1,
        },
        border = {
          style = "none",
        },
        win_options = {
          winblend = 30,
        },
      },
      cmdline_popup = {
        position = {
          row = "30%",
          col = "50%",
        },
        size = {
          width = "auto",
          height = "auto",
        },
        border = {
          style = "rounded",
          text = {
            top = " Command ",
            top_align = "center",
          },
        },
      },
      popupmenu = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = "auto",
          height = "auto",
        },
        border = {
          style = "rounded",
          text = {
            top = " Completion ",
            top_align = "center",
          },
        },
      },
    },
    lsp = {
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = "auto",
            height = "auto",
          },
          border = {
            style = "rounded",
            text = {
              top = " Command ",
              top_align = "center",
            },
          },
        },
        popupmenu = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = "auto",
            height = "auto",
          },
          border = {
            style = "rounded",
            text = {
              top = " Completion ",
              top_align = "center",
            },
          },
        },
      },
      progress = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      -- Replace full save message with just an icon
      {
        filter = {
          event = "msg_show",
          find = '".-"%s*%d+L, %s*%d+B', -- Matches file path in quotes followed by line/byte count
        },
        opts = { skip = true },
        view = "notify",
        format = function()
          return {
            title = "",
            -- level = "info",
            message = "",
          }
        end,
        data = { message = "" },
        message = "",
      },
      -- Secondary filter for any other "written" messages
      -- {
      --   filter = {
      --     event = "msg_show",
      --     find = "written",
      --   },
      --   opts = { stop = true },
      --   view = "notify",
      --   format = { "{icon}" },
      --   data = { icon = "💾" },
      -- },
      -- -- Standard mini view for other system messages
      -- {
      --   filter = {
      --     event = "msg_show",
      --     any = {
      --       { find = "; after #%d+" },
      --       { find = "; before #%d+" },
      --     },
      --   },
      --   view = "mini",
      -- },
    },
    presets = {
      lsp_doc_border = true,
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  keys = {
    { "<leader>sn", false },
    { "<leader>sna", false },
    { "<leader>snd", false },
    { "<leader>snh", false },
    { "<leader>snl", false },
    { "<leader>nh", "<cmd>Noice history<cr>", desc = "History" },
    {
      "<leader>nl",
      function()
        require("noice").cmd("last")
      end,
      desc = "Last Message",
    },
    {
      "<leader>nd",
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "Dismiss All",
    },
    {
      "<leader>nt",
      function()
        require("noice").cmd("pick")
      end,
      desc = "Noice Picker",
    },
  },
  config = function(_, opts)
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end
    require("noice").setup(opts)
  end,
}
