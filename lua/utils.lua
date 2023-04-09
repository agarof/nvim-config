local map_default_options = { silent = true }

return {
  map_default_options = map_default_options,

  make_map = function(default_opts)
    default_opts = vim.tbl_extend('force', map_default_options, default_opts or {})

    ---@param modes Modes
    ---@param keys string
    ---@param action string | function
    ---@param opts? table
    return function(modes, keys, action, opts)
      opts = vim.tbl_extend('force', default_opts, opts or {})

      vim.keymap.set(modes, keys, action, opts)
    end
  end,

  make_lazy_map = function(default_opts)
    default_opts = vim.tbl_extend('force', map_default_options, default_opts or {})

    --- Create a Lazy.nvim mapping table
    ---@param modes Modes
    ---@param keys string
    ---@param action string | function
    ---@param opts? table
    ---@return table
    return function(modes, keys, action, opts)
      opts = vim.tbl_extend('force', default_opts, opts or {})

      opts[1] = keys
      opts[2] = action
      opts.mode = modes

      return opts
    end
  end,

  ---@generic KEY
  ---@param t { [KEY]: any }
  ---@return KEY[]
  table_keys = function(t)
    local keys = {}

    for key, _ in pairs(t) do
      table.insert(keys, key)
    end

    return keys
  end,

  ---@generic VALUE
  ---@param t { [any]: VALUE }
  ---@return VALUE[]
  table_values = function(t)
    local values = {}

    for _, value in pairs(t) do
      table.insert(values, value)
    end

    return values
  end,

  ---@generic KEY, VALUE
  ---@param t { [KEY]: VALUE }
  ---@param f KEY[]
  ---@return { [KEY]: VALUE }
  filter_table = function(t, f)
    local ret = {}

    for _, key in pairs(f) do
      ret[key] = t[key]
    end

    return ret
  end,

  ---@generic ARGS, RET
  ---@param to_call fun(ARGS): RET
  ---@param ... ARGS
  ---@return RET
  pcall_or_nil = function(to_call, ...)
    local ok, ret = pcall(to_call, ...)

    if ok then
      return ret
    else
      return nil
    end
  end,

  ---@generic KEY, VALUE
  ---@param list KEY[]
  ---@param value VALUE
  ---@return { KEY: VALUE }
  list_to_set = function(list, value)
    local ret = {}

    for _, key in pairs(list) do
      ret[key] = value
    end

    return ret
  end,

  ---Inserts the elements from `to_insert` into table
  ---@generic T
  ---@param list T[]
  ---@param to_insert T | T[]
  insert_one_or_many = function(list, to_insert)
    if type(to_insert) == 'table' then
      for _, value in pairs(to_insert) do
        table.insert(list, value)
      end
    else
      table.insert(list, to_insert)
    end
  end,
}

---@alias Mode 'n' | 'i' | 'v' | 'x' | 's' | 'o' | 'c' | 't'
---@alias Modes Mode | Mode[]
