-- ┏━━━━━━━━━━┓
-- ┃ voxtype  ┃
-- ┗━━━━━━━━━━┛

local voxtype = os.getenv("HOME") .. "/.cargo/bin/voxtype"

hs.hotkey.bind({ "ctrl", "alt" }, "d", function()
  hs.task.new(voxtype, nil, { "record", "toggle" }):start()
end)
