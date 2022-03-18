Warning: This theme is still a **work-in-progress**.

# Rasmus

A color scheme for Neovim written in Lua ported from [rsms/sublime-theme](https://github.com/rsms/sublime-theme) theme.

## Features

- Supports the latest Neovim `0.5` features like TreeSitter and LSP
- Terminal colors inside Neovim
- Dark and monochrome variants

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [ALE](https://github.com/dense-analysis/ale)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## Requirements

- Neovim >= 0.5.0

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kvrohit/rasmus.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'kvrohit/rasmus.nvim'
```

## Usage

Enable the colorscheme:

```lua
-- Lua
vim.cmd [[colorscheme rasmus]]
```

```vim
" Vim Script
colorscheme rasmus
```

## Configuration

> Configuration needs to be set **BEFORE** loading the color scheme with `colorscheme rasmus`

| Option                  | Default   | Description              |
| ------------------------| --------- | ------------------------ |
| rasmus_italic_comments  | `true`    | Make comments italic     |
| rasmus_italic_keywords  | `false`   | Make keywords italic     |
| rasmus_italic_booleans  | `false`   | Make booleans italic     |
| rasmus_italic_functions | `false`   | Make functions italic    |
| rasmus_italic_variables | `false`   | Make variables italic    |
| rasmus_transparent      | `false`   | Disable background color |
| rasmus_variant          | `dark`    | Colorscheme variant      |

```lua
-- Example config in lua
vim.g.rasmus_italic_functions = true

-- Setting colorscheme variant to monochrome
vim.g.rasmus_variant = "monochrome"

-- Load the colorscheme
vim.cmd [[colorscheme rasmus]]
```

```vim
" Example config in Vim Script
let g:rasmus_italic_functions = 1

" Setting colorscheme variant to monochrome
let g:rasmus_variant = "monochrome"

" Load the colorscheme
colorscheme rasmus
```

## Extras

- kitty color theme: `extras/kitty/rasmus.conf`

## Credits

- The original author(s) of the excellent [rsms/sublime-theme](https://github.com/rsms/sublime-theme) theme.
- Lua plugin derived from [neon](https://github.com/rafamadriz/neon) and influenced by [tokyonight.nvim](https://github.com/folke/tokyonight.nvim).
