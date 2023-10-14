-- local present, null_ls = pcall(require, "null-ls")
--
-- if not present then
--   return
-- end
--
-- local b = null_ls.builtins
--
-- local sources = {
--
--   -- webdev stuff
--   b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
--   b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
--
--   -- Lua
--   b.formatting.stylua,
--
--   -- cpp
--   b.formatting.clang_format,
-- }
--
-- null_ls.setup {
--   debug = true,
--   sources = sources,
-- }
--

-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.autopep8,
  formatting.clang_format,
  formatting.dart_format,
  formatting.gofumpt,
  lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
    on_init = function(new_client, _) 
      new_client.offset_encoding = 'utf-32'
    end,
}

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
