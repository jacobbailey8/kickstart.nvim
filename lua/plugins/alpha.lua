return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- add vertical padding
    dashboard.config.layout = {
      { type = 'padding', val = 6 }, -- margin above logo
      dashboard.section.header,
      { type = 'padding', val = 2 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', '<cmd>ene <CR>'),
      dashboard.button('f', '󰱼  Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('r', '  Recent files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('g', '󰈬  Find text', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('c', '  Config', '<cmd>e $MYVIMRC<CR>'),
      dashboard.button('q', '󰗼  Quit', '<cmd>qa<CR>'),
    }

    alpha.setup(dashboard.config)
  end,
}
