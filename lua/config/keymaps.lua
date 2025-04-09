local keymap = vim.keymap

-- Remap paste without losing text
-- vim.keymap.set("v", "p", '"_dP')
-- Also swap them in visual mode if needed
-- map("n", "p", "p", { desc = "Paste after cursor" }) -- Default behavior
-- map("n", "P", "P", { desc = "Paste before cursor" }) -- Default behavior

-- --- Modify Visual mode paste ---

-- When 'p' is pressed in Visual mode:
-- 1. "_d : Delete the visual selection into the black hole register (discard it).
-- 2. P   : Paste the content of the default register (`"`) *before* the cursor.
--          Using 'P' here is often necessary because after deleting the selection,
--          the cursor might be positioned differently, and 'P' usually puts
--          the pasted text back where the selection originally was.
keymap.set(
  "v",
  "p",
  '"_dP',
  { desc = "Paste (Replace) without yanking selection" }
)

-- Make 'P' behave the same way in Visual mode (consistent non-register-clobbering paste)
keymap.set(
  "v",
  "P",
  '"_dP',
  { desc = "Paste (Replace) without yanking selection" }
) -- Same underlying command

-- print("INFO: Visual mode p/P configured to paste without clobbering register.")

-- Buffer navigation
vim.keymap.set(
  "n",
  "<leader>a",
  "<cmd>bprevious<cr>",
  { desc = "Previous buffer" }
)

-- shortcuts for running lua
keymap.set("n", "<space>xc", "<cmd>source %<CR>")
keymap.set("n", "<space>x", ":.lua<CR>")
keymap.set("v", "<space>x", ":lua<CR>")
keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- keymap.map("t", "<C-space>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- keymap.map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

---- Disable the Ctrl+Space keybinding
-- vim.keymap.del({ "i", "n", "s" }, "<C-Space>")

------------------------------------------------------------
-- Remove the default terminal keybinding (Ctrl+/)
-- vim.keymap.del("n", "<C-/>")
-- vim.keymap.del("t", "<C-/>")
--
-- -- Add your custom keybinding (Ctrl+LEADER)
-- -- Replace LEADER with your actual leader key, e.g., <C-Space>
-- vim.keymap.set("n", "<C-Space>", function()
--   require("lazyvim.util").terminal(
--     nil,
--     { cwd = require("lazyvim.util").root() }
--   )
-- end, { desc = "Terminal (root dir)" })
-- vim.keymap.set("t", "<C-Space>", "<cmd>close<cr>", { desc = "Hide Terminal" })
------------------------------------------------------------

vim.keymap.set("n", "<leader>a", "<cmd>e #<cr>", {
  desc = "Switch to Other Buffer",
  silent = true,
  nowait = true,
})

-- Open a terminal at the bottom of the screen with a fixed height.
keymap.set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

-- Move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Jump to next/previous empty line with forced overwrite
vim.keymap.set("n", "<C-j>", function()
  vim.cmd([[silent! normal! }]])
end, { desc = "Jump to next empty line" })

vim.keymap.set("n", "<C-k>", function()
  vim.cmd([[silent! normal! {]])
end, { desc = "Jump to previous empty line" })

-- Scrolling keybinds
vim.keymap.set("n", "<C-u>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "10j", { noremap = true, silent = true })

-- Neotree keybinds
-- Jump to left split window
keymap.set("n", "<c-h>", "<C-w><c-h>")
-- Jump to right split window
keymap.set("n", "<c-l>", "<C-w><c-l>")

-- Delete a word backwards
keymap.set("n", "dw", "dvb")

-- Select till end of line
keymap.set("v", "E", "$", { noremap = true, silent = true })

-- Setting Ctrl-C for escape in insert mode
keymap.set("i", "<C-c>", "<Esc>")

-- Ctrl+f to search rather than '/'
keymap.set("n", "<C-f>", "/", { silent = true })
keymap.set("n", "<C-Space>", "<C-/>", { silent = true })

vim.api.nvim_set_keymap(
  "t",
  "<C-a>",
  "<Cmd>close<CR>",
  { noremap = true, silent = true, desc = "Close Terminal" }
)

local telescope_ignore_patterns = {
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "[^a-z]stub[^a-z]",
  "[^a-z]LICENSE[^a-z]",
  "[^a-z]init[^a-z]",
  "[^a-z]Procfile[^a-z]",
  "init[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
  "Stub[^a-z]",
  "%.config$",
  "%.conf$",
  "%.toml$",
  "%.json$",
  "%.DS_Store$",
  "%.gitignore$",
  "%.ebignore$",
  "^Procfile$", -- Add this line to ignore files named "Procfile"
  "^LICENSE$", -- Add this line to ignore files named "LICENSE"
  "node_modules/.*",
  "%.env",
  "yarn.lock",
  "package-lock.json",
  "lazy-lock.json",
  "init.sql",
  "target/.*",
  ".git/.*",
}

-- Set the default value of telescope_ignore_enabled to true
-- vim.g.telescope_ignore_enabled = true

vim.keymap.set("n", "<leader>NB", ":Neotree<CR>")

-- Update Telescope configuration to use the ignore patterns by default
-- require("telescope.config").set_defaults({
--   file_ignore_patterns = telescope_ignore_patterns,
-- })
--
-- -- Key mapping to toggle the ignore patterns
-- vim.keymap.set("n", "<leader>uI", function()
--   vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled
--   require("telescope.config").set_defaults({
--     file_ignore_patterns = vim.g.telescope_ignore_enabled
--         and telescope_ignore_patterns
--       or {},
--   })
-- end, { noremap = true, desc = "Toggle telescope ignore patterns" })
