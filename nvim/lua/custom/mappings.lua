---@type MappingsTable
local M = {}

M.general = {
  -- n = {
  --   [";"] = { ":", "enter command mode", opts = { nowait = true } },
  -- },
  -- Show hover
  -- ["n"] = {
  --   ["K"] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
  -- },

  -- Jump to definition
  ["n"] = {
    ["gd"] = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
  },
  

  -- Open code actions using the default lsp UI, if you want to change this please see the plugins above
  -- ["n"] = {
  --   ["<leader>ca"] = "<Cmd>lua vim.lsp.buf.code_action()<CR>",
  -- },

  -- Open code actions for the selected visual range
  -- ["x"] = {
  --   ["<leader>ca"] = "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
  -- },
}

-- more keybinds!

return M

-- vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
--
-- -- Jump to definition
-- vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
--
-- -- Open code actions using the default lsp UI, if you want to change this please see the plugins above
-- vim.api.nvim_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true })
--
-- -- Open code actions for the selected visual range
-- vim.api.nvim_set_keymap('x', '<leader>ca', '<Cmd>lua vim.lsp.buf.range_code_action()<CR>', { noremap = true })
