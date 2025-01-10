return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        version = "*",
      })
      vim.keymap.set({ "n", "i", "v", "t" }, "<C-k>", "<cmd>ToggleTerm name=floaty direction=float<CR>")
      vim.keymap.set({ "n", "i", "v", "t" }, "<C-j>", "<cmd>ToggleTerm name=term direction=horizontal<CR>")
    end,
  },
}
