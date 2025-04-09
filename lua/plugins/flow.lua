return {
  "yongsen-teo/flow.nvim",
  branch = "speed",
  keys = {
    {
      "<leader>rs",
      ":FlowRunSelected<CR>",
      mode = "v",
      desc = "Flow Run Selected",
    },
    { "<leader>rr", ":FlowRunFile<CR>", mode = "n", desc = "Flow Run File" },
    { "<leader>rt", ":FlowLauncher<CR>", mode = "n", desc = "Flow Launcher" },
    {
      "<leader>Rp",
      ":FlowRunLastCmd<CR>",
      mode = "n",
      desc = "Flow Run Last Command",
    },
    {
      "<leader>ro",
      ":FlowLastOutput<CR>",
      mode = "n",
      desc = "Flow Last Output",
    },
    {
      "<leader>rh",
      function()
        local _, end_line, _, _ = unpack(vim.fn.getpos("'>"))
        local content =
          table.concat(vim.api.nvim_buf_get_lines(0, 0, end_line, false), "\n")
        require("flow").run_content(content)
      end,
      mode = "v",
      desc = "Flow Run From Top To Selection",
    },
  },
  config = function()
    require("flow").setup({
      output = {
        buffer = true,
        size = "auto",
        focused = true,
        modifiable = true,
      },
      filetype_cmd_map = {
        -- python = "/Users/yongsenteo/Desktop/nec/.venv/bin/python <<-EOF\n%s\nEOF",
        python = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
          .. "/bin/python <<-EOF\n%s\nEOF",
      },
    })
    vim.g.flow_show_command_notification = false
  end,
}
