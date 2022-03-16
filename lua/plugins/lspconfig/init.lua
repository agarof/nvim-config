local format_on_save = true

return {
  config = function ()
    local lsp = require('lspconfig')
    local utils = require('utils')
    local lsp_signature = require('lsp_signature')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local on_attach = function (client, bufnr)
      local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

      buf_set_keymap('n', 'gd',        '<cmd>lua vim.lsp.buf.declaration()<CR>')
      buf_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>')
      buf_set_keymap('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>')
      buf_set_keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>')
      buf_set_keymap('n', '1gD',       '<cmd>lua vim.lsp.buf.type_definition()<CR>')
      buf_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>')
      buf_set_keymap('n', 'g0',        '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
      buf_set_keymap('n', 'gW',        '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
      buf_set_keymap('n', 'gk',        '<cmd>lua vim.lsp.buf.code_action()<CR>')
      buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
      buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

      if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
        buf_set_keymap("n", "gf",        "<cmd>lua require('plugins.lspconfig').toggle_format_on_save()<CR>")
        vim.cmd('autocmd BufWritePre * lua require("plugins.lspconfig").format_on_save()')
      end

      lsp_signature.on_attach({ hint_enable = false })
    end

    local make_on_attach = function (server_on_attach)
      return function (client, bufnr)
        on_attach(client, bufnr)

        if server_on_attach then
          server_on_attach(client, bufnr)
        end
      end
    end

    local servers = {
      require('plugins.lspconfig.sumneko_lua'),
      require('plugins.lspconfig.pyright'),
      require('plugins.lspconfig.texlab'),
      { name = 'hls' },
      { name = 'clangd' },
      { name = 'cmake' },
      { name = 'hls' },
      { name = 'vuels' },
      { name = 'tsserver' },
      { name = 'bashls' },
    }

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          prefix = ''
        },
      }
    )

    vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler

    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

    local function make_config(server)
      return {
        on_attach = make_on_attach(server.on_attach),
        cmd = server.cmd,
        settings = server.settings,
        capabilities = capabilities
      }
    end

    for _, server in ipairs(servers) do
      lsp[server.name].setup(make_config(server))
    end

    require('rust-tools').setup({ server = make_config(require('plugins.lspconfig.rust-analyzer')) })
  end,

  toggle_format_on_save = function ()
    format_on_save = not format_on_save
  end,

  format_on_save = function ()
    if format_on_save then
      vim.lsp.buf.formatting_sync()
    end
  end
}
