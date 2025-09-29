# wal.nvim

A Neovim colorscheme that automatically adapts to your [pywal](https://github.com/eylles/pywal16) generated colors. Perfect for ricing enthusiasts who want their terminal editor to match their desktop theme.

## ✨ Features

- 🎨 **Automatic color sync** - Uses colors from `~/.cache/wal/colors-wal.vim`
- 🔄 **Real-time auto-reload** - Automatically updates when you run `wal` with new wallpapers
- ⚡ **Instant feedback** - Shows notifications when colors change
- 🌙 **LazyVim ready** - Seamless integration with LazyVim
- 🎯 **Complete coverage** - Full syntax highlighting, LSP diagnostics, and Tree-sitter support
- 📁 **Plugin compatibility** - Works with Telescope, Neo-tree, and other popular plugins

## 📋 Requirements

- Neovim 0.5+ (for Lua support)
- [pywal16](https://github.com/eylles/pywal16) - Enhanced pywal with 16-color support
- LazyVim (recommended)

## 📦 Installation

### LazyVim (Recommended)

Add this to your LazyVim plugins directory (e.g., `~/.config/nvim/lua/plugins/colorscheme.lua`):

```lua
return {
  "saeedvaziry/wal.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

### Manual Installation with lazy.nvim

```lua
{
  "saeedvaziry/wal.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme wal")
  end,
}
```

### Packer

```lua
use {
  "saeedvaziry/wal.nvim",
  config = function()
    vim.cmd("colorscheme wal")
  end
}
```

### Manual Installation

```bash
git clone https://github.com/saeedvaziry/wal.nvim ~/.config/nvim/pack/plugins/start/wal.nvim
```

## 🚀 Usage

### Setting up pywal16

First, install pywal16:

```bash
pip install pywal16
```

Generate your color scheme:

```bash
wal -i /path/to/your/wallpaper
```

### Using the colorscheme

#### With LazyVim

The colorscheme will be automatically applied if you followed the LazyVim installation.

#### Manually

Set the colorscheme in your `init.lua`:

```lua
vim.cmd("colorscheme wal")
```

Or use the Lua module:

```lua
require("wal").setup()
```

### Reloading colors

The colorscheme **automatically reloads** when you generate new colors with pywal! 🎉

Just run:
```bash
wal -i /path/to/new/wallpaper
```

And LazyVim will instantly update with your new colors and show a notification.

#### Manual reload

You can also manually reload if needed:

**Vim command:**
```vim
:WalReload
```

**Or:**
```vim
:colorscheme wal
```

**Lua:**
```lua
require("wal").reload()
```

## 🎨 Color Mapping

The colorscheme uses your pywal colors as follows:

- **Background/Foreground**: Primary background and text colors
- **Color 0-7**: Standard 8-color palette for various syntax elements
- **Color 8-15**: Bright variants for emphasis and UI elements

| Element   | Pywal Color | Usage                  |
| --------- | ----------- | ---------------------- |
| Comments  | `color8`    | Code comments          |
| Strings   | `color2`    | String literals        |
| Functions | `color4`    | Function names         |
| Keywords  | `color5`    | Language keywords      |
| Types     | `color6`    | Data types             |
| Constants | `color1`    | Constants and numbers  |
| Operators | `color6`    | Mathematical operators |

## ⚙️ Configuration

### Basic Configuration

The colorscheme works out of the box with sensible defaults, but you can customize its behavior:

```lua
require("wal").setup({
  auto_reload = true,    -- Automatically reload when pywal colors change (default: true)
  notification = true,   -- Show notification when colors are reloaded (default: true)
})
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `auto_reload` | `boolean` | `true` | Automatically reload colorscheme when pywal cache changes |
| `notification` | `boolean` | `true` | Show notifications when colors are automatically reloaded |

### Disabling Auto-reload

If you prefer to manually reload colors:

```lua
require("wal").setup({
  auto_reload = false,
})
```

### Advanced Usage

Get colors for other plugins:

```lua
local colors = require("wal").get_colors()
-- colors.background, colors.foreground, colors.color1, etc.
```

## 🔧 Troubleshooting

### Colors not loading

1. **Check pywal cache**: Ensure `~/.cache/wal/colors-wal.vim` exists

   ```bash
   ls -la ~/.cache/wal/colors-wal.vim
   ```

2. **Regenerate colors**: Run pywal again

   ```bash
   wal -i /path/to/your/wallpaper
   ```

3. **Manual reload**: Force reload the colorscheme
   ```vim
   :colorscheme wal
   ```

### Using with tmux

Add this to your `.tmuxrc` to reload colors automatically:

```bash
# Reload wal colors in tmux
alias wal='wal -i "$@" && tmux source-file ~/.config/tmux/tmux.conf'
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Some areas where help is appreciated:

- Additional plugin support
- Terminal color fallbacks
- Configuration options
- Bug fixes and improvements

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- [pywal16](https://github.com/eylles/pywal16) for the enhanced color generation
- [LazyVim](https://github.com/LazyVim/LazyVim) for the excellent Neovim distribution
- All the contributors to the original pywal project

## 📸 Screenshots

_Add your rice screenshots here to show off the colorscheme!_

---

**This repo fully created by Claude Code**

