-- wal.lua - Lua module for the wal colorscheme
-- This module provides a Lua interface for the wal colorscheme

local M = {}

-- Function to load colors from pywal
local function load_wal_colors()
  local colors = {}

  -- Try to read from pywal cache first
  local wal_file = vim.fn.expand('~/.cache/wal/colors-wal.vim')
  local colors_content = ""

  if vim.fn.filereadable(wal_file) == 1 then
    colors_content = vim.fn.readfile(wal_file)
  else
    -- Fallback to local colors.vim
    local local_file = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ':p:h:h:h') .. '/colors.vim'
    if vim.fn.filereadable(local_file) == 1 then
      colors_content = vim.fn.readfile(local_file)
    else
      vim.notify("Could not load pywal colors", vim.log.levels.ERROR)
      return nil
    end
  end

  -- Parse the colors from the vim file
  for _, line in ipairs(colors_content) do
    local var, value = line:match('let%s+([%w_]+)%s*=%s*"([^"]+)"')
    if var and value then
      colors[var] = value
    end
  end

  return colors
end

-- Function to apply colorscheme
function M.setup(opts)
  opts = opts or {}

  -- Store configuration
  M.config = vim.tbl_deep_extend('force', {
    auto_reload = true, -- Enable auto-reload by default
    notification = true, -- Show notifications when colors change
    transparent = true, -- Use transparent background by default
    use_terminal_colors = false, -- Use terminal ANSI colors for terminals
  }, opts)

  -- Set global variables for the colorscheme to read
  vim.g.wal_transparent = M.config.transparent and 1 or 0
  vim.g.wal_use_terminal_colors = M.config.use_terminal_colors and 1 or 0

  -- Apply the colorscheme
  vim.cmd('colorscheme wal')

  -- Setup lazygit integration if using terminal colors
  if M.config.use_terminal_colors then
    require('wal.lazygit').setup()
  end
end

-- Function to get colors for other plugins
function M.get_colors()
  return load_wal_colors()
end

-- Function to reload colors (useful when pywal generates new colors)
function M.reload()
  vim.cmd('colorscheme wal')
end

return M