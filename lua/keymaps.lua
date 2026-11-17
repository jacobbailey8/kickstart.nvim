vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation/manipulation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>,', '<C-w><C-V>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>-', '<C-w><C-S>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wd', '<C-w><C-Q>', { desc = '[D]elete [W]indow' })
vim.keymap.set('n', '<leader>wa', '<Cmd>only<CR>', { desc = 'Close all other windows' })

vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Buffers
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>ba', function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current then vim.api.nvim_buf_delete(buf, { force = true }) end
  end
end, { desc = 'Delete all other buffers' })

-- Moving lines
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
-- move selection down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
-- move selection up
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
