-- ┏━━━━━━━━━━┓
-- ┃ hyprland ┃
-- ┗━━━━━━━━━━┛

require('hyprland.envs')
require('hyprland.execs')
require('hyprland.variables')
require('hyprland.monitors')
require('hyprland.rules')
require('hyprland.animations')
require('hyprland.binds')

local local_config = os.getenv('HOME') .. '/.config/local/hyprland.lua'
local local_config_file = io.open(local_config, 'r')
if local_config_file then
  local_config_file:close()
  dofile(local_config)
end
