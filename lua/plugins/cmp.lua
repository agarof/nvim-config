return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
      },

      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', option = { keyword_pattern = [[\K\k*]] } },
        { name = 'calc' },
        { name = 'emoji' },
      },
    }

    vim.opt.completeopt = { 'menuone', 'noselect' }
    -- Remove cmp status display
    vim.opt.shortmess:append('c')
  end,
}
