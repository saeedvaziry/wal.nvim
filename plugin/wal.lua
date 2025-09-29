-- wal.nvim plugin entry point
-- This file ensures the colorscheme is available when the plugin loads

-- Create a command to reload the colorscheme
vim.api.nvim_create_user_command('WalReload', function()
  vim.cmd('colorscheme wal')
  vim.notify('Wal colorscheme reloaded!', vim.log.levels.INFO)
end, {
  desc = 'Reload wal colorscheme with updated pywal colors'
})

-- Auto-reload functionality using file watching
local function setup_auto_reload()
  local wal_cache = vim.fn.expand('~/.cache/wal/colors-wal.vim')

  if vim.fn.filereadable(wal_cache) == 1 then
    -- Use vim.uv.new_fs_event() and start() for real-time file monitoring
    local handle = vim.uv.new_fs_event()
    if handle then
      handle:start(wal_cache, {}, function(err, filename, events)
        if err then
          return
        end

        -- Debounce rapid file changes (pywal might write multiple times)
        vim.defer_fn(function()
          -- Only reload if the colorscheme is currently wal and auto_reload is enabled
          local wal_module = package.loaded['wal']
          local auto_reload = not wal_module or not wal_module.config or wal_module.config.auto_reload ~= false
          local show_notification = not wal_module or not wal_module.config or wal_module.config.notification ~= false

          if vim.g.colors_name == 'wal' and auto_reload then
            vim.cmd('colorscheme wal')
            if show_notification then
              vim.notify('🎨 Pywal colors updated!', vim.log.levels.INFO, {
                title = 'wal.nvim',
                timeout = 2000,
              })
            end
          end
        end, 100) -- 100ms delay to debounce
      end)
    end

    -- Store handle for cleanup if needed
    if handle then
      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          if handle and not handle:is_closing() then
            handle:close()
          end
        end,
        desc = 'Cleanup wal file watcher on exit'
      })
    end
  end
end

-- Set up auto-reload on plugin load
setup_auto_reload()

-- Also set up a timer-based fallback check (every 5 seconds)
-- This ensures we catch changes even if file watching fails
local last_modified = 0
local function check_wal_changes()
  local wal_cache = vim.fn.expand('~/.cache/wal/colors-wal.vim')
  if vim.fn.filereadable(wal_cache) == 1 then
    local stat = vim.uv.fs_stat(wal_cache)
    if stat and stat.mtime.sec > last_modified then
      last_modified = stat.mtime.sec

      -- Check configuration
      local wal_module = package.loaded['wal']
      local auto_reload = not wal_module or not wal_module.config or wal_module.config.auto_reload ~= false

      if vim.g.colors_name == 'wal' and auto_reload then
        vim.cmd('colorscheme wal')
      end
    end
  end
end

-- Start timer-based checking
local timer = vim.uv.new_timer()
if timer then
  timer:start(5000, 5000, function() -- Check every 5 seconds
    vim.schedule(check_wal_changes)
  end)

  -- Clean up timer on exit
  vim.api.nvim_create_autocmd('VimLeavePre', {
    callback = function()
      if timer and not timer:is_closing() then
        timer:close()
      end
    end,
    desc = 'Cleanup wal timer on exit'
  })
end