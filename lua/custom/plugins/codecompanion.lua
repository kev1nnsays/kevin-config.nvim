return {
  'Exafunction/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,

  config = function()
    require('codecompanion').setup {
      adapters = {
        http = {
          huggingface = function()
            return require('codecompanion.adapters').extend('huggingface', {
              env = {
                api_key = os.getenv 'HUGGINGFACE_API_KEY',
              },
              schema = {
                model = {
                  default = 'meta-llama/Llama-3.1-8B-Instruct',
                },
              },
            })
          end,
        },
      },
      strategies = {
        chat = { adapter = 'huggingface' },
        inline = { adapter = 'huggingface' },
        agent = { adapter = 'huggingface' },
      },
    }

    -- Optional keymaps
    vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat<CR>', { desc = 'CodeCompanion Chat' })
    vim.keymap.set('v', '<leader>cc', '<cmd>CodeCompanionChat<CR>', { desc = 'CodeCompanion Chat (selection)' })
    vim.keymap.set('n', '<leader>ci', '<cmd>CodeCompanion<CR>', { desc = 'CodeCompanion Inline' })
  end,
}
