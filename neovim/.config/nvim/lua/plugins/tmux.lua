-- ┏━━━━━━┓
-- ┃ tmux ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'aserowy/tmux.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { { 'n', 'x', 'o' }, '<C-S-Left>', require('tmux').resize_left },
    { { 'n', 'x', 'o' }, '<C-S-Down>', function() require('tmux').resize_bottom() end },
    { { 'n', 'x', 'o' }, '<C-S-Up>', function() require('tmux').resize_top() end },
    { { 'n', 'x', 'o' }, '<C-S-Right>', function() require('tmux').resize_right() end }
  )
end

M.opts = function()
  return {
    resize = {
      enable_default_keybindings = false,
    },
    copy_sync = {
      redirect_to_clipboard = true,
    },
  }
end

M.config = function(_, opts)
  require('tmux').setup(opts)

  -- tmux next-3.9 reports #{window_layout} as JSON, which tmux.nvim's
  -- layout parser cannot read. Ask tmux for the pane edges instead.
  local sides = { h = 'left', j = 'bottom', k = 'top', l = 'right' }
  require('tmux.layout').is_border = function(direction)
    local format = '#{pane_at_' .. sides[direction] .. '}'
    return vim.trim(vim.fn.system({ 'tmux', 'display-message', '-p', format })) == '1'
  end
end

return M
