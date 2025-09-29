-- LazyVim plugin specification for wal colorscheme
-- Add this to your LazyVim plugins configuration

return {
  -- Wal colorscheme plugin
  {
    dir = vim.fn.expand("~") .. "/Drafts/wal.nvim", -- Adjust path as needed
    name = "wal.nvim",
    lazy = false,
    priority = 1000, -- Load early
    config = function()
      require("wal").setup({
        -- Add any configuration options here
      })
    end,
  },

  -- Configure LazyVim to use wal as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "wal",
    },
  },
}