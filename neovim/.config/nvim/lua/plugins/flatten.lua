-- ┏━━━━━━━━━┓
-- ┃ flatten ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'willothy/flatten.nvim'

M.lazy = false

M.priority = 1001

M.opts = function()
  return {
    window = {
      open = 'alternate',
    },
  }
end

return M
