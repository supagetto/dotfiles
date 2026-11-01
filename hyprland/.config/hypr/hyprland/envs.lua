-- ┏━━━━━━┓
-- ┃ envs ┃
-- ┗━━━━━━┛

local main = function()
  -- ━ General ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.env('XDG_CURRENT_DESKTOP', 'Hyprland')
  hl.env('XDG_SESSION_TYPE', 'wayland')
  hl.env('XDG_SESSION_DESKTOP', 'Hyprland')

  -- ━ Cursor ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.env('HYPRCURSOR_THEME', 'phinger')
  hl.env('HYPRCURSOR_SIZE', '24')
  hl.env('XCURSOR_THEME', 'phinger')
  hl.env('XCURSOR_SIZE', '24')

  -- ━ Slurp ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.env('SLURP_ARGS', '-c 708090FF -b DEEEED00 -B 0A0A0A33')
end

main()
