local function augroup(name)
  return vim.api.nvim_create_augroup("autocmd_" .. name, { clear = true })
end

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   callback = function()
--     vim.cmd("echo ''") -- clears the command line
--   end,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if
      vim.tbl_contains(exclude, vim.bo[buf].filetype)
      or vim.b[buf].autocmd_last_loc
    then
      return
    end
    vim.b[buf].autocmd_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "jsonl" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Set up markdown-specific settings when entering a markdown buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "markdown" },
  callback = function()
    -- Basic wrapping settings
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.showbreak = "   "

    -- Calculate margins
    local window_width = vim.api.nvim_win_get_width(0)
    local left_margin = 40
    local right_margin = 40
    local text_width = window_width - left_margin - right_margin

    -- Move the text window to center
    vim.opt_local.signcolumn = "yes:40" -- Add left padding
    vim.wo.foldcolumn = "40" -- Additional left padding

    -- Set up visual boundaries
    vim.opt_local.colorcolumn = tostring(left_margin)
      .. ","
      .. tostring(window_width - right_margin)

    -- Hide the sign column background
    vim.cmd([[highlight SignColumn guibg=NONE]])

    -- Make the colorcolumn more visible with a distinct color
    vim.cmd([[highlight ColorColumn guibg=#2d3343]])

    -- Set text width for automatic wrapping
    vim.opt_local.textwidth = text_width
  end,
})

local numtogGrp = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    local ignore = { "oil", "fzf" }
    if ignore[vim.bo.filetype] then
      return
    end
    vim.wo.relativenumber = true
  end,

  group = numtogGrp,
  desc = "Turn on relative line numbering when the buffer is entered.",
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  callback = function()
    local ignore = { "oil", "fzf" }
    if ignore[vim.bo.filetype] then
      return
    end
    vim.wo.relativenumber = false
  end,
  group = numtogGrp,
  desc = "Turn off relative line numbering when the buffer is exited.",
})

-- Restore default settings when leaving markdown buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "markdown" },
  callback = function()
    -- Reset to default settings
    vim.opt_local.signcolumn = "no"
    vim.wo.foldcolumn = "0"
    vim.opt_local.colorcolumn = "120"
    vim.opt_local.textwidth = 120
  end,
})

-- ensures scroll lines persists when window changes
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.opt.scroll = 10
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.scrolloff = 0
    vim.bo.filetype = "terminal"

    -- Get the current buffer's file path and extension
    local current_file = vim.fn.expand("%:p")
    local file_ext = vim.fn.expand("%:e")

    -- Only run if it's a Python file
    if file_ext == "py" then
      -- Get project root directory and construct venv python path
      local project_root = vim.fn.getcwd()
      local venv_python = project_root .. "/.venv/bin/python"

      -- Send python command to terminal buffer using venv python
      local term_chan = vim.b.terminal_job_id
      if term_chan then
        vim.fn.chansend(term_chan, venv_python .. " " .. current_file .. "\n")
      end
    end
  end,
})
