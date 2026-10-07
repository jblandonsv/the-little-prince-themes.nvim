-- init.lua - littleprince entry point.
-- Modelled after catppuccin's `setup({ flavour = ... })` interface.

local M = {}

---@class littleprince.Config
---@field flavour? string  one of: "prince" (default), "rose", "fox", "sheep"
---@field integrations table  per-plugin toggles, e.g. { telescope = true }
---@field background? string  "dark" | "light" - overrides palette.is_light when needed

M.config = {
  flavour = "prince",
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
  background = nil,
}

local valid_flavours = {
  prince = true,
  rose   = true,
  fox    = true,
  sheep  = true,
}

local function validate(config)
  if config.flavour and not valid_flavours[config.flavour] then
    vim.notify(
      string.format(
        "[littleprince] invalid flavour '%s'. Valid: prince, rose, fox, sheep. Defaulting to 'prince'.",
        tostring(config.flavour)
      ),
      vim.log.levels.WARN
    )
    config.flavour = "prince"
  end
  -- Reconcile integrations table; start with true for every supported plugin
  -- unless caller explicitly set them.
  local integrations = config.integrations or {}
  config.integrations = vim.tbl_extend("force", M.config.integrations, integrations)
  return config
end

---@param config? littleprince.Config
function M.setup(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})
  M.config = validate(M.config)
end

-- Internal: actually apply the highlight groups for a flavour.
local function apply_flavour(flavour)
  local palette_mod = require("littleprince.palette")
  local groups_mod   = require("littleprince.groups")
  local palette      = palette_mod.get(flavour)
  groups_mod.apply(palette)
end

---@param flavour? string  override the configured flavour on the fly
function M.colorscheme(flavour)
  flavour = flavour or M.config.flavour
  if not valid_flavours[flavour] then
    vim.notify(
      string.format("[littleprince] unknown flavour '%s'", tostring(flavour)),
      vim.log.levels.ERROR
    )
    return
  end

  local palette = require("littleprince.palette").get(flavour)

  -- Order matters: setting `vim.o.background` after a fresh `nvim_set_hl`
  -- makes Neovim silently reset `Normal` (and friends) back to its default
  -- fg/bg. So we set background BEFORE applying highlights so the explicit
  -- fg/bg values actually stick.
  local bg = M.config.background
    or (palette.is_light and "light" or "dark")
  vim.o.background = bg

  -- Clear any highlights left over from the previous colorscheme. This must
  -- come BEFORE apply_flavour, otherwise it wipes the very highlights we are
  -- about to set.
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  apply_flavour(flavour)

  vim.g.colors_name = flavour == "prince" and "littleprince" or ("littleprince-" .. flavour)

  -- `vim.o.termguicolors` defaults to `false`, never `nil`, so the previous
  -- `== nil` guard never fired. Use a boolean test instead.
  if not vim.o.termguicolors then
    vim.o.termguicolors = true
  end
end

-- Allow callers to override the active flavour at runtime:
--   require("littleprince").choose("rose")
function M.choose(flavour)
  if not valid_flavours[flavour] then
    vim.notify(
      string.format("[littleprince] unknown flavour '%s'", tostring(flavour)),
      vim.log.levels.ERROR
    )
    return
  end
  M.config.flavour = flavour
  M.colorscheme(flavour)
end

return M
