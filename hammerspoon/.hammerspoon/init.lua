-- ┏━━━━━━━━━━┓
-- ┃ voxtype  ┃
-- ┗━━━━━━━━━━┛

local voxtype = os.getenv('HOME') .. '/.cargo/bin/voxtype'
local HOLD_THRESHOLD_SECS = 0.3
local RIGHT_CTRL_KEYCODE = hs.keycodes.map.rightctrl

local isRightCtrlDown = false
local recordingStartedAtSecs = nil

local function runVoxtype(args) hs.task.new(voxtype, nil, args):start() end

local function onRightCtrlPressed()
  local status = hs.execute(voxtype .. ' status'):gsub('%s+$', '')

  if status == 'recording' then
    runVoxtype({ 'record', 'stop' })
    return
  end

  if status == 'transcribing' or status == 'stopped' then return end

  runVoxtype({ 'record', 'start' })
  recordingStartedAtSecs = hs.timer.secondsSinceEpoch()
end

local function onRightCtrlReleased()
  if recordingStartedAtSecs == nil then return end

  local heldSecs = hs.timer.secondsSinceEpoch() - recordingStartedAtSecs
  recordingStartedAtSecs = nil

  if heldSecs >= HOLD_THRESHOLD_SECS then runVoxtype({ 'record', 'stop' }) end
end

-- Global so it is not garbage-collected.
rightCtrlWatcher = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  if event:getKeyCode() ~= RIGHT_CTRL_KEYCODE then return false end

  local isRightCtrlNowDown = event:getFlags().ctrl == true

  if isRightCtrlNowDown and not isRightCtrlDown then
    onRightCtrlPressed()
  elseif isRightCtrlDown and not isRightCtrlNowDown then
    onRightCtrlReleased()
  end

  isRightCtrlDown = isRightCtrlNowDown
  return false
end)
rightCtrlWatcher:start()
