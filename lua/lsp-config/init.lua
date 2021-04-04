local lsp = require('lspconfig')

local utils = require('utils')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_set_keymap('n', 'gi',       '<cmd>lua vim.lsp.buf.implementation()<CR>')
  buf_set_keymap('n', 'K',        '<cmd>lua vim.lsp.buf.hover()<CR>')
  buf_set_keymap('n', '<c-k>',    '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_set_keymap('n', '1gD',      '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_set_keymap('n', 'gr',       '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_set_keymap('n', 'g0',       '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  buf_set_keymap('n', 'gW',       '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  buf_set_keymap('n', 'gd',       '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_set_keymap('n', 'gk',       '<cmd>lua vim.lsp.buf.code_action()<CR>')
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()'
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = {
      prefix = "->"
    },
    update_in_insert = true
  }
)

local servers = {
  require('lsp-config/rust-analyzer'),
  require('lsp-config/sumneko_lua'),
  { name = 'clangd' },
  { name = 'cmake' },
  { name = 'hls' },
  { name = 'vuels' },
  { name = 'tsserver' },
  { name = 'pyright' },
}

for _, server in ipairs(servers) do
  lsp[server.name].setup {
    on_attach = on_attach,
    cmd = server.cmd,
    settings = server.settings,
    capabilities = capabilities
  }
end
