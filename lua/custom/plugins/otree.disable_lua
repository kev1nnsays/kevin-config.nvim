return {
  'Eutrius/Otree.nvim',
  lazy = false,
  dependencies = {
    -- Optional: Enhanced file operations
    'stevearc/oil.nvim',
    -- Optional: Icon support
    -- { "echasnovski/mini.icons", opts = {} },
    -- "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('Otree').setup()

    -- show otree key mappings in whichkey

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'otree',
      callback = function(ev)
        local buf = ev.buf

        -- actual keymaps (buffer-local)
        vim.keymap.set('n', '<leader>l', function()
          vim.cmd 'normal l'
        end, {
          buffer = buf,
          desc = 'Expand node',
        })

        vim.keymap.set('n', '<leader>h', function()
          vim.cmd 'normal h'
        end, {
          buffer = buf,
          desc = 'Close node',
        })

        vim.keymap.set('n', '<leader>o', function()
          vim.cmd 'normal o'
        end, {
          buffer = buf,
          desc = 'Open node',
        })
      end,
    })
  end,
}
