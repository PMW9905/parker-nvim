return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "html",
          "cssls",
          "cssmodules_ls",
          "pyright",
        },
        -- Use handlers to avoid duplicate setups
        handlers = {
          -- Default handler for all servers (automated setup)
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Custom handler for lua_ls with your specific configuration
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              on_init = function(client)
                if client.workspace_folders then
                  local path = client.workspace_folders[1].name
                  if
                      vim.loop.fs_stat(path .. "/.luarc.json")
                      or vim.loop.fs_stat(path .. "/.luarc.jsonc")
                  then
                    return
                  end
                end
                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                  runtime = {
                    version = "LuaJIT",
                  },
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                    },
                  },
                })
              end,
            })
          end,

          -- You can add more custom handlers here if needed
          -- ["ts_ls"] = function()
          --     require("lspconfig").ts_ls.setup({
          --         capabilities = capabilities,
          --         -- your custom ts_ls config here
          --     })
          -- end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Only keymaps here, no server setups since mason-lspconfig handles them
      vim.keymap.set("n", "<leader>hd", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
