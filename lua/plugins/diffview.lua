local diffview = {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [D]iff view' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it File [H]istory' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<CR>', desc = '[G]it Repo [H]istory' },
    { '<leader>gc', '<cmd>DiffviewClose<CR>', desc = '[G]it [C]lose diff' },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = 'diff3_mixed', -- ours | result (editable) | theirs, with base below
      },
    },
  },
}

vim.api.nvim_set_hl(0, 'DiffView', {
  fg = '#4b2601',
})

return diffview
