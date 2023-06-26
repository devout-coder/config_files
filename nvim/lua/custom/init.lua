-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
--


vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

return {
  pde = {
    angular = true,
    cpp = true,
    csharp = false,
    go = false,
    html = true,
    java = false,
    json = true,
    lua = true,
    python = true,
    react = true,
    rust = true,
    solidty = true,
    svelte = true,
    tailwind = true,
    typescript = true,
    vuejs = true,
  },
}
