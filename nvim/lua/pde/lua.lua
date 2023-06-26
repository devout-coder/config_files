-- local root_files = {
-- ".luarc.json",
-- ".luacheckrc",
-- ".stylua.toml",
-- "stylua.toml",
-- "selene.toml",
-- ".git",
-- }
--
-- local bin_name = "lua-language-server"
-- local cmd = { bin_name }
--
-- if vim.fn.has("win32") == 1 then
-- cmd = { "cmd.exe", "/C", bin_name }
-- end
--
-- vim.api.nvim_create_autocmd("FileType", {
-- pattern = "lua",
-- callback = function()
--   vim.lsp.start({
--     name = "sumneko",
--     cmd = cmd,
--     root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
--     settings = {
--       Lua = {
--         runtime = {
--           version = "LuaJIT",
--         },
--         diagnostics = {
--           globals = { "vim" },
--         },
--         workspace = {
--           library = vim.api.nvim_get_runtime_file("", true),
--         },
--         telemetry = {
--           enable = false,
--         },
--       },
--     },
--   })
-- end,
-- })
--
--
if not require("plugins").pde.lua then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "lua", "luadoc", "luap" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "stylua" })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      table.insert(opts.sources, nls.builtins.formatting.stylua)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = {
          plugins = { "neotest" },
          types = true,
        },
      },
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              hint = {
                enable = false,
              },
            },
          },
        },
      },
      setup = {
        lua_ls = function(_, _)
          local lsp_utils = require "base.lsp.utils"
          lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end, { buffer = buffer, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end, { buffer = buffer, desc = "OSV Launch" })
            end
          end)
        end,
      },
    },
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "jbyuki/one-small-step-for-vimkind" },
    },
    opts = {
      setup = {
        osv = function(_, _)
          local dap = require "dap"
          dap.configurations.lua = {
            {
              type = "nlua",
              request = "attach",
              name = "Attach to running Neovim instance",
              host = function()
                local value = vim.fn.input "Host [127.0.0.1]: "
                if value ~= "" then
                  return value
                end
                return "127.0.0.1"
              end,
              port = function()
                local val = tonumber(vim.fn.input("Port: ", "8086"))
                assert(val, "Please provide a port number")
                return val
              end,
            },
          }

          dap.adapters.nlua = function(callback, config)
            callback { type = "server", host = config.host, port = config.port }
          end
        end,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-plenary",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require "neotest-plenary",
      })
    end,
  },
}
