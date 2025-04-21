return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    -- nothing in here, but order of setup calls matters, so leaving
    -- it here because I know I'll forget
    mason.setup({
      ensure_installed = {
        "prettier",
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "eslint",
      },
      automatic_installation = true,
    })
  end
}
