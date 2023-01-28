local format_on_save_enabled = true

local format_on_save = function()
  if format_on_save_enabled then
    vim.lsp.buf.format({ async = false })
  end
end

local toggle_format_on_save = function()
  local text = 'enabled'
  if format_on_save_enabled then text = 'disabled' end
  print('Format on save ' .. text)

  format_on_save_enabled = not format_on_save_enabled
end

local format_on_attach = function(client, bufnr)
  local buf_map = require('utils').make_map({ buffer = bufnr })

  if client.server_capabilities.documentFormattingProvider then
    buf_map('n', '<leader>f', vim.lsp.buf.format)
    buf_map('n', 'gf', toggle_format_on_save)
    vim.api.nvim_create_autocmd('BufWritePre',
      {
        pattern = '<buffer>',
        callback = format_on_save,
      })
  end
end

return {
  'neovim/nvim-lspconfig',
  version = '0.1.4',
  ft = require('languages').lsp.filetypes,
  config = function()
    local lsp = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
      buf_map('n', '<leader>r', lspbuf.rename)

      format_on_attach(client, bufnr)
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
      sumneko_lua = require('plugins.lspconfig.sumneko_lua'),
      texlab = require('plugins.lspconfig.texlab'),
      rust_analyzer = require('plugins.lspconfig.rust-analyzer'),
      pyright = {},
      hls = {},
      clangd = {},
      tsserver = { disable_formatting = false },
      bashls = {},
      svelte = {},
      tailwindcss = {},
      rnix = {},
      gopls = {},
    }

    local function make_config(server)
      return {
        on_attach = make_on_attach(server.on_attach, server.disable_formatting),
        cmd = server.cmd,
        settings = server.settings,
        capabilities = capabilities,
      }
    end

    for _, server in ipairs(require('languages').lsp.servers) do
      lsp[server].setup(make_config(servers[server]))
    end
  end,
}
