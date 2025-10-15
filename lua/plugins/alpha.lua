return {
  "goolord/alpha-nvim",
  dependencies = { 
    'nvim-tree/nvim-web-devicons',
    'MaximilianLloyd/ascii.nvim',
  },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Get ASCII art from ascii.nvim
    dashboard.section.header.val = require('ascii').art.text.neovim.sharp

    -- Get Neovim version
    local version = vim.version()
    local version_string = string.format("v%d.%d.%d", version.major, version.minor, version.patch)
    
    -- Create footer with version
    dashboard.section.footer.val = { version_string }
    dashboard.section.footer.opts.hl = 'AlphaFooter'

    -- Remove buttons
    dashboard.section.buttons.val = {}

    -- Set up the layout with header and footer
    dashboard.config.layout = {
      { type = 'padding', val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      dashboard.section.header,
      { type = 'padding', val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
