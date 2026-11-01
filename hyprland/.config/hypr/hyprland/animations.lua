-- ┏━━━━━━━━━━━━┓
-- ┃ animations ┃
-- ┗━━━━━━━━━━━━┛

local main = function()
  -- ━ Curves ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.curve('easeOutQuart', {
    type = 'bezier',
    points = { { 0.190, 0.91 }, { 0.37, 1 } },
  })

  -- ━ Windows ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.animation({
    leaf = 'windows',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
    style = 'slide',
  })
  hl.animation({
    leaf = 'windowsIn',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
    style = 'popin',
  })
  hl.animation({
    leaf = 'windowsOut',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
    style = 'popin 70%',
  })

  -- ━ Fade ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.animation({
    leaf = 'fade',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
  })
  hl.animation({
    leaf = 'fadeIn',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
  })
  hl.animation({
    leaf = 'fadeOut',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
  })

  -- ━ Workspaces ━━━━━━━━━━━━━━━━━━━━━━━━━━━

  hl.animation({
    leaf = 'workspaces',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
    style = 'slide',
  })
  hl.animation({
    leaf = 'specialWorkspace',
    enabled = true,
    speed = 5,
    bezier = 'easeOutQuart',
    style = 'slidevert',
  })
end

main()
