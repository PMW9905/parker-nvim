return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup({
        version = "*",
        open_mapping = '<C-j>'
      })
    end
  }
}
