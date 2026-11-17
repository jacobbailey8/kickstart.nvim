---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', ':Neotree toggle reveal<CR>', desc = 'NeoTree toggle', silent = true },
  },
  opts = {
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
        expander_collapsed = '',
        expander_expanded = '',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = 'ﰊ',
        default = '*',
      },
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
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
          conflict = '',
        },
      },
    },
    window = {
      position = 'left',
      width = 35,
      mappings = {
        -- Navigation
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<CR>'] = function(state)
          local node = state.tree:get_node()
          if not node then return end
          local path = node.path
          if node.type == 'directory' then
            vim.cmd('cd ' .. vim.fn.fnameescape(path))
            print('CWD: ' .. path)
            -- Refresh so neo-tree re-roots to the new cwd
            require('neo-tree.sources.manager').refresh 'filesystem'
          else
            -- file: cd to its parent dir then open it
            local parent = vim.fn.fnamemodify(path, ':h')
            vim.cmd('cd ' .. vim.fn.fnameescape(parent))
            print('CWD: ' .. parent)
            require('neo-tree.sources.common.commands').open(state)
          end
        end,
        ['<space>'] = 'toggle_node',
        ['P'] = { 'toggle_preview', config = { use_float = true } },

        -- Splits
        ['s'] = 'open_vsplit',
        ['S'] = 'open_split',

        -- File operations
        ['a'] = 'add',
        ['A'] = 'add_directory',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['c'] = 'copy',
        ['m'] = 'move',

        -- Tree control
        ['R'] = 'refresh',
        ['q'] = 'close_window',
        ['?'] = 'show_help',

        -- Visibility toggles
        ['I'] = 'toggle_hidden',
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      hijack_netrw_behavior = 'open_current',
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_by_name = { 'node_modules', '.git' },
        never_show = { '.DS_Store' },
      },
    },
    buffers = {
      follow_current_file = { enabled = true },
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
  },
}
