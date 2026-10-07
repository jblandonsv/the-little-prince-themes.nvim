-- palette.lua - returns the active palette based on the configured flavour.

local M = {}

local palettes = {
  prince = "littleprince.palettes.prince",
  rose   = "littleprince.palettes.rose",
  fox    = "littleprince.palettes.fox",
  sheep  = "littleprince.palettes.sheep",
}

function M.get(name)
  local flavour = name or "prince"
  local modpath = palettes[flavour]
  if not modpath then
    vim.notify(
      string.format("[littleprince] unknown flavour '%s', falling back to 'prince'",
        tostring(flavour)),
      vim.log.levels.WARN
    )
    modpath = palettes.prince
  end
  local ok, pal = pcall(require, modpath)
  if not ok then
    error("[littleprince] could not load palette: " .. tostring(pal))
  end
  return pal
end

return M
