return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        -- Python
        pyright = {
          filetypes = { "python" },
          single_file_support = true,
          disableOrganizeImports = true,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                pythonPath = "~/Desktop/nec/.venv/bin/python",
                analysis = {
                  autoSearchPaths = true,
                },
              },
            },
          },
        },

        -- Ruff (Python linter)
        ruff_lsp = {
          settings = {
            args = {
              "--ignore",
              "F401", -- F401 is the code for unused imports
            },
          },
        },

        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              misc = {},
              hover = { expandAlias = false },
              type = {
                castNumberToInteger = true,
                inferParamType = true,
              },
              diagnostics = {
                globals = { "vim" }, -- Recognize vim global
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        -- TypeScript/JavaScript
        tsserver = {
          settings = {
            typescript = {
              format = {
                indentSize = 2,
                convertTabsToSpaces = true,
                tabSize = 2,
              },
            },
            javascript = {
              format = {
                indentSize = 2,
                convertTabsToSpaces = true,
                tabSize = 2,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },

        -- HTML
        html = {
          filetypes = { "html" },
          settings = {
            html = {
              format = {
                indentInnerHtml = true,
                wrapLineLength = 80,
                wrapAttributes = "auto",
              },
              hover = {
                documentation = true,
                references = true,
              },
            },
          },
        },

        -- CSS
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                compatibleVendorPrefixes = "warning",
                vendorPrefix = "warning",
                duplicateProperties = "warning",
              },
            },
          },
        },
      },
      -- Global LSP settings --
      setup = {
        -- Custom setups if needed
        ruff_lsp = function(_, opts)
          require("lspconfig").ruff_lsp.setup(opts)
          return true
        end,
      },
    },
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
  -- ###
  -- Mason configuration to auto-install LSP servers
  -- ###
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff-lsp",

        -- Lua
        "lua-language-server",

        -- JavaScript/TypeScript
        "typescript-language-server",

        -- HTML/CSS
        "html-lsp",
        "css-lsp",

        -- Optional but recommended for these languages
        "prettier", -- Formatter
        "eslint-lsp", -- JavaScript/TypeScript linter
        "stylua", -- Lua formatter
      },
    },
  },
}
