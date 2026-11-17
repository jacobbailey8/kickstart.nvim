local themes = {
  {
    'shatur/neovim-ayu',
  },
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = { 'default', 'vague', 'zenbones', 'koda', 'no-clown-fiesta', 'cold', 'tokyonight', 'ayu' },
        live_preview = true,
      }
    end,
  },
  {
    'oskarnurm/koda.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('koda').setup {
        transparent = true,
        -- theme = {
        --   dark = 'moss',

        -- Style to be applied to different syntax groups
        -- Common use case would be to set either `italic = true` or `bold = true` for a desired group
        -- See `:help nvim_set_hl` for more valid values
        styles = {
          functions = { bold = true },
          keywords = {},
          comments = { italic = true },
          strings = {},
          constants = {}, -- includes numbers, booleans
        },

        colors = {
          green_01 = '#383E2A',
          green_02 = '#4C5B2B',
          green_03 = '#548b40',
          green_04 = '#76946A',
          green_05 = '#9EBC9F',
          green_06 = '#D7E8B1',
          green_07 = '#EBF1DD',

          blue_01 = '#1b1f1f',
          blue_02 = '#346969',
          blue_03 = '#739393',
          blue_04 = '#799496',
          blue_05 = '#86c1b9',
          blue_06 = '#ced9d9',

          purple_01 = '#5E698E',
          purple_02 = '#9ca0b0',
          purple_03 = '#a8aec1',

          bg = '#101010',
          fg = '#b0b0b0',
          dim = '#474747',
          line = '#272727',
          keyword = '#739393',
          type = '#9ca0b0',
          operator = '#739393',
          comment = '#50585d',
          border = '#ffffff',
          emphasis = '#ffffff',
          func = '#a8aec1',
          string = '#9EBC9F',
          char = '#ffffff',
          special = '#ffffff',
          const = '#739393',
          highlight = '#458ee6',
          info = '#8ebeec',
          success = '#86cd82',
          warning = '#e6a510',
          danger = '#ff7676',
          green = '#14ba19',
          orange = '#ff5733',
          red = '#701516',
          pink = '#f2a4db',
          cyan = '#5abfb5',
        }, -- },
      }
      vim.cmd 'colorscheme koda'
    end,
  },
  {
    'gmr458/cold.nvim',
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      theme = 'dim',
      transparent = true,
    },
  },
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = { style = 'night', transparent = true },
  },
  {
    'vague-theme/vague.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        -- optional configuration here
        transparent = true,
      }
      vim.cmd 'colorscheme vague'
    end,
  },
}

return themes
