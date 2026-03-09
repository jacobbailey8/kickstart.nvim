-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
-- return {
--   'nvim-neo-tree/neo-tree.nvim',
--   version = '*',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
--     'MunifTanjim/nui.nvim',
--   },
--   lazy = true,
--   keys = {
--     { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
--   },
--   ---@module 'neo-tree'
--   ---@type neotree.Config
--   opts = {
--     filesystem = {
--       window = {
--         mappings = {
--           ['<leader>e'] = 'close_window',
--         },
--       },
--     },
--   },
-- }
--

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    reveal_force_cwd = true,
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'qf' },
    default_component_configs = {
      container = { enable_character_fade = true },
      indent = {
        indent_size = 2,
        padding = 1,
        highlight = 'NeoTreeIndentMarker',
        with_markers = true,
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = 'ﰊ',
        default = '*',
      },
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
      },
    },
    window = {
      position = 'left',
      width = 35,
      mappings = {
        ['<CR>'] = 'open',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['S'] = 'open_split',
        ['s'] = 'open_vsplit',
        ['A'] = 'add',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['R'] = 'refresh',
        ['q'] = 'close_window',

        -- toggle hidden / ignored files
        ['I'] = 'toggle_hidden', -- show/hide dotfiles
        ['H'] = 'toggle_gitignore', -- show/hide gitignored files
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false, -- optional: keep parent dirs open
      },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = false,
      },
    },
    buffers = {
      follow_current_file = {
        enabled = false,
      },
      group_empty_dirs = true,
      show_unloaded = true,
      window = {
        mappings = {
          ['<CR>'] = 'open',
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['d'] = 'delete',
        },
      },
    },
    git_status = {
      symbols = {
        added = '+',
        modified = '~',
        deleted = '-',
        renamed = '»',
        untracked = '?',
        ignored = '◌',
        unstaged = '✗',
        staged = '✓',
        conflict = '',
      },
    },
  },
},
  -- Auto-close Neo-tree on file open
  vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
      local ft = vim.bo.filetype
      if ft ~= 'neo-tree' then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == 'neo-tree' then vim.api.nvim_win_close(win, true) end
        end
      end
    end,
  })
