return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_reference<CR>", opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- setup language servers
    lspconfig["ts_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig["tailwindcss"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })


  end
}
