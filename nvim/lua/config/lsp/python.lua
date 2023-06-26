-- local bin_name = "pyright-langserver"
-- local cmd = { bin_name, "--stdio" }
--
-- if vim.fn.has("win32") == 1 then
--   cmd = { "cmd.exe", "/C", bin_name, "--stdio" }
-- end
--
--
-- local root_files = {
--   "pyproject.toml",
--   "setup.py",
--   "setup.cfg",
--   "requirements.txt",
--   "Pipfile",
--   "pyrightconfig.json",
-- }
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.lsp.start({
--       name = "pyright",
--       cmd = cmd,
--       root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
--       settings = {
--         python = {
--           analysis = {
--             autoSearchPaths = true,
--             useLibraryCodeForTypes = true,
--             diagnosticMode = "workspace",
--           },
--         },
--       },
--     })
--   end,
-- })
--
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "debugpy", "black", "ruff" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- "openFilesOnly",
              },
            },
          },
        },
      },
      setup = {
        pyright = function(_, _)
          local lsp_utils = require "base.lsp.utils"
          lsp_utils.on_attach(function(client, bufnr)
            local map = function(mode, lhs, rhs, desc)
              if desc then
                desc = desc
              end
              vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
            end
            -- stylua: ignore
            if client.name == "pyright" then
              map("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>",  "Organize Imports" )
              map("n", "<leader>lC", function() require("dap-python").test_class() end,  "Debug Class" )
              map("n", "<leader>lM", function() require("dap-python").test_method() end,  "Debug Method" )
              map("v", "<leader>lE", function() require("dap-python").debug_selection() end, "Debug Selection" )
            end
          end)
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup() -- Use default python
      end,
    },
  },
}
