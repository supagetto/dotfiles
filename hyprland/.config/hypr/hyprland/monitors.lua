-- ┏━━━━━━━━━━┓
-- ┃ monitors ┃
-- ┗━━━━━━━━━━┛

local main = function()
  -- ━ Extend ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- Plugged-in displays (monitor, projector, TV) extend the desktop
  -- automatically. Run `hyprctl monitors` to list display names: the laptop
  -- screen is usually eDP-1, external ones HDMI-A-1 or DP-1.
  --
  -- output   ''        applies to every display
  -- mode     highres   highest resolution the display supports
  -- position auto      places it beside the others (this is what extends)
  -- scale    auto      picks a sane zoom level
  hl.monitor({
    output = '',
    mode = 'highres',
    position = 'auto',
    scale = 'auto',
  })

  -- ━ Mirror ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- To show a copy of the laptop screen on the external display, uncomment
  -- this and run `hyprctl reload`. Swap eDP-1 if the laptop screen differs.
  -- Both screens drop to a shared resolution, usually the external's.
  -- Comment it out again and reload to go back to extend.
  --
  -- hl.monitor({
  --   output = 'HDMI-A-1',
  --   mode = 'preferred',
  --   position = 'auto',
  --   scale = 1,
  --   mirror = 'eDP-1',
  -- })
end

main()
