return { -- Collection of various small independent plugins/modules
  'nvim-mini/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    -- require('mini.ai').setup { n_lines = 500 }
    require('mini.ai').setup {
      n_lines = 500,
      custom_textobjects = {
        f = require('mini.ai').gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
        i = function(ai_type)
          local spaces = (' '):rep(vim.o.tabstop)
          local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          local indents = {}

          for l, line in ipairs(lines) do
            if not line:find '^%s*$' then
              indents[#indents + 1] = {
                line = l,
                indent = #line:gsub(spaces, '\t'):match '^(\t*)',
              }
            end
          end

          local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
          local cursor_indent
          for _, v in ipairs(indents) do
            if v.line == cursor_line then
              cursor_indent = v.indent
              break
            end
          end
          if not cursor_indent then return end

          local from_line, to_line = cursor_line, cursor_line
          for i = cursor_line - 1, 1, -1 do
            local found = false
            for _, v in ipairs(indents) do
              if v.line == i then
                if v.indent < cursor_indent then break end
                from_line = i
                found = true
                break
              end
            end
            if not found then break end
          end
          for i = cursor_line + 1, #lines do
            local found = false
            for _, v in ipairs(indents) do
              if v.line == i then
                if v.indent < cursor_indent then break end
                to_line = i
                found = true
                break
              end
            end
            if not found then break end
          end

          local from = { line = from_line, col = 1 }
          local to = { line = to_line, col = #lines[to_line] }

          if ai_type == 'a' then
            -- include the line above (the "header" line, e.g. function/if)
            if from_line > 1 then from.line = from_line - 1 end
            from.col = #lines[from.line] > 0 and 1 or 1
            to.col = #lines[to_line]
          end

          return { from = from, to = to }
        end,
      },
    }
    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function() return '%2l:%-2v' end

    -- ... and there is more!
    --  Check out: https://github.com/nvim-mini/mini.nvim
  end,
}
