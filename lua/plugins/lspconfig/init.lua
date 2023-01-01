local format_on_save = true

local format_on_attach = function(client, bufnr)
  local buf_map = require('utils').make_map({ buffer = bufnr })

  if client.server_capabilities.documentFormattingProvider then
    buf_map('n', '<leader>f', vim.lsp.buf.format)
    buf_map('n', 'gf', require('plugins.lspconfig').toggle_format_on_save)
    vim.api.nvim_create_autocmd('BufWritePre',
      {
        pattern = '<buffer>',
        callback = function() require('plugins.lspconfig').format_on_save() end
      })
  end
end

return {
  format_on_attach = format_on_attach,
  config = function()
    local lsp = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local diagnostic_lines_enable = false
    local diagnostic_text = {
      prefix = ''
    }

    local toggle_diagnostic_text = function()
      diagnostic_lines_enable = not diagnostic_lines_enable

      local virtual_enable = false

      if not diagnostic_lines_enable then
        virtual_enable = diagnostic_text
      end

      vim.diagnostic.config({
        virtual_text = virtual_enable,
        virtual_lines = diagnostic_lines_enable,
      })
    end

    vim.diagnostic.config({
      virtual_text = diagnostic_text,
      virtual_lines = diagnostic_lines_enable,
    })

    local on_attach = function(client, bufnr)
      local buf_map = require('utils').make_map({ buffer = bufnr })
      local lspbuf = vim.lsp.buf

      buf_map('n', 'gd', lspbuf.definition, { desc = 'Go to declaration' })
      buf_map('n', 'gi', lspbuf.implementation, { desc = 'Go to implementation' })
      buf_map('n', 'K', lspbuf.hover)
      buf_map('n', '<C-e>', lspbuf.signature_help)
      buf_map('n', '1gD', lspbuf.type_definition)
      buf_map('n', 'gr', lspbuf.references)
      buf_map('n', 'g0', lspbuf.document_symbol)
      buf_map('n', 'gW', lspbuf.workspace_symbol)
      buf_map('n', 'gk', lspbuf.code_action)
      buf_map('n', '<leader>d', vim.diagnostic.open_float)
      buf_map('n', '<leader>r', lspbuf.rename)
      buf_map('n', 'gl', toggle_diagnostic_text)

      buf_map('n', 'go', require("symbols-outline").toggle_outline)

      require('plugins.lspconfig').format_on_attach(client, bufnr)
    end

    local make_on_attach = function(server_on_attach, disable_formatting)
      return function(client, bufnr)
        if disable_formatting then
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false
        end

        on_attach(client, bufnr)

        if server_on_attach then
          server_on_attach(client, bufnr)
        end
      end
    end

    local servers = {
      require('plugins.lspconfig.sumneko_lua'),
      require('plugins.lspconfig.texlab'),
      { name = 'pyright' },
      { name = 'hls' },
      { name = 'clangd',
        cmd = {
          '/home/agarof/Documents/oss/llvm-project-15-xtensa/build/bin/clangd',
          '--query-driver=/home/agarof/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++',
          '--header-insertion=iwyu'
        }
      },
      { name = 'hls' },
      { name = 'tsserver', disable_formatting = false },
      { name = 'bashls' },
      { name = 'svelte' },
      { name = 'tailwindcss' },
      { name = 'rnix' },
      { name = 'gopls' }
    }

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

    local function make_config(server)
      return {
        on_attach = make_on_attach(server.on_attach, server.disable_formatting),
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

  toggle_format_on_save = function()
    local text = "enabled"
    if format_on_save then text = "disabled" end
    print("Format on save " .. text)

    format_on_save = not format_on_save
  end,

  format_on_save = function()
    if format_on_save then
      vim.lsp.buf.format({ async = false })
    end
  end
}
