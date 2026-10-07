-- plugin/littleprince.lua - keeps highlight groups sticky.
-- Some plugins call `:hi clear` on their own; this autocmd re-applies
-- the active littleprince flavour whenever the ColorScheme event fires.

local valid_flavours = { prince = true, rose = true, fox = true, sheep = true }

local function active_flavour()
  local name = vim.g.colors_name
  if not name then return nil end
  if name == "littleprince" then
    return "prince"
  end
  if name:match("^littleprince%-") then
    local f = name:gsub("^littleprince%-", "")
    if valid_flavours[f] then return f end
  end
  return nil
end

local group = vim.api.nvim_create_augroup("littleprince_autocmds", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = function(args)
    if args and args.match and args.match:match("^littleprince") then
      return
    end
    local flavour = active_flavour()
    if flavour then
      require("littleprince").colorscheme(flavour)
    end
  end,
})
