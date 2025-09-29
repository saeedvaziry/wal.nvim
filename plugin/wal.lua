-- wal.nvim plugin entry point
-- This file ensures the colorscheme is available when the plugin loads

-- Create a command to reload the colorscheme
vim.api.nvim_create_user_command('WalReload', function()
  vim.cmd('colorscheme wal')
end, {
  desc = 'Reload wal colorscheme with updated pywal colors'
})

-- Optional: Auto-reload when pywal cache file changes (requires inotify support)
-- This is commented out by default as it might not work on all systems
--[[
local function setup_auto_reload()
  local wal_cache = vim.fn.expand('~/.cache/wal/colors-wal.vim')
  if vim.fn.filereadable(wal_cache) == 1 then
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = wal_cache,
      callback = function()
        vim.cmd('colorscheme wal')
      end,
      desc = 'Auto-reload wal colorscheme when pywal cache changes'
    })
  end
end

-- Uncomment to enable auto-reload
-- setup_auto_reload()
--]]