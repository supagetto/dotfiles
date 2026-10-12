-- ┏━━━━━━━━━━┓
-- ┃ voxtype  ┃
-- ┗━━━━━━━━━━┛

local voxtype = os.getenv('HOME') .. '/.cargo/bin/voxtype'
local HOLD_THRESHOLD_SECS = 0.3

local isFnDown = false
local recordingStartedAtSecs = nil

local function runVoxtype(args) hs.task.new(voxtype, nil, args):start() end

local function onFnPressed()
  local status = hs.execute(voxtype .. ' status'):gsub('%s+$', '')

  if status == 'recording' then
    runVoxtype({ 'record', 'stop' })
    return
  end

  if status == 'transcribing' or status == 'stopped' then return end

  runVoxtype({ 'record', 'start' })
  recordingStartedAtSecs = hs.timer.secondsSinceEpoch()
end

local function onFnReleased()
  if recordingStartedAtSecs == nil then return end

  local heldSecs = hs.timer.secondsSinceEpoch() - recordingStartedAtSecs
  recordingStartedAtSecs = nil

  if heldSecs >= HOLD_THRESHOLD_SECS then runVoxtype({ 'record', 'stop' }) end
end

-- Global so it is not garbage-collected.
fnWatcher = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  local isFnNowDown = event:getFlags().fn == true

  if isFnNowDown and not isFnDown then
    onFnPressed()
  elseif isFnDown and not isFnNowDown then
    onFnReleased()
  end

  isFnDown = isFnNowDown
  return false
end)
fnWatcher:start()
