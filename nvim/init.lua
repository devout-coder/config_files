local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

-- vim.api.nvim_set_option("clipboard","unnamedplus") 
vim.opt.clipboard = 'unnamedplus'

for _, source in ipairs {
  "core.utils",
  "core.options",
  "core.bootstrap",
  "core.diagnostics",
  "core.autocmds",
  "core.mappings",
  "configs.which-key-register",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

require('toggleterm').setup {}
require('neo-tree').setup {
      filesystem = {
          filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = false,
          },
      },
}

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "pp", "$", { silent = true })
map("n", "qq", "0", { silent = true })
map("n", "<Esc>", ":noh<return><Esc>", { silent = true })
map("v", "p", '"_dP')
map("t","jj", "<C-\\><C-n>")
-- map("v", "p", '"_dP')

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

if vim.fn.has "nvim-0.8" ~= 1 or vim.version().prerelease then
  vim.schedule(function() astronvim.notify("Unsupported Neovim Version! Please check the requirements", "error") end)
end

-- call plug#begin('~/.local/share/nvim/site/plugged')
-- Plug 'junegunn/goyo.vim'
-- call plug#end()
--
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/site/plugged')

Plug 'tpope/vim-fugitive'

vim.call('plug#end')
