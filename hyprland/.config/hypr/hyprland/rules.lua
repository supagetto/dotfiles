-- ┏━━━━━━━┓
-- ┃ rules ┃
-- ┗━━━━━━━┛

local main = function()
  hl.window_rule({
    opacity = '0.80 0.80',
    match = { class = '^(discord|spotify|steam|steamwebhelper)$' },
  })

  hl.window_rule({
    opacity = '0.90 0.90',
    match = { class = '^(chromium)$' },
  })

  hl.layer_rule({
    name = 'no-anim-selection',
    no_anim = true,
    match = { namespace = 'selection' },
  })
end

main()
