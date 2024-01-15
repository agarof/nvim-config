---@alias Language
---| { treesitter?: boolean | string | string[], lsp?: string | string[], extra_fts: string[], extra_languages: string[] }

---@type { [string]: Language }
local languages = {
  lua = { treesitter = true, lsp = 'lua_ls' },
  rust = { treesitter = true, lsp = 'rust_analyzer' },
  c = { treesitter = true, lsp = 'clangd' },
  cpp = { treesitter = true, lsp = 'clangd' },
  python = { treesitter = true, lsp = 'pyright' },
  go = { treesitter = true, lsp = 'gopls' },

  latex = { treesitter = true, lsp = 'texlab', extra_fts = { 'tex' } },

  -- Treesitter query syntax
  query = { treesitter = true },

  json = { treesitter = true },
  nix = { treesitter = true, lsp = 'rnix' },
  markdown = { treesitter = { 'markdown', 'markdown_inline' } },
  proto = { treesitter = true },
  sql = { treesitter = true },
  help = { treesitter = 'vimdoc' },
}

local insert_one_or_many = require('utils').insert_one_or_many

---@return { [string]: boolean }
local get_enabled_languages = function()
  local pcall_or_nil = require('utils').pcall_or_nil
  local path = vim.fn.stdpath('config') .. '/machine-config.lua'
  local machine_config = pcall_or_nil(dofile, path) or {}
  local enabled = machine_config.enabled_languages or {}
  local enabled_set = {}

  if enabled == 'all' then
    for language in pairs(languages) do
      enabled_set[language] = true
    end
  elseif type(enabled) == 'table' then
    for _, language in pairs(enabled) do
      if languages[language] then
        enabled_set[language] = true
      else
        vim.notify(language .. ' is enabled in machine config but not supported',
          vim.log.levels.WARN)
      end
    end
  else
    vim.notify('Invalid config.enabled_languages: ' .. vim.inspect(enabled), vim.log.levels.WARN)
  end

  return enabled_set
end

local enabled_languages = get_enabled_languages()

---@return { parsers: string[], filetypes: string[] }
local get_treesitter = function()
  local parsers = {}
  local filetypes = {}

  for language in pairs(enabled_languages) do
    local config = languages[language]

    if config.treesitter then
      local treesitter = config.treesitter
      ---@cast treesitter -nil

      table.insert(filetypes, language)

      for _, ft in pairs(config.extra_fts or {}) do
        table.insert(filetypes, ft)
      end

      if type(treesitter) == 'boolean' then
        table.insert(parsers, language)
      else
        insert_one_or_many(parsers, treesitter)
      end
    end
  end

  return { parsers = parsers, filetypes = filetypes }
end

---@return { servers: string[], filetypes: string[] }
local get_lsp = function()
  local to_list = require('utils').table_keys
  ---@type { [string]: boolean }
  local servers = {}
  local filetypes = {}

  for language in pairs(enabled_languages) do
    local config = languages[language] or {}

    if config.lsp then
      local lsp = config.lsp
      ---@cast lsp -nil
      table.insert(filetypes, language)

      for _, ft in pairs(config.extra_fts or {}) do
        table.insert(filetypes, ft)
      end

      if type(lsp) == 'string' then
        servers[lsp] = true
      elseif type(lsp) == 'table' then
        for _, server in pairs(lsp) do
          servers[server] = true
        end
      end
    end
  end

  return { servers = to_list(servers), filetypes = filetypes }
end

return {
  lsp = get_lsp(),
  treesitter = get_treesitter(),
}
