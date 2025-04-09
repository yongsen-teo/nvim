local excluded = {
  ".env",
  "node_modules/",
  "dist/",
  ".next/",
  ".vite/",
  ".gitignore",
  ".gitignore/",
  "*.gitignore/",
  ".git/",
  ".venv/",
  ".gitlab/",
  "build/",
  "target/",
  "dadbod_ui/tmp/",
  "dadbod_ui/dev/",
  "package-lock.json",
  "pnpm-lock.yaml",
  "yarn.lock",
  "*.toml",
  "*.lock",
  "*.python-version",
  ".DS_Store",
  ".pyc",
  "*__pycache__*",
  "*__init__*.pyc", -- Add this pattern for your specific case
  "__init__.py",
}
local root_patterns = {
  -- version control systems
  ".git",

  -- build tools
  "Makefile",
  "CMakeLists.txt",
  "build.xml",

  -- docker
  "Dockerfile",
  "docker-compose.yml",

  -- node.js and javascript
  "package.json",
  "package-lock.json",
  "yarn.lock",
  ".nvmrc",

  -- python
  "requirements.txt",
  "Pipfile",
  "pyproject.toml",
  "setup.py",

  -- configuration files
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".eslintrc",
  ".eslintrc.json",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintignore",
  ".stylelintrc",
  ".stylelintrc.json",
  ".stylelintrc.yaml",
  ".stylelintrc.yml",
  ".editorconfig",
  ".gitignore",

  -- html projects
  "index.html",

  -- miscellaneous
  "README.md",
  "LICENSE",
  "Procfile",
  ".env",
  ".env.example",
  "config.yaml",
  "config.yml",
}
vim.g.root_spec = { root_patterns, "cwd", "lsp" }

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = false },
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 1500,
    },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = {},
    picker = {
      layout = {
        preset = "default",
        layout = {
          backdrop = 70,
        },
      },
      ui_select = true, -- replace `vim.ui.select` with the snacks picker

      sources = {
        projects = { dev = {}, patterns = root_patterns },
        files = {
          hidden = true,
          ignored = true,
        },
      },
      hidden = true,
      ignored = true,
      exclude = excluded,

      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            -- ["<Space><Space>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      -- icons = {
      --   ui = {
      --     ignored = " ",
      --     hidden = " ",
      --     follow = "󰭔 ",
      --   },
      --   git = {
      --     enabled = true, -- show git icons
      --     commit = "󰜘 ", -- used by git log
      --     staged = "● ", -- staged changes. always overrides the type icons
      --     added = " ",
      --     deleted = " ",
      --     ignored = " ",
      --     modified = "○ ",
      --     renamed = "󰑕 ",
      --     unmerged = " ",
      --     untracked = " ",
      --   },
      --   kinds = {
      --     Control = " ",
      --     Collapsed = " ",
      --     Copilot = " ",
      --     Key = " ",
      --     Namespace = "󰦮 ",
      --     Null = " ",
      --     Number = "󰎠 ",
      --     Object = " ",
      --     Package = " ",
      --     String = " ",
      --     Unknown = " ",
      --
      --     -- copy from cmp
      --     Text = "",
      --     Method = "󰊕",
      --     Function = "󰊕",
      --     Constructor = "",
      --     Field = "󰜢",
      --     Variable = "",
      --     Class = "",
      --     Interface = "",
      --     Module = "",
      --     Property = "",
      --     Unit = "",
      --     Value = "",
      --     Enum = "",
      --     Keyword = "󱕴",
      --     Snippet = "",
      --     Color = "",
      --     File = "",
      --     Reference = "",
      --     Folder = "",
      --     EnumMember = "",
      --     Constant = "󰏿",
      --     Struct = "",
      --     Event = "",
      --     Operator = "",
      --     TypeParameter = "",
      --     Boolean = " ",
      --     Array = " ",
      --   },
      -- },
    },
    styles = {
      win = {
        relative = "editor",
        style = "terminal",
        show = true,
        fixbuf = true,
        position = "float",
        minimal = true,
        height = 0.8,
        width = 0.8,
        zindex = 50,
        backdrop = 60,
        wo = {
          winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
          cursorcolumn = false,
          cursorline = false,
          cursorlineopt = "both",
          fillchars = "eob: ,lastline:…",
          list = false,
          listchars = "extends:…,tab:  ",
          number = false,
          relativenumber = false,
          signcolumn = "no",
          spell = false,
          winbar = "",
          statuscolumn = "",
          wrap = false,
          sidescrolloff = 0,
        },
        bo = {},
        keys = {
          q = "close",
          ["<Esc>"] = "close",
          ["<C-c>"] = "close", -- Ctrl+c to hide
          ["jk"] = function(self)
            vim.cmd("stopinsert") -- Exit terminal mode
            self:close() -- Close the window
          end,
        },
      },
      ---@class snacks.notifier.Config
      notifier = {
        {
          timeout = 1500, -- default timeout in ms
          width = { min = 25, max = 0.4 },
          height = { min = 1, max = 0.6 },
          -- editor margin to keep free. tabline and statusline are taken into account automatically
          margin = { top = 0, right = 1, bottom = 0 },
          padding = true, -- add 1 cell of left/right padding to the notification window
          sort = { "level", "added" }, -- sort by level and time
          -- minimum log level to display. TRACE is the lowest
          -- all notifications are stored in history
          level = vim.log.levels.TRACE,
          icons = {
            error = " ",
            warn = " ",
            info = " ",
            debug = " ",
            trace = " ",
          },
          keep = function(notif)
            return vim.fn.getcmdpos() > 0
          end,
          ---@type snacks.notifier.style
          style = "compact",
          top_down = true, -- place notifications from top to bottom
          date_format = "%R", -- time format for notifications
          -- format for footer when more lines are available
          -- `%d` is replaced with the number of lines.
          -- only works for styles with a border
          ---@type string|boolean
          more_format = " ↓ %d lines ",
          refresh = 50, -- refresh at most every 50ms
        },
      },
      ---@class snacks.terminal.Opts: snacks.terminal.Config
      terminal = {
        enabled = true,
        position = "float", -- Make terminal float by default
        height = 0.8, -- 80% of screen height
        width = 0.8, -- 80% of screen width
        border = "rounded", -- Rounded borders
        blend = 10, -- Slight transparency
        winblend = 10,
        cmd = vim.o.shell, -- Use the default shell
      },
    },
    -- Your custom dashboard configuration
    dashboard = {
      enabled = true,
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

      preset = {
        pick = nil,
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            icon = " ",
            key = "n",
            desc = "New File",
            action = ":ene | startinsert",
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            section = "session",
          },
          {
            icon = "󰒲 ",
            key = "L",
            desc = "Lazy",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },

        header = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },

      formats = {
        icon = function(item)
          return { item.icon or " ", width = 2, hl = "icon" }
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname)
            or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
            or { { fname, hl = "file" } }
        end,
      },

      sections = {
        {
          section = "header",
        },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        {
          pane = 2,
          icon = "󰈢 ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          icon = "󰎐 ",
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return vim.fn.system(
              "git rev-parse --is-inside-work-tree 2>/dev/null"
            ) ~= ""
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },

  -- Keep all the default keymaps
  keys = {
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<C-a>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
    -- {
    --   "<C-a>",
    --   function()
    --     Snacks.terminal.open()
    --   end,
    --   desc = "Toggle Terminal",
    -- },
    -- {
    --   "<c-/>",
    --   function()
    --     Snacks.terminal()
    --   end,
    --   desc = "which_key_ignore",
    -- },
    -- {
    --   "<c-_>",
    --   function()
    --     Snacks.terminal()
    --   end,
    --   desc = "which_key_ignore",
    -- },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    -- {
    --   "<leader>a",
    --   function()
    --     Snacks.terminal.toggle(nil, {
    --       cwd = vim.fn.getcwd(),
    --     })
    --   end,
    --   desc = "Toggle Floating Terminal",
    --   mode = { "n", "t" },
    -- },
  },

  -- Keep the default initialization
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle
          .option("relativenumber", { name = "Relative Number" })
          :map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option(
            "conceallevel",
            { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }
          )
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle
          .option(
            "background",
            { off = "light", on = "dark", name = "Dark Background" }
          )
          :map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
