return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local buildin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', buildin.find_files, {})
      vim.keymap.set('n', '<leader>fg', buildin.live_grep, {})
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    -- This is your opts table
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {require("telescope.themes").get_dropdown {}}
        }
      }
        require("telescope").load_extension("ui-select")
    end,
    }
  }
