-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
--

vim.g["leetcode_browser"] = "firefox"

vim.g["dir"] = vim.loop.cwd(),

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
