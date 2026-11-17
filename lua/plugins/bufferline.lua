vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })

-- delete buffers to the left
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Delete buffers left' })

-- delete buffers to the right
vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Delete buffers right' })
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'BufReadPre',
  config = function()
    require('bufferline').setup {
      options = {
        -- indicator = {
        --   style = 'underline',
        -- },
        -- offsets = {
        --   {
        --     filetype = 'NeoTree',
        --     text = function() return vim.fn.getcwd() end,
        --     highlight = 'Directory',
        --     text_align = 'left',
        --   },
        -- },
        numbers = 'ordinal', -- show buffer numbers
        diagnostics = 'nvim_lsp', -- optional
        separator_style = 'thin',
        always_show_bufferline = false,
      },
    }
  end,
}
