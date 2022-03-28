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

| Option                  | Default | Description              |
| ----------------------- | ------- | ------------------------ |
| rasmus_italic_comments  | `true`  | Make comments italic     |
| rasmus_italic_keywords  | `false` | Make keywords italic     |
| rasmus_italic_booleans  | `false` | Make booleans italic     |
| rasmus_italic_functions | `false` | Make functions italic    |
| rasmus_italic_variables | `false` | Make variables italic    |
| rasmus_transparent      | `false` | Disable background color |
| rasmus_variant          | `dark`  | Colorscheme variant      |

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

## Preview

### Terminal
![Screenshot 2022-03-28 at 2 25 58 PM](https://user-images.githubusercontent.com/1040966/160364806-458a5dad-5f2a-4a78-885b-a041d5ec5010.png)

### Markdown
![Screenshot 2022-03-28 at 2 08 06 PM](https://user-images.githubusercontent.com/1040966/160364881-94c94648-8761-4310-aa7f-a6d6b4c09f09.png)

### Rust
![Screenshot 2022-03-28 at 2 20 33 PM](https://user-images.githubusercontent.com/1040966/160364965-fd1342fb-392d-40e7-ab6c-224eae939f70.png)

### HTML
![Screenshot 2022-03-28 at 2 23 42 PM](https://user-images.githubusercontent.com/1040966/160365047-bbf15000-233a-497a-9755-9ca93e4aaaed.png)

### JavaScript
![Screenshot 2022-03-28 at 2 23 15 PM](https://user-images.githubusercontent.com/1040966/160365120-6fa24c8d-4c95-4fd9-83fc-095445b6f291.png)

### JSX
![Screenshot 2022-03-28 at 2 21 08 PM](https://user-images.githubusercontent.com/1040966/160365247-726c1804-df28-4fe3-bb1d-9f972a2890d8.png)

### Lua
![Screenshot 2022-03-28 at 2 12 40 PM](https://user-images.githubusercontent.com/1040966/160365410-5adabe98-660b-4a12-909e-88c5f5ff080c.png)


## Extras

- alacritty color theme: `extras/alacritty/rasmus.yaml`
- kitty color theme: `extras/kitty/rasmus.conf`

## Credits

- The original author(s) of the excellent [rsms/sublime-theme](https://github.com/rsms/sublime-theme) theme.
- Lua plugin derived from [neon](https://github.com/rafamadriz/neon) and influenced by [tokyonight.nvim](https://github.com/folke/tokyonight.nvim).
