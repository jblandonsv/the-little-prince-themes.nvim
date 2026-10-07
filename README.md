# the-little-prince-themes.nvim

A Neovim colorscheme collection inspired by _The Little
Prince_ (_Le Petit Prince_) by **Antoine de Saint-Exupéry**

**Inspired by the book _The Little Prince_ by Antoine de Saint-Exupéry. The
characters, illustrations and the book itself are the intellectual property of
the author / his estate and the relevant publishers — all rights reserved.**

This project is a non-commercial fan tribute by an independent developer; it
is **not endorsed by, sponsored by, or affiliated with** Antoine de
Saint-Exupéry's estate, his publishers, or any official _The Little Prince_
organisation.

---

## Flavours

| Flavour  | Colorscheme name                                | Mode      | Inspired by                                                       |
| -------- | ----------------------------------------------- | --------- | ----------------------------------------------------------------- |
| `prince` | `littleprince` (default), `littleprince-prince` | **Dark**  | The Little Prince — gold hair, green suit, deep-blue asteroid sky |
| `rose`   | `littleprince-rose`                             | **Dark**  | The Rose — dusty pinks, midnight mauve, stem-green leaves         |
| `fox`    | `littleprince-fox`                              | **Dark**  | The Fox — warm amber fur, savanna twilights, earth tones          |
| `sheep`  | `littleprince-sheep`                            | **Light** | The Sheep — cream wool, pastels, soft storybook page              |

You can switch flavours at any time. The default is `prince`.

## Requirements

- Neovim **0.9 or newer** (it uses the modern `vim.api.nvim_set_hl` API and LSP
  semantic-token groups).
- A terminal that supports `termguicolors` (the plugin enables it automatically
  if it's off).

## Installation

### Lazy.nvim

```lua
{
  "jblandonsv/the-little-prince-themes.nvim",
  lazy = false,         -- load on startup so :colorscheme works out of the box
  priority = 1000,
  config = function()
    require("littleprince").setup({
      flavour = "prince", -- "prince" | "rose" | "fox" | "sheep"
      integrations = {
        telescope = true,
        gitsigns = true,
        treesitter_context = true,
        nvim_tree = true,
        neo_tree = true,
        which_key = true,
        indent_blankline = true,
        trouble = true,
        cmp = true,
        notify = true,
        lualine = true,
        alpha = true,
        flash = true,
        rainbow_delimiters = true,
        rainbow_indent = true,
        hop = true,
        leap = true,
        marks = true,
        lightspeed = true,
      },
    })
  end,
}
```

> `lazy = false` is recommended so the `colorscheme/*.lua` files can be
> activated with `:colorscheme littleprince`, just like catppuccin.

### vim-plug

```vim
" Minimal — keeps the default flavour (prince)
Plug 'jblandonsv/the-little-prince-themes.nvim'

" Then in your init.lua or init.vim:
colorscheme littleprince
```

Or, to set up with a specific flavour:

```lua
-- init.lua
require("littleprince").setup({ flavour = "rose" })
vim.cmd("colorscheme littleprince-rose")
```

The available `colorscheme` commands are:

```vim
:colorscheme littleprince            " default (Little Prince, dark)
:colorscheme littleprince-prince     " same as above, explicit
:colorscheme littleprince-rose       " The Rose
:colorscheme littleprince-fox        " The Fox
:colorscheme littleprince-sheep      " The Sheep (light)
```

## Configuration

`setup()` accepts a table with these fields:

```lua
require("littleprince").setup({
  -- one of: "prince" (default), "rose", "fox", "sheep"
  flavour = "prince",

  -- "dark" | "light". Leave nil to follow the flavour's own value.
  background = nil,

  -- Toggle per-plugin integrations. Anything set to `false` skips that
  -- block of highlight groups. Defaults are all `true` for the plugins
  -- listed below.
  integrations = {
    telescope = true,
    gitsigns = true,
    treesitter_context = true,
    nvim_tree = true,
    neo_tree = true,
    which_key = true,
    indent_blankline = true,
    trouble = true,
    cmp = true,
    notify = true,
    lualine = true,
    alpha = true,
    flash = true,
    rainbow_delimiters = true,
    rainbow_indent = true,
    hop = true,
    leap = true,
    marks = true,
    lightspeed = true,
  },
})
```

## Switching flavours at runtime

```lua
require("littleprince").choose("rose")   -- switch to The Rose
require("littleprince").choose("fox")    -- switch to The Fox
require("littleprince").choose("sheep")  -- switch to The Sheep (light)
require("littleprince").choose("prince") -- back to default
```

You can also do it from the command line:

```vim
:colorscheme littleprince-rose
```

## Overriding colours

Because each flavour is just a Lua table returned from `lua/littleprince/palettes/*.lua`,
you can fork a flavour or load a custom one and override individual keys:

```lua
local mod = require("littleprince.palettes.prince")
mod.yellow = "#ffd86b"  -- a warmer gold
mod.green  = "#9be28a"  -- a softer leaf green
require("littleprince").setup({ flavour = "prince" })
require("littleprince").colorscheme("prince")
```

## Plugin support

Highlights are provided (or aliased) for, among others:

- LSP & `vim.api.nvim_set_hl(0, ...)` semantic tokens
- `gitsigns.nvim`
- `nvim-tree.lua`, `neo-tree.nvim`
- `telescope.nvim`
- `which-key.nvim`
- `indent-blankline.nvim`
- `treesitter-context.nvim`
- `rainbow-delimiters.nvim`, `rainbow-indent`
- `trouble.nvim`
- `nvim-cmp`
- `nvim-notify`
- `hop.nvim`, `leap.nvim`, `flash.nvim`, `lightspeed.nvim`
- `marks.nvim`, `alpha.nvim`
- `lualine.nvim`
- Terminal colours via `g:terminal_color_*`

Terminal colors are also set so `:terminal` and integrated TUIs match the
active flavour.

## Highlights

- One palette file per flavour (`prince`, `rose`, `fox`, `sheep`) — easy to
  reuse as a library if you want to build your own theme on top.
- Catppuccin-style groups and naming, so plugins that already know
  `catppuccin`-style names generally work out of the box.
- `:hi clear` is auto-reapplied through a `ColorScheme` autocmd so the
  highlights survive plugins that reset everything on startup.

## Inspiration & Acknowledgements

- _Le Petit Prince_ (first published 1943) — **Antoine de Saint-Exupéry**. All
  rights reserved.
- `catppuccin/nvim` — for the `setup({ flavour = ... })` UX, the palette
  structure and the plugin integration model.

## License

The **plugin code** in this repository is released under the **MIT License**

_The Little Prince_ (the novel, its characters, plot, illustrations and
associated trademarks) is the work of **Antoine de Saint-Exupéry** and is
**not** part of this MIT-licensed codebase. The titles _The Little Prince_ /
_Le Petit Prince_, and the character names drawn from it (the Little Prince,
the Rose, the Fox, the Sheep, the Snake, the Baobabs, Asteroid B-612, etc.),
are the property of their respective rightsholders — all rights reserved. No
passage from the book or its original illustrations is reproduced in this
plugin; the colorscheme names and palette names are used purely as a fan
tribute.

If you are a rights holder and would like something changed or removed, please
open an issue — I'm happy to cooperate.
