-- ┏━━━━━━━┓
-- ┃ binds ┃
-- ┗━━━━━━━┛

local main = function()
  -- ━ General ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.bind('SUPER + Q', hl.dsp.window.close())
  hl.bind('SUPER + F', hl.dsp.window.float({ action = 'toggle' }))
  hl.bind('SUPER + V', hl.dsp.layout('togglesplit'))
  hl.bind('SUPER + Return', hl.dsp.window.fullscreen())
  hl.bind('SUPER + CTRL + ALT + Delete', hl.dsp.exit())

  -- ━ Functions ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- Brightness
  hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightness increase 5%'), { locked = true, repeating = true })
  hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightness decrease 5%'), { locked = true, repeating = true })

  -- Volume
  hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('volume decrease 2%'), { locked = true, repeating = true })
  hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('volume increase 2%'), { locked = true, repeating = true })
  hl.bind('XF86AudioMute', hl.dsp.exec_cmd('volume mute'), { locked = true })
  hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('volume mute -i'), { locked = true })
  hl.bind('SHIFT + XF86AudioLowerVolume', hl.dsp.exec_cmd('volume decrease -i 2%'), { locked = true, repeating = true })
  hl.bind('SHIFT + XF86AudioRaiseVolume', hl.dsp.exec_cmd('volume increase -i 2%'), { locked = true, repeating = true })

  -- Screenshot
  hl.bind('Print', hl.dsp.exec_cmd('screenshot area'))
  hl.bind('CTRL + Print', hl.dsp.exec_cmd('screenshot screen'))
  hl.bind('ALT + Print', hl.dsp.exec_cmd('screenshot window'))
  hl.bind('SUPER + P', hl.dsp.exec_cmd('screenshot area'))
  hl.bind('SUPER + CTRL + P', hl.dsp.exec_cmd('screenshot screen'))
  hl.bind('SUPER + ALT + P', hl.dsp.exec_cmd('screenshot window'))

  -- ━ Applications ━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.bind('SUPER + T', hl.dsp.exec_cmd('alacritty'))
  hl.bind('SUPER + B', hl.dsp.exec_cmd('zen-browser'))
  hl.bind('SUPER + grave', hl.dsp.exec_cmd('resource_monitor'))
  hl.bind('SUPER + C', hl.dsp.exec_cmd('color_picker'))

  -- ━ Windows ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- Focus
  hl.bind('SUPER + H', hl.dsp.focus({ direction = 'left' }))
  hl.bind('SUPER + J', hl.dsp.focus({ direction = 'down' }))
  hl.bind('SUPER + K', hl.dsp.focus({ direction = 'up' }))
  hl.bind('SUPER + L', hl.dsp.focus({ direction = 'right' }))

  -- Move
  hl.bind('SUPER + ALT + H', hl.dsp.window.move({ direction = 'left' }))
  hl.bind('SUPER + ALT + J', hl.dsp.window.move({ direction = 'down' }))
  hl.bind('SUPER + ALT + K', hl.dsp.window.move({ direction = 'up' }))
  hl.bind('SUPER + ALT + L', hl.dsp.window.move({ direction = 'right' }))

  -- Resize by 2% of the active monitor (measured at config load)
  local monitor = hl.get_active_monitor() or { width = 1920, height = 1200 }
  local step_x = math.floor(monitor.width * 0.02)
  local step_y = math.floor(monitor.height * 0.02)
  hl.bind('SUPER + SHIFT + H', hl.dsp.window.resize({ x = -step_x, y = 0, relative = true }), { repeating = true })
  hl.bind('SUPER + SHIFT + J', hl.dsp.window.resize({ x = 0, y = step_y, relative = true }), { repeating = true })
  hl.bind('SUPER + SHIFT + K', hl.dsp.window.resize({ x = 0, y = -step_y, relative = true }), { repeating = true })
  hl.bind('SUPER + SHIFT + L', hl.dsp.window.resize({ x = step_x, y = 0, relative = true }), { repeating = true })

  -- ━ Workspaces ━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- Move to a workspace
  for i = 1, 10 do
    local key = i % 10
    hl.bind('SUPER + ' .. key, hl.dsp.focus({ workspace = i }))
  end
  hl.bind('SUPER + S', hl.dsp.workspace.toggle_special())
  hl.bind('SUPER + Tab', hl.dsp.focus({ workspace = 'e+1' }))
  hl.bind('SUPER + SHIFT + Tab', hl.dsp.focus({ workspace = 'e-1' }))

  -- Move active window to a workspace
  for i = 1, 10 do
    local key = i % 10
    hl.bind('SUPER + ALT + ' .. key, hl.dsp.window.move({ workspace = i, follow = false }))
  end
  hl.bind('SUPER + ALT + S', hl.dsp.window.move({ workspace = 'special', follow = false }))
  hl.bind('SUPER + ALT + Tab', hl.dsp.window.move({ workspace = '+1', follow = false }))
  hl.bind('SUPER + ALT + SHIFT + Tab', hl.dsp.window.move({ workspace = '-1', follow = false }))

  -- ━ Mouse ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- Move window
  hl.bind('SUPER + mouse:272', hl.dsp.window.drag(), { mouse = true })

  -- Resize window
  hl.bind('SUPER + mouse:273', hl.dsp.window.resize(), { mouse = true })

  -- Scroll through existing workspaces
  hl.bind('SUPER + mouse_up', hl.dsp.focus({ workspace = 'e+1' }))
  hl.bind('SUPER + mouse_down', hl.dsp.focus({ workspace = 'e-1' }))
end

main()
