-- Lazygit theme configuration for wal.nvim
-- This module provides custom lazygit colors that work well with terminal colors

local M = {}

function M.setup()
  -- Only delete theme file when using terminal colors mode
  if vim.g.wal_use_terminal_colors == 1 then
    -- Delete the theme file immediately
    local theme_path = vim.fn.stdpath("cache") .. "/lazygit-theme.yml"
    vim.fn.delete(theme_path)

    -- Also set up autocmd to delete it whenever colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.fn.delete(theme_path)
      end,
    })
  end
end

return M