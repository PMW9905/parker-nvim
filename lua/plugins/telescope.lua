return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local buildin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', buildin.find_files, {})
    vim.keymap.set('n', '<leader>fg', buildin.live_grep, {})
  end,
}
