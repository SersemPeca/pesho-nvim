local M = {}

M.config = function()
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
	vim.keymap.set("n", "<leader>lc", function()
    vim.lsp.codelens.refresh()
    vim.lsp.codelens.run()
  end, { desc = "Code Lens" })
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Code Diagnostic" })
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to Reference" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = false,
      severity_sort = false,
      signs = true,
  })

	require("lspconfig").rust_analyzer.setup({single_file_support = true,})
	require("lspconfig").clangd.setup({})
	require("lspconfig").tsserver.setup({})
	require("lspconfig").intelephense.setup({})
	require("lspconfig").hls.setup({
        settings = {
            haskell = {
                formattingProvider = "fourmolu",
            },
        },
    })
	require("lspconfig").lua_ls.setup({})
end

return M
