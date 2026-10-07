-- groups.lua - turn a palette into Vim/Neovim highlight groups.
-- Modelled after catppuccin's group structure for plugin parity.

local M = {}

-- Small helper to set a highlight group, ignoring NIL/empty values.
local function set(group, opts)
  if not opts or vim.tbl_isempty(opts) then
    return
  end
  vim.api.nvim_set_hl(0, group, opts)
end

-- Resolve foreground/background regardless of light/dark.
-- Both palettes put the page background in `base` and the foreground ink in
-- `text`, so the same line works in both modes.
local function page_fg_bg(p)
  return { fg = p.text, bg = p.base }
end

function M.apply(palette)
  local p = palette

  -- -----------------------------------------------------------------------
  -- Editor UI
  -- -----------------------------------------------------------------------
  set("Normal", page_fg_bg(p))
  set("NormalFloat", { fg = p.text, bg = p.mantle })
  set("NormalNC", { fg = p.text, bg = p.crust })
  set("FloatBorder", { fg = p.overlay0, bg = p.mantle })
  set("FloatTitle", { fg = p.yellow, bg = p.mantle, bold = true })

  set("Cursor", { fg = p.base, bg = p.peach })
  set("CursorIM", { fg = p.base, bg = p.peach })
  set("TermCursor", { fg = p.base, bg = p.peach })

  set("CursorLine", { bg = p.surface0 })
  set("CursorLineNr", { fg = p.peach, bold = true })
  set("CursorColumn", { bg = p.surface0 })

  set("LineNr", { fg = p.overlay0 })
  set("LineNrAbove", { fg = p.overlay0 })
  set("LineNrBelow", { fg = p.overlay0 })

  set("ColorColumn", { bg = p.surface0 })
  set("Conceal", { fg = p.overlay1 })

  set("Comment", { fg = p.overlay1, italic = true })
  set("SpecialComment", { fg = p.overlay1, italic = true, bold = true })

  set("StatusLine", { fg = p.text, bg = p.surface0 })
  set("StatusLineNC", { fg = p.overlay1, bg = p.crust })
  set("WinBar", { fg = p.text, bg = p.base })
  set("WinBarNC", { fg = p.overlay1, bg = p.crust })
  set("WinSeparator", { fg = p.surface1, bg = p.none })
  set("VertSplit", { fg = p.surface1, bg = p.none })
  set("FoldColumn", { fg = p.overlay0 })
  set("Folded", { fg = p.text, bg = p.surface1 })

  set("SignColumn", { fg = p.overlay0, bg = p.none })
  set("SignAdd", { fg = p.green })
  set("SignChange", { fg = p.yellow })
  set("SignDelete", { fg = p.red })

  set("Visual", { bg = p.surface2 })
  set("VisualNOS", { bg = p.surface2 })

  set("Search", { fg = p.base, bg = p.yellow })
  set("IncSearch", { fg = p.base, bg = p.peach })
  set("Substitute", { fg = p.base, bg = p.red })
  set("CurSearch", { fg = p.base, bg = p.peach })

  set("MatchParen", { fg = p.peach, bold = true })
  set("DiffAdd", { bg = p.green, fg = p.base })
  set("DiffChange", { bg = p.yellow, fg = p.base })
  set("DiffDelete", { bg = p.red, fg = p.base })
  set("DiffText", { bg = p.blue, fg = p.base })

  set("ErrorMsg", { fg = p.red, bold = true })
  set("WarningMsg", { fg = p.yellow, bold = true })
  set("MoreMsg", { fg = p.blue, bold = true })
  set("InfoMsg", { fg = p.sky })
  set("Question", { fg = p.blue, bold = true })
  set("ModeMsg", { fg = p.flamingo })

  set("Directory", { fg = p.blue, bold = true })
  set("Title", { fg = p.yellow, bold = true })

  set("NonText", { fg = p.surface1 })
  set("Whitespace", { fg = p.surface1 })
  set("EndOfBuffer", { fg = p.surface1 })
  set("TabLine", { fg = p.subtext1, bg = p.mantle })
  set("TabLineFill", { bg = p.crust })
  set("TabLineSel", { fg = p.peach, bg = p.base, bold = true })

  set("MsgArea", { fg = p.text, bg = p.none })
  set("MsgSeparator", { fg = p.surface1, bg = p.none })

  set("SpellBad", { sp = p.red, undercurl = true })
  set("SpellCap", { sp = p.yellow, undercurl = true })
  set("SpellLocal", { sp = p.blue, undercurl = true })
  set("SpellRare", { sp = p.green, undercurl = true })

  -- -----------------------------------------------------------------------
  -- Pmenu (completion)
  -- -----------------------------------------------------------------------
  set("Pmenu", { fg = p.text, bg = p.mantle })
  set("PmenuSel", { fg = p.text, bg = p.surface1, bold = true })
  set("PmenuSbar", { bg = p.surface0 })
  set("PmenuThumb", { bg = p.overlay0 })

  -- -----------------------------------------------------------------------
  -- Legacy Syntax
  -- -----------------------------------------------------------------------
  set("Constant", { fg = p.peach })
  set("String",  { fg = p.green })
  set("StringDelimiter", { fg = p.green })
  set("Character", { fg = p.peach })
  set("Number",  { fg = p.peach })
  set("Boolean", { fg = p.peach })
  set("Float",   { fg = p.peach })

  set("Identifier", { fg = p.text })
  set("Function",   { fg = p.blue })

  set("Statement", { fg = p.mauve, bold = true })
  set("Conditional", { fg = p.mauve, bold = true })
  set("Repeat",    { fg = p.mauve, bold = true })
  set("Label",     { fg = p.mauve, bold = true })
  set("Operator",  { fg = p.sky })
  set("Keyword",   { fg = p.mauve, bold = true })
  set("Exception", { fg = p.mauve, bold = true })

  set("PreProc",   { fg = p.pink })
  set("Include",   { fg = p.pink })
  set("Define",    { fg = p.pink })
  set("Macro",     { fg = p.pink })
  set("PreCondit", { fg = p.pink })

  set("Type",      { fg = p.yellow })
  set("StorageClass", { fg = p.yellow })
  set("Structure", { fg = p.yellow })
  set("Typedef",   { fg = p.yellow })

  set("Special",    { fg = p.pink })
  set("SpecialChar",{ fg = p.pink })
  set("Tag",        { fg = p.mauve })
  set("Delimiter",  { fg = p.overlay2 })
  set("SpecialKey", { fg = p.overlay2 })
  set("Symbol",     { fg = p.peach })
  set("Todo",       { fg = p.yellow, bg = p.surface0, bold = true })

  set("Underlined", { fg = p.sky, underline = true })
  set("Bold",       { bold = true })
  set("Italic",     { italic = true })
  set("Ignore",     { fg = p.overlay0 })
  set("Error",      { fg = p.red, bold = true })
  set("Debug",      { fg = p.peach })

  -- -----------------------------------------------------------------------
  -- LSP semantic tokens (for nvim 0.9+)
  -- -----------------------------------------------------------------------
  -- Types
  set("@type", { fg = p.yellow })
  set("@type.builtin", { fg = p.yellow })
  set("@type.definition", { fg = p.yellow })
  set("@type.qualifier", { fg = p.pink, italic = true })

  -- Constants
  set("@constant", { fg = p.peach })
  set("@constant.builtin", { fg = p.peach })
  set("@constant.macro", { fg = p.peach })
  set("@string", { fg = p.green })
  set("@string.regex", { fg = p.peach })
  set("@string.escape", { fg = p.pink })
  set("@string.special", { fg = p.pink })
  set("@character", { fg = p.peach })
  set("@boolean", { fg = p.peach })
  set("@number", { fg = p.peach })
  set("@number.float", { fg = p.peach })

  -- Functions
  set("@function", { fg = p.blue })
  set("@function.builtin", { fg = p.blue })
  set("@function.call", { fg = p.blue })
  set("@function.macro", { fg = p.peach })
  set("@function.method", { fg = p.blue })
  set("@method", { fg = p.blue })

  -- Identifiers / Variables
  set("@variable", { fg = p.text })
  set("@variable.builtin", { fg = p.red })
  set("@variable.parameter", { fg = p.flamingo })
  set("@variable.parameter.builtin", { fg = p.red })
  set("@variable.member", { fg = p.flamingo })

  -- Keywords / Operators / Punctuation
  set("@keyword", { fg = p.mauve, bold = true })
  set("@keyword.coroutine", { fg = p.mauve })
  set("@keyword.function", { fg = p.mauve })
  set("@keyword.operator", { fg = p.mauve })
  set("@keyword.import", { fg = p.pink })
  set("@keyword.repeat", { fg = p.mauve })
  set("@keyword.return", { fg = p.mauve })
  set("@keyword.debug", { fg = p.mauve })
  set("@operator", { fg = p.sky })
  set("@punctuation", { fg = p.overlay2 })
  set("@punctuation.bracket", { fg = p.overlay2 })
  set("@punctuation.delimiter", { fg = p.overlay2 })
  set("@punctuation.special", { fg = p.pink })

  -- Comments
  set("@comment", { fg = p.overlay1, italic = true })
  set("@comment.documentation", { fg = p.subtext0, italic = true })
  set("@comment.error", { fg = p.red, bold = true })
  set("@comment.warning", { fg = p.yellow, bold = true })
  set("@comment.todo", { fg = p.yellow, bold = true })
  set("@comment.note", { fg = p.flamingo, bold = true })

  -- Tags (HTML / JSX)
  set("@tag", { fg = p.mauve })
  set("@tag.attribute", { fg = p.yellow })
  set("@tag.delimiter", { fg = p.overlay2 })
  set("@tag.builtin", { fg = p.pink })

  -- Attributes / Annotations / Macros
  set("@attribute", { fg = p.pink })
  set("@annotation", { fg = p.pink })

  -- Labels (goto etc.)
  set("@label", { fg = p.mauve, bold = true })

  -- Constructor & namespaces
  set("@constructor", { fg = p.blue })
  set("@namespace", { fg = p.text })

  -- Misc
  set("@markup", { fg = p.text })
  set("@markup.strong", { bold = true })
  set("@markup.italic", { italic = true })
  set("@markup.underline", { underline = true })
  set("@markup.strikethrough", { strikethrough = true })
  set("@markup.heading", { fg = p.peach, bold = true })
  set("@markup.heading.1", { fg = p.peach, bold = true })
  set("@markup.heading.2", { fg = p.peach, bold = true })
  set("@markup.heading.3", { fg = p.peach, bold = true })
  set("@markup.heading.4", { fg = p.peach, bold = true })
  set("@markup.heading.5", { fg = p.peach, bold = true })
  set("@markup.heading.6", { fg = p.peach, bold = true })
  set("@markup.quote", { fg = p.overlay1, italic = true })
  set("@markup.math", { fg = p.pink })
  set("@markup.environment", { fg = p.pink })
  set("@markup.link", { fg = p.blue, underline = true })
  set("@markup.link.label", { fg = p.pink })
  set("@markup.list", { fg = p.mauve })
  set("@markup.list.checked", { fg = p.green })
  set("@markup.list.unchecked", { fg = p.overlay1 })
  set("@markup.raw", { fg = p.green })
  set("@markup.raw.block", { fg = p.green })
  set("@markup.comment", { fg = p.overlay1, italic = true })

  -- Diff & text
  set("@diff.add", { fg = p.green })
  set("@diff.delete", { fg = p.red })
  set("@diff.change", { fg = p.yellow })

  -- -----------------------------------------------------------------------
  -- Diagnostics
  -- -----------------------------------------------------------------------
  set("DiagnosticError", { fg = p.red })
  set("DiagnosticWarn",  { fg = p.yellow })
  set("DiagnosticInfo",  { fg = p.blue })
  set("DiagnosticHint",  { fg = p.teal })
  set("DiagnosticOk",    { fg = p.green })

  set("DiagnosticVirtualTextError", { fg = p.red, bg = p.surface0 })
  set("DiagnosticVirtualTextWarn",  { fg = p.yellow, bg = p.surface0 })
  set("DiagnosticVirtualTextInfo",  { fg = p.blue, bg = p.surface0 })
  set("DiagnosticVirtualTextHint",  { fg = p.teal, bg = p.surface0 })
  set("DiagnosticVirtualTextOk",    { fg = p.green, bg = p.surface0 })

  set("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
  set("DiagnosticUnderlineWarn",  { sp = p.yellow, undercurl = true })
  set("DiagnosticUnderlineInfo",  { sp = p.blue, undercurl = true })
  set("DiagnosticUnderlineHint",  { sp = p.teal, undercurl = true })
  set("DiagnosticUnderlineOk",    { sp = p.green, undercurl = true })
  set("DiagnosticSignError", { fg = p.red })
  set("DiagnosticSignWarn",  { fg = p.yellow })
  set("DiagnosticSignInfo",  { fg = p.blue })
  set("DiagnosticSignHint",  { fg = p.teal })
  set("DiagnosticSignOk",    { fg = p.green })
  set("DiagnosticFloatError", { fg = p.red })
  set("DiagnosticFloatWarn",  { fg = p.yellow })
  set("DiagnosticFloatInfo",  { fg = p.blue })
  set("DiagnosticFloatHint",  { fg = p.teal })
  set("DiagnosticFloatOk",    { fg = p.green })

  set("DiagnosticDeprecated", { sp = p.overlay1, strikethrough = true })
  set("DiagnosticUnnecessary", { fg = p.overlay1, italic = true })

  -- -----------------------------------------------------------------------
  -- Common plugin highlight groups
  -- -----------------------------------------------------------------------

  -- gitsigns.nvim
  set("GitSignsAdd",     { fg = p.green })
  set("GitSignsChange",  { fg = p.yellow })
  set("GitSignsDelete",  { fg = p.red })
  set("GitSignsTopdelete", { fg = p.red })
  set("GitSignsChangedelete", { fg = p.yellow })
  set("GitSignsAddNr",   { fg = p.green })
  set("GitSignsChangeNr",{ fg = p.yellow })
  set("GitSignsDeleteNr",{ fg = p.red })
  set("GitSignsAddLn",   { bg = p.surface0 })
  set("GitSignsChangeLn",{ bg = p.surface0 })
  set("GitSignsDeleteLn",{ bg = p.surface0, strikethrough = true })

  -- nvim-tree / neo-tree
  set("NvimTreeFolderName", { fg = p.blue })
  set("NvimTreeOpenedFolderName", { fg = p.flamingo, bold = true })
  set("NvimTreeFolderIcon", { fg = p.blue })
  set("NvimTreeRootFolder", { fg = p.peach, bold = true })
  set("NvimTreeGitDirty", { fg = p.yellow })
  set("NvimTreeGitStaged", { fg = p.green })
  set("NvimTreeGitMerge", { fg = p.pink })
  set("NvimTreeGitRenamed", { fg = p.blue })
  set("NvimTreeGitNew", { fg = p.green })
  set("NvimTreeGitDeleted", { fg = p.red })
  set("NvimTreeIndentMarker", { fg = p.overlay0 })

  -- neo-tree
  set("NeoTreeDirectoryIcon", { fg = p.blue })
  set("NeoTreeDirectoryName", { fg = p.blue })
  set("NeoTreeFileName", { fg = p.text })
  set("NeoTreeGitDirty", { fg = p.yellow })
  set("NeoTreeGitStaged", { fg = p.green })
  set("NeoTreeGitMerge", { fg = p.pink })
  set("NeoTreeGitRenamed", { fg = p.blue })
  set("NeoTreeGitNew", { fg = p.green })
  set("NeoTreeGitDeleted", { fg = p.red })
  set("NeoTreeIndentMarker", { fg = p.overlay0 })
  set("NeoTreeRootSymbol", { fg = p.peach })

  -- telescope.nvim
  set("TelescopeBorder",     { fg = p.overlay0, bg = p.mantle })
  set("TelescopeNormal",     { fg = p.text, bg = p.mantle })
  set("TelescopeTitle",      { fg = p.yellow, bg = p.mantle, bold = true })
  set("TelescopePrompt",     { fg = p.peach, bg = p.crust })
  set("TelescopePromptBorder", { fg = p.peach, bg = p.crust })
  set("TelescopePromptTitle", { fg = p.peach, bg = p.crust, bold = true })
  set("TelescopeResults",    { fg = p.text, bg = p.mantle })
  set("TelescopeResultsBorder", { fg = p.overlay0, bg = p.mantle })
  set("TelescopeResultsTitle", { fg = p.peach, bg = p.mantle })
  set("TelescopePreview",    { fg = p.text, bg = p.mantle })
  set("TelescopePreviewBorder", { fg = p.overlay0, bg = p.mantle })
  set("TelescopePreviewTitle", { fg = p.peach, bg = p.mantle })
  set("TelescopeMatching", { fg = p.peach, bold = true })

  -- which-key.nvim
  set("WhichKey", { fg = p.peach })
  set("WhichKeyGroup", { fg = p.blue })
  set("WhichKeyDesc", { fg = p.text })
  set("WhichKeySeparator", { fg = p.overlay1 })
  set("WhichKeyFloat", { bg = p.mantle })
  set("WhichKeyValue", { fg = p.green })

  -- indent-blankline
  set("IndentBlanklineChar", { fg = p.surface1 })
  set("IndentBlanklineContextChar", { fg = p.overlay1 })
  set("IndentBlanklineSpaceChar", { fg = p.overlay0 })
  set("IndentBlanklineContextStart", { sp = p.overlay1, underline = true })

  -- treesitter-context
  set("TreesitterContext", { bg = p.mantle })
  set("TreesitterContextLineNumber", { fg = p.peach, bg = p.mantle })
  set("TreesitterContextBottom", { sp = p.overlay0, underline = true })
  set("TreesitterContextSeparator", { fg = p.surface1, bg = p.mantle })

  -- rainbow delimiters / indent
  set("RainbowRed",   { fg = p.red })
  set("RainbowYellow",{ fg = p.yellow })
  set("RainbowBlue",  { fg = p.blue })
  set("RainbowOrange",{ fg = p.peach })
  set("RainbowGreen", { fg = p.green })
  set("RainbowViolet",{ fg = p.mauve })
  set("RainbowCyan",  { fg = p.teal })

  -- LSP reference highlights (e.g. for highlighting references under cursor)
  set("LspReferenceText", { bg = p.surface1 })
  set("LspReferenceRead", { bg = p.surface1 })
  set("LspReferenceWrite", { bg = p.surface1 })

  -- Trouble.nvim
  set("TroubleError", { fg = p.red })
  set("TroubleWarning", { fg = p.yellow })
  set("TroubleInfo", { fg = p.blue })
  set("TroubleHint", { fg = p.teal })
  set("TroubleSource", { fg = p.text })
  set("TroubleLocation", { fg = p.subtext0 })
  set("TroubleIndent", { fg = p.surface1 })
  set("TroubleNormal", { fg = p.text, bg = p.mantle })

  -- Cmp / nvim-cmp
  set("CmpItemAbbr", { fg = p.text })
  set("CmpItemAbbrMatch", { fg = p.peach, bold = true })
  set("CmpItemAbbrMatchFuzzy", { fg = p.peach, bold = true })
  set("CmpItemKind", { fg = p.blue })
  set("CmpItemKindFunction", { fg = p.blue })
  set("CmpItemKindMethod", { fg = p.blue })
  set("CmpItemKindVariable", { fg = p.text })
  set("CmpItemKindField", { fg = p.flamingo })
  set("CmpItemKindClass", { fg = p.yellow })
  set("CmpItemKindStruct", { fg = p.yellow })
  set("CmpItemKindInterface", { fg = p.yellow })
  set("CmpItemKindKeyword", { fg = p.mauve })
  set("CmpItemKindProperty", { fg = p.flamingo })
  set("CmpItemKindSnippet", { fg = p.green })
  set("CmpItemMenu", { fg = p.overlay0 })

  -- nvim-notify
  set("NotifyBackground", { bg = p.mantle })
  set("NotifyBorder", { fg = p.overlay0, bg = p.mantle })
  set("NotifyERRORBorder", { fg = p.red, bg = p.mantle })
  set("NotifyWARNBorder",  { fg = p.yellow, bg = p.mantle })
  set("NotifyINFOBorder",  { fg = p.blue, bg = p.mantle })
  set("NotifyDEBUGBorder", { fg = p.teal, bg = p.mantle })
  set("NotifyERRORTitle", { fg = p.red, bold = true })
  set("NotifyWARNTitle",  { fg = p.yellow, bold = true })
  set("NotifyINFOTitle",  { fg = p.blue, bold = true })
  set("NotifyDEBUGTitle", { fg = p.teal, bold = true })
  set("NotifyERRORIcon", { fg = p.red })
  set("NotifyWARNIcon",  { fg = p.yellow })
  set("NotifyINFOIcon",  { fg = p.blue })
  set("NotifyDEBUGIcon", { fg = p.teal })

  -- Hop / Leap (for word motion highlights)
  set("HopNextKey", { fg = p.peach, bold = true })
  set("HopNextKey1", { fg = p.mauve, bold = true })
  set("HopNextKey2", { fg = p.blue, bold = true })
  set("HopPreview", { fg = p.text, bg = p.surface1 })
  set("HopPreviewTimeout", { fg = p.overlay1, bg = p.surface0 })

  -- marks
  set("MarkSign", { fg = p.peach, bg = p.mantle })
  set("MarkLine", { bg = p.surface0 })

  -- Dashboard / Alpha
  set("AlphaHeader", { fg = p.yellow, bold = true })
  set("AlphaShortcut", { fg = p.blue })
  set("AlphaFooter", { fg = p.overlay1, italic = true })

  -- Lualine
  -- (No hard link to bg so it follows the editor surface automatically.)
  set("LualineNormalMode",  { fg = p.base, bg = p.peach, bold = true })
  set("LualineInsertMode",  { fg = p.base, bg = p.green, bold = true })
  set("LualineVisualMode",  { fg = p.base, bg = p.mauve, bold = true })
  set("LualineReplaceMode", { fg = p.base, bg = p.red, bold = true })
  set("LualineCommandMode", { fg = p.base, bg = p.yellow, bold = true })
  set("LualineTerminalMode",{ fg = p.base, bg = p.blue, bold = true })

  -- Lightspeed.nvim / flash.nvim
  set("FlashBackdrop", { fg = p.overlay0 })
  set("FlashLabel", { fg = p.base, bg = p.peach, bold = true })
  set("FlashMatch", { fg = p.peach, bold = true })

  -- Apply terminal / terminal colors via g:terminal_color_*
  vim.g.terminal_color_0  = p.crust
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.mauve
  vim.g.terminal_color_6  = p.teal
  vim.g.terminal_color_7  = p.text
  vim.g.terminal_color_8  = p.overlay0
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.mauve
  vim.g.terminal_color_14 = p.teal
  vim.g.terminal_color_15 = p.text
  end

return M
